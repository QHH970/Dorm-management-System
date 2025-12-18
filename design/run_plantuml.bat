@echo off
REM Run PlantUML for all .puml files in this folder.
cd /d %~dp0

setlocal enabledelayedexpansion
set JAR=
for %%f in (plantuml*.jar) do (
  set JAR=%%f
  goto :foundJar
)
:foundJar
if defined JAR (
  echo Found local !JAR!, using Java to render (.png/.svg will be created).
  java -Xmx512m -jar "%~dp0!JAR!" *.puml
 ) else (
  echo plantuml.jar not found in this folder.
  if exist render_plantuml.py (
    echo Using Python script to request PlantUML public server (requires network).
    python "%~dp0render_plantuml.py"
  ) else (
    echo No renderer found: place plantuml.jar here or ensure render_plantuml.py exists.
  )
)

echo Done.
pause
