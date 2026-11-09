
$projects = @(
    "hello_world",
    "experiment_2a", "experiment_2b",
    "experiment_3a", "experiment_3b",
    "experiment_4a", "experiment_4b",
    "experiment_5a1", "experiment_5a2",
    "experiment_5b1", "experiment_5b2",
    "experiment_6a", "experiment_6b",
    "experiment_7a", "experiment_7b",
    "experiment_8a", "experiment_8b",
    "experiment_9a", "experiment_9b",
    "experiment_10"
)

$root = "C:\3C"
$failed = @()

foreach ($project in $projects) {
    $path = Join-Path $root $project
    Write-Host "`nBuilding $project..." -ForegroundColor Cyan

    Push-Location $path
    flutter build windows

    if ($LASTEXITCODE -ne 0) {
        $failed += $project
        Pop-Location
        continue
    }

    $exe = Get-ChildItem "$path\build\windows" -Filter "$project.exe" -Recurse -ErrorAction SilentlyContinue |
           Select-Object -First 1

    if ($exe) {
        Start-Process -FilePath $exe.FullName
        Write-Host "Launched $project" -ForegroundColor Green
    } else {
        $failed += "$project (EXE not found)"
    }

    Pop-Location
}

Write-Host "`nAll projects processed."
if ($failed.Count -gt 0) {
    Write-Host "Failed projects: $($failed -join ', ')" -ForegroundColor Red
}
