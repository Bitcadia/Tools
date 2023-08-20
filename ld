#!/bin/bash

# Execute the command and capture its output
output=$(zig env)

# Extract the value of the "lib_dir" property using jq
lib_dir=$(echo "$output" | jq -r '.lib_dir')

# Print the value of "lib_dir"
echo "$lib_dir"
