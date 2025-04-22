#!/bin/bash

# Utility script with common functions

# Run MVC Accelerator
run-litium-mvc() {
    local project_path=$(find Src/Litium.Accelerator.Mvc -name "*.csproj" | head -n 1)
    if [[ -n $project_path ]]; then
        dotnet run --environment Development --project $project_path --urls "http://*:5000;https://*:5001"
    else
        echo "project path not found"
    fi
}

# Create a backup of a file
backup_file() {
    if [[ -f "$1" ]]; then
        cp "$1" "$1.bak"
        echo "Backup created: $1.bak"
    else
        echo "File not found: $1"
    fi
}
