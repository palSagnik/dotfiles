#!/bin/sh
# Clone a tmux plugin if absent, then run its entry scripts.
# Usage: plugin.sh <github-user>/<repo>
set -eu

plugins_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/plugins"
plugin_dir="$plugins_dir/${1##*/}"

if [ ! -d "$plugin_dir" ]; then
	mkdir -p "$plugins_dir"
	git clone --depth 1 --quiet "https://github.com/$1" "$plugin_dir"
fi

for entry in "$plugin_dir"/*.tmux; do
	if [ -x "$entry" ]; then
		"$entry"
	fi
done

exit 0
