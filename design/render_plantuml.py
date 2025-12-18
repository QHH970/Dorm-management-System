import zlib
import base64
import sys
import urllib.request

# PlantUML encode: deflate then use plantuml's custom base64
# Reference implementation adapted for Python

def encode_plantuml(plantuml_text: str) -> str:
    data = plantuml_text.encode('utf-8')
    zlibbed_str = zlib.compress(data)[2:-4]
    return _encode6bit(zlibbed_str)

# custom encode

def _encode6bit(data: bytes) -> str:
    # use plantuml's custom base64 alphabet
    chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_"
    res = []
    i = 0
    bit_len = len(data) * 8
    value = 0
    bits = 0
    for b in data:
        value = (value << 8) | b
        bits += 8
        while bits >= 6:
            bits -= 6
            index = (value >> bits) & 0x3F
            res.append(chars[index])
    if bits > 0:
        index = (value << (6 - bits)) & 0x3F
        res.append(chars[index])
    return ''.join(res)


def fetch_and_save(url: str, out_path: str):
    try:
        with urllib.request.urlopen(url, timeout=20) as resp:
            data = resp.read()
        with open(out_path, 'wb') as f:
            f.write(data)
        print(f"Saved {out_path}")
    except Exception as e:
        print(f"Failed to fetch {url}: {e}")


if __name__ == '__main__':
    import os
    script_dir = os.path.dirname(os.path.abspath(__file__))
    # Render all .puml files in this directory
    server = 'https://www.plantuml.com/plantuml'
    found = False
    for fname in os.listdir(script_dir):
        if fname.lower().endswith('.puml'):
            found = True
            puml_path = os.path.join(script_dir, fname)
            print(f"Encoding {puml_path} ...")
            with open(puml_path, 'r', encoding='utf-8') as f:
                text = f.read()
            encoded = encode_plantuml(text)
            base_name = os.path.splitext(fname)[0]
            png_url = f"{server}/png/{encoded}"
            svg_url = f"{server}/svg/{encoded}"
            out_png = os.path.join(script_dir, base_name + '.png')
            out_svg = os.path.join(script_dir, base_name + '.svg')
            print(f'Requesting PNG for {fname}...')
            fetch_and_save(png_url, out_png)
            print(f'Requesting SVG for {fname}...')
            fetch_and_save(svg_url, out_svg)
    if not found:
        print('No .puml files found in design/; nothing to render.')
    else:
        print('All .puml files processed.')
