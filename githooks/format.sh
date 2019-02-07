#!/bin/bash

set -eu

readonly CLANG_FORMAT=clang-format

if [[ ! -x "$CLANG_FORMAT" ]]; then
	printf "clang-format is not found:\n"
	printf "\t$ sudo apt-get install clang-format\n"
	exit 1
fi

readonly REPO_DIR="$(dirname "$(readlink -f "$0")")"
pushd "$REPO_DIR/.." 1>/dev/null 2>&1

for file in $(find . -iname "*.cpp"); do
	printf "formatting: $file\n"
	"$CLANG_FORMAT" -i "$file"
done

for file in $(find . -iname "*.hpp"); do
	printf "formatting: $file\n"
	"$CLANG_FORMAT" -i "$file"
done

for file in $(find . -iname "*.h"); do
	printf "formatting: $file\n"
	"$CLANG_FORMAT" -i "$file"
done
