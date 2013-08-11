#!/bin/bash
######################################
# createsymlinkssh.sh
# This script creates symlinks from homedir to config files directory
######################################

####### Variables

DIR=./config-files
BACKUP=./config-files.back
FILES=".vimrc .vim .zshrc .Xdefaults"

########

# Create backup copy of configs in homedir
function create_backup_directory {
	echo "Creating $BACKUP directory for backup any existing dotfiles $(pwd)"
	mkdir -p $BACKUP
	echo "...done"
}

# Move existing files to backup directory

function create_backup {
	for FILE in $FILES; do
		if  [ -f $FILE ];
		then
			if [ ! -d $BACKUP ];
			then
				echo "Backup directory not found..."
				create_backup_directory
			fi
			echo "Moving $FILE to backup directory"
			mv ./$FILE ./$BACKUP/
		fi
	done;
}

# Create symlinks to config files

function create_symlinks {
	for FILE in $FILES; do
		if [ -f $DIR/$FILE -o -d $DIR/$FILE ];
		then
			ln -s $DIR/$FILE $FILE
			echo "Created symlink for $FILE"
		else
			echo "Not found $FILE"
		fi
	done;
}

function vim_install {
    git --git-dir=$DIR submodule update --init
    vim +BundleInstall +qall
}

create_backup
create_symlinks
vim_install
