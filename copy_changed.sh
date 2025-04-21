#!/bin/bash

set -eu
cd `dirname $0`

for i in `find etc -type f`
do
	src="$i"
	src=$(echo "$src" | sed 's/dot\././')
	if [ "$i" = "./.gitignore" ]; then
		continue
	fi
	echo "src=$src"

	[ -f "/$src" ] || {
		echo "WARN: File '/$src' does not exist - IGNORED"
		continue;
	}

	[ -r "/$src" ] || {
		echo "WARN: File '/$src' unreadable - IGNORED"
		ls -l "/$src"
		continue;
	}

	#echo "'$src' -> '$i'"
	diff --color=always -u "$i" "/$src" || {
		echo -n "File $i changed - copy [y/N]?"
		read ans
		case "$ans" in
			y*|Y*)
				cp -v	"/$src" "$i" 
				;;
			*)
				echo "Copy Skipped"
				;;
		esac
	}
done
exit 0
