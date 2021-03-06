#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "usage: ./localization source_dir localization_file_path"
	exit 1
fi

SEARCHDIR=$1
LOCALIZATION_FILE=$2

FILES=`find $SEARCHDIR -name "*.ts" -or -name "*.html"`
MATCHES1=`egrep -o -e "l\(\"[^\"]*\"\)" $FILES | sed "s/\"/'/g"`
MATCHES2=`egrep -o -e "l\('[^']*'\)" $FILES`
MATCHES=$MATCHES1+$MATCHES2

REGEX="(.*)\:l\('([^']*)'\)$"
FOUND=0
for match in ${MATCHES[@]}; do
	if [[ $match =~ $REGEX ]]; then
		printf "Checking for ${BASH_REMATCH[2]}"
		if ! grep -q -e "name=\"${BASH_REMATCH[2]}\"" $LOCALIZATION_FILE; then
			printf "\033[32767D\033[2K"
			printf "Name \033[1;31m${BASH_REMATCH[2]}\033[0m in file ${BASH_REMATCH[1]}\n"
			((FOUND++))
		else
			printf "\033[2K\033[32767D"
		fi
	fi
done

if [[ $FOUND -ne 0 ]]; then
	printf "\033[31m%d unlocalized names found" $FOUND
else
	printf "\033[32mNo unlocalized names found"
fi
