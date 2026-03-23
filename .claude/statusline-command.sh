#!/bin/sh
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

if [ -n "$used" ] && [ -n "$remaining" ]; then
  printf "%s | Context: %.0f%% used (%.0f%% remaining)" "$model" "$used" "$remaining"
else
  printf "%s | Context: --" "$model"
fi
