# PlantUML 渲染说明（design 目录）

此文档说明如何在本地使用 `plantuml.jar` 渲染 `design/` 目录下的 `.puml` 文件（生成 PNG/SVG）。

前提要求
- 已安装 Java（建议 64-bit Java 11 或 17）。可在命令行运行 `java -version` 验证。
- 已把 `plantuml.jar` 放到本目录 `design/`（你已完成此步骤）。

推荐 plantuml.jar 下载地址
- 官方 GitHub Release（直接下载 jar）：
  https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar
- PlantUML 官方页面（说明与镜像）：
  https://plantuml.com/zh/download

如何运行（使用 `run_plantuml.bat`）
1. 打开 `cmd.exe`（建议以普通用户即可），并切换到项目 `design` 目录：
```bat
cd /d d:\Java_project\springboot+vue高校宿舍管理系统\design
```
2. 运行批处理（会使用 `plantuml.jar` 本地渲染；若未找到 jar 则会回退到 Python 脚本调用公共服务器）:
```bat
run_plantuml.bat
```
3. 输出文件：脚本会对当前目录下所有 `*.puml` 文件调用 PlantUML，并在同目录生成对应的 `.png` 和 `.svg` 文件（例如 `use_case_diagram.png`、`sequence_diagrams.svg` 等）。

如果你想手动运行（更精细控制内存）
```bat
cd /d d:\Java_project\springboot+vue高校宿舍管理系统\design
java -Xmx512m -jar plantuml.jar path_to_file.puml
```
或对多个文件一次渲染：
```bat
java -Xmx512m -jar plantuml.jar *.puml
```

常见问题与解决
- 错误 “Could not create the Java Virtual Machine”：通常与 JVM 启动参数或环境变量有关。可尝试降低 `-Xmx` 值（例如 `-Xmx512m`），或检查 `_JAVA_OPTIONS` / `JAVA_TOOL_OPTIONS` 环境变量是否设置了不合理的 JVM 参数。
- 渲染失败但脚本使用在线服务：如果你的网络或代理限制访问 `https://www.plantuml.com`，在线渲染会失败，建议使用本地 `plantuml.jar`（离线渲染）。
- 如果遇到文件权限或路径问题，请确保 `plantuml.jar` 与要渲染的 `.puml` 文件在同一目录，且运行命令的用户对该目录有写权限。

查看生成图像
- 在 VS Code 中点击打开 `.png` / `.svg` 文件即可预览。
- Windows 资源管理器中双击 `.png` 或在浏览器打开 `.svg`。

如果 `run_plantuml.bat` 执行中出现错误，请把终端的完整输出粘给我，我会分析并给出修复步骤。