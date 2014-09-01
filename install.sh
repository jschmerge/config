#!/bin/bash

rootLocation=$(dirname $0)
rootLocation=$(realpath $rootLocation)

echo "Base location = $rootLocation"

for file in ${rootLocation}/dotfiles/*
do
	echo "Processing ${file}..."
	name=$(basename $file)
	destination="${HOME}/.${name}"
	skip=1

#	[ -f ${destination} ] && echo a
#	[ -L ${destination} ] && echo b
#	[ -L ${destination} ] && echo c
#	[ -e ${destination} ] && echo d
	if [ -f ${destination} -a ! -L ${destination} ]
	then
		echo "  Backing up current ${destination} to ${destination}.bak"
		[ -e "${destination}.bak" ] && rm -vf "${destination}.bak"
		mv ${destination} ${destination}.bak
		skip=0
	elif [ -L ${destination} ]
	then
		echo "  Removing symlink ${destination}"
		rm -f ${destination}
		skip=0
	elif [ -e ${destination} ]
	then
		echo "  Skipping install over the following destination:"
		ls -l ${destination}
	else
		echo "  Creating new symlink:"
		skip=0
	fi

	if [ "$skip" != 1 ]
	then
		ln -s ${file} ${destination}
	fi

done
