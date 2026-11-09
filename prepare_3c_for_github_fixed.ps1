$ErrorActionPreference = 'Stop'
$root = 'C:\3C'

$aims = [ordered]@{
    'hello_world'    = 'To create and run a basic Flutter application displaying Hello, World.'
    'experiment_2a'  = 'To demonstrate Flutter widgets including Center, Image, Text, and Container.'
    'experiment_2b'  = 'To demonstrate the Row, Column, and Stack layout widgets in Flutter.'
    'experiment_3a'  = 'To design a responsive user interface using Flutter layout widgets.'
    'experiment_3b'  = 'To implement a responsive Flutter interface for desktop, tablet, and mobile screens.'
    'experiment_4a'  = 'To demonstrate navigation using Navigator push and pop.'
    'experiment_4b'  = 'To demonstrate navigation using named routes in Flutter.'
    'experiment_5a1' = 'To create and use a StatelessWidget in Flutter.'
    'experiment_5a2' = 'To create a StatefulWidget and update its interface using state.'
    'experiment_5b1' = 'To manage application state using setState in Flutter.'
    'experiment_5b2' = 'To manage application state using the Provider package.'
    'experiment_6a'  = 'To create and reuse custom widgets in Flutter.'
    'experiment_6b'  = 'To create reusable custom widgets and apply themes in Flutter.'
    'experiment_7a'  = 'To design and implement a basic registration form in Flutter.'
    'experiment_7b'  = 'To implement form validation in a Flutter registration form.'
    'experiment_8a'  = 'To implement a basic animation in Flutter.'
    'experiment_8b'  = 'To demonstrate multiple animations in a Flutter application.'
    'experiment_9a'  = 'To fetch and display user data from a REST API using Flutter.'
    'experiment_9b'  = 'To fetch user data from a REST API and display detailed user information.'
    'experiment_10'  = 'To implement a registration form and verify it using Flutter widget tests.'
}

@'
# Flutter Lab Record - 3C

This repository contains 20 independent Flutter experiment projects. Each experiment is self-contained.

## Experiments and aims
'@ | Set-Content -Encoding UTF8 (Join-Path $root 'README.md')

foreach ($name in $aims.Keys) {
    $dir = Join-Path $root $name
    if (!(Test-Path (Join-Path $dir 'pubspec.yaml'))) {
        Write-Warning "Skipping $name - pubspec.yaml not found"
        continue
    }

    $main = Join-Path $dir 'lib\main.dart'
    if (Test-Path $main) {
        $source = Get-Content $main -Raw
        if ($source -notmatch 'EXPERIMENT:') {
            $comment = "/*`r`nEXPERIMENT: $name`r`nAIM: $($aims[$name])`r`n*/`r`n`r`n"
            Set-Content -Path $main -Value ($comment + $source) -Encoding UTF8
        }
    } else {
        Write-Warning "No lib\main.dart found for $name; AIM comment not inserted"
    }

    $readme = @"
# $name

## AIM
$($aims[$name])

## Run
Install Flutter, open this folder in a terminal, then run:

    flutter pub get
    flutter run

Main source: lib/main.dart
Dependencies: pubspec.yaml and pubspec.lock
"@
    Set-Content -Path (Join-Path $dir 'README.md') -Value $readme -Encoding UTF8

    $bat = @'
@echo off
cd /d "%~dp0"
flutter pub get
if errorlevel 1 pause & exit /b 1
flutter run
if errorlevel 1 pause
'@
    Set-Content -Path (Join-Path $dir 'RUN_EXPERIMENT.bat') -Value $bat -Encoding ASCII
    Add-Content -Path (Join-Path $root 'README.md') -Value "`r`n- **$name** - $($aims[$name])"
    Write-Host "Prepared $name" -ForegroundColor Green
}

@'
# Flutter generated files and caches
**/build/
**/.dart_tool/
**/.flutter-plugins
**/.flutter-plugins-dependencies
**/.packages
**/coverage/
.dart_tool/
.idea/
.vscode/
/flutter/
'@ | Set-Content -Path (Join-Path $root '.gitignore') -Encoding ASCII

Write-Host ''
Write-Host 'Preparation complete. Project folders and source code were kept.' -ForegroundColor Cyan
Write-Host 'Generated build/cache folders are excluded from GitHub.' -ForegroundColor Cyan
