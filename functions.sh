#!/bin/bash

echo "Configuring fabric functions"

declare -A devops
devops[research]="research"
devops[script]="create_bash_script"
devops[shortcuts]="find_keyboard_shortcuts"
devops[tools]="improve_tool"
devops[bug]="solve_problem"
devops[installit]="install"
devops[ask]="ask"
devops[whatis]="whatis"

declare -A icons
devops[research]="🔍"
devops[script]="💻"
devops[shortcuts]="⌨️"
devops[tools]="🛠️"
devops[bug]="solve_problem"
devops[installit]="install"
devops[ask]="ask"
devops[whatis]="whatis"

function _fabric() {
  local class=$1
  local prompt="$2"
  local ts=$(date +"%Y-%m-%d-%H-%M-%S")
  local name="${ts}-$class"
  local output="$name-output"
  local outputFile="$output.md"
  local mdFile="$name.md"
  local digestFile="$BRAIN/$(date +"%Y-%m-%d")-digest.md"
  local res=$(fabric -p devops/${devops[$class]} --model "gpt-4o" --text "$prompt")
  local summary=$(fabric -p summarize_micro --model "gpt-4o" --text "$prompt")
  echo "Writing output file"
  echo "$res" > "$BRAIN/$outputFile"
  echo "Writing digest"
  echo " - $ts - [$class](./$mdFile)" >> "$digestFile"
  echo "writing $mdFile"
  cat <<EOF > "$BRAIN/$mdFile"
---
title: "Prompt"
date: $ts
tags: ["automatic", "store", "prompt", "$class", "${devops[class]}"]
---
# $class

**Date and Time:** $ts

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

export -f research
export -f script
export -f shortcuts
export -f tools
export -f bug
export -f installit
export -f ask
export -f whatis