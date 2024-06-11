#!/bin/bash

echo "Configuring fabric devops functions"

declare -A icons
icons[research]="🔍"
icons[script]="💻"
icons[shortcuts]="⌨️"
icons[tools]="💡"
icons[bug]="🐞"
icons[installit]="🛠️"
icons[ask]="❓"
icons[whatis]="❓"
icons[qq]="❓"

function _fabric() {
  local class=$1
  local prompt="$2"
  local ts=$(date +"%Y-%m-%d-%H-%M-%S")
  local name="${ts}-$class"
  local output="$name-output"
  local outputFile="$output.md"
  local mdFile="$name.md"
  local digestFile="$BRAIN/auto/$(date +"%Y-%m-%d")-digest.md"
  local res=$(fabric -p devops/$class --model "gpt-4o" --text "$prompt")
  local summary=$(fabric -p summarize_micro --model "gpt-4o" --text "$prompt")
  echo "$res" > "$BRAIN/auto/$outputFile"
  echo " - $ts - [$class](./$mdFile)" >> "$digestFile"
  cat <<EOF > "$BRAIN/auto/$mdFile"
---
title: "${icons[$class]} $class"
date: $ts
tags: ["automatic", "store", "prompt", "$class", "${devops[class]}"]
---
# ${icons[$class]} $class

## User Prompt
> $prompt

$summary

## Results
[$class](./$outputFile)
EOF

echo "$res"

}

function research() {
  _fabric 'research' "$1"
}

function script() {
  _fabric 'script'  "$1"
}

function shortcuts() {
  _fabric 'shortcuts'  "$1"
}

function tools() {
  _fabric 'tools'  "$1"
}

function bug() {
  _fabric 'bug'  "$1"
}

function installit() {
  _fabric 'installit'  "$1"
}

function ask() {
  _fabric 'ask' "$1"
}

function whatis() {
  _fabric 'whatis' "$1"
}

function qq() {
  _fabric 'qq' "$1"
}

export -f research
export -f script
export -f shortcuts
export -f tools
export -f bug
export -f installit
export -f ask
export -f whatis
export -f qq