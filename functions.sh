#!/bin/bash

############################################################
# Wrapper around fabric that invokes it then saves/caches
# responses in your 2nd brain. This is quite useful when
# generating scripts, because you can examine the script
# before actually executing it, or you can run it twice
############################################################

echo "Configuring fabric devops functions"

# It's pretty important that this dir exists
mkdir -p $BRAIN/auto

# Just to make things prettier
declare -A icons
icons[research]="🔍" |
icons[script]="💻"
icons[shortcuts]="⌨️"
icons[tools]="💡"
icons[bug]="🐞"
icons[installit]="🛠️"
icons[ask]="❓"
icons[whatis]="❓"
icons[qq]="❓"

# Invokes fabric and caches its responses in your brain
function _fabric() {
  # all the variables
  local class=$1
  local prompt="$2"
  local ts=$(date +"%Y-%m-%d-%H-%M-%S")
  local name="${ts}-$class"
  local output="$name-output"
  local outputFile="$output.md"
  local mdFile="$name.md"
  local digestFile="$BRAIN/auto/$(date +"%Y-%m-%d")-digest.md" # To keep a log of what we generated today
  local res=$(fabric -p devops/$class --model "gpt-4o" --text "$prompt") # This is where we do what was asked of us
  local summary=$(fabric -p summarize_micro --model "gpt-4o" --text "$prompt") # But fabric is so useful we can call it twice

  # Write the files
  echo "$res" > "$BRAIN/auto/$outputFile"
  echo " - [$ts - $class](./$mdFile): $prompt" >> "$digestFile"
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
  _fabric $FUNCNAME "$1"
}

function script() {
  _fabric $FUNCNAME "$1"
}

function shortcuts() {
  _fabric $FUNCNAME "$1"
}

function tools() {
  _fabric $FUNCNAME "$1"
}

function bug() {
  _fabric $FUNCNAME "$1"
}

function installit() {
  _fabric $FUNCNAME "$1"
}

function ask() {
  _fabric $FUNCNAME "$1"
}

function whatis() {
  _fabric $FUNCNAME "$1"
}

function qq() {
  _fabric $FUNCNAME "$1"
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
