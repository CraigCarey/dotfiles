#!/usr/bin/env bash

set -eu

readonly CLANG_FORMAT="$(which clang-format)"

if [[ ! -x "$CLANG_FORMAT" ]]; then
	printf "$CLANG_FORMAT is not found:\n"
	printf "\t$ sudo apt-get install $CLANG_FORMAT\n"
	exit 1
fi

readonly REPO_DIR="$(dirname "$(readlink -f "$0")")"
pushd "$REPO_DIR/.." 1>/dev/null 2>&1

for file in $(find . -iname "*.cpp" -type f); do
	printf "formatting: $file\n"
	"$CLANG_FORMAT" -i "$file"
done

for file in $(find . -iname "*.hpp" -type f); do
	printf "formatting: $file\n"
	"$CLANG_FORMAT" -i "$file"
done

for file in $(find . -iname "*.h" -type f); do
	printf "formatting: $file\n"
	"$CLANG_FORMAT" -i "$file"
done
