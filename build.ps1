# ===== 0. 工具路径（按你的机器实际位置配置）=====
$vcvars64 = 'D:\open\visual_studio\vs\VC\Auxiliary\Build\vcvars64.bat'
$cmake    = 'D:\open\qt\qt_installed\Tools\CMake_64\bin\cmake.exe'
$ninja    = 'D:\open\visual_studio\vs\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja\ninja.exe'
# 想用 Qt 自带 ninja 时，取消下行注释、注释掉上面那行即可：
# $ninja    = 'D:\open\qt\qt_installed\Tools\Ninja\ninja.exe'


#one
cmd /c "call `"$vcvars64`" && set" | ForEach-Object {
    if ($_ -match '^([^=]+)=(.*)$') {
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
}

# 1.5 输出 cl.exe 的位置（确认 MSVC 环境已注入）
Write-Host "cl.exe position: $((Get-Command cl -ErrorAction SilentlyContinue).Source) `n" -ForegroundColor Green

# 1.8 清理旧的 build 目录（避免 CMakeCache 路径不一致 / 旧 .cpp 残留导致 CMake 不重感知源文件）
if (Test-Path build) {
    Write-Host "Cleaning old build/ ..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force build
}

#two
# -G Ninja 指定构建器；-D 覆盖/设置缓存变量（必须用双引号包住 $ninja，PS5 才会展开）
& $cmake -S . -B build -G Ninja `
-DCMAKE_CXX_COMPILER=cl -DCMAKE_MAKE_PROGRAM="$ninja" -DCMAKE_BUILD_TYPE=Release

#three
& $cmake --build build

#four
Write-Host "`ninflux.exe position：$PWD\build\Release\influx.exe" -ForegroundColor Green
