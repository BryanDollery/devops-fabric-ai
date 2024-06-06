#!/bin/bash

echo "Configuring fabric functions"

declare -A devops
devops[research]="research"
devops[script]="create_bash_script"
devops[shortcuts]="find_keyboard_shortcuts"
devops[tools]="improve_tool"
devops[bug]="solve_problem"
devops[installit]="install"


function _fabric() {
  local class=$1
  local cmd="$2"
  local prompt="$3"
  local ts=$(date +"%Y-%m-%d-%H-%M-%S")
  local name="${BRAIN}/${ts}-$class"
  local md="$name.md"
  local summary=$(fabric -p summarize_micro --model "gpt-4o" --text "$prompt")
  local res=$(fabric -p devops/${devops[$class]} --model "gpt-4o" --text "$prompt")
  echo "$res"
  echo "$res" > "$name-output.md"
  cat <<EOF > "$md"

# $class
## $cmd

**Date and Time:** $(date)

## Summary

$summary

## User Prompt
> $prompt

## Results
$res
EOF
}

echo " - $ts - !['$class']('$md')" >> "${BRAIN}/$(date +"%Y-%m-%d")-digest.md"

function research() {
  _fabric 'research' 'research' "$1"
}

function script() {
  _fabric 'script' create_bash_script "$1"
}

function shortcuts() {
  _fabric 'shortcuts' find_keyboard_shortcuts "$1"
}

function tools() {
  _fabric 'tools' improve_tool "$1"
}

function bug() {
  _fabric 'bug' solve_problem "$1"
}

function installit() {
  _fabric 'installit' 'install' "$1"
}

export -f research
export -f script
export -f shortcuts
export -f tools
export -f bug
export -f installit
