#!/bin/bash

_mememaker() {
  local cur prev opts memes ng

  _get_comp_words_by_ref cur prev
  preprev="${COMP_WORDS[COMP_CWORD-2]}"

  # Valid upload categories
  #categories="daemons devel editors emulators games gnome i18n kde kernels lib
  #            modules multimedia network office science system x11 xfce"
  memes="$(ls INSTALLDIR/share/mememaker/memes|cut -d'.' -f1)"
  # Valid longopts
  opts="-l --list -s --split -m --meme -t --top -b --bottom -h --help -a --add"

  # nullglob avoids problems when no results are found
  shopt -q nullglob || { shopt -s nullglob; ng=1; }

  	if [[ $cur == -* ]]; then
		COMPREPLY=( $(compgen -W "$opts" -- $cur ) )
	elif [[ $prev == -* ]]; then
		case "$prev" in
		  # complete normally
			"-m"|"--meme") 
			COMPREPLY=($(compgen -W "$memes" -- $cur)) ;;
		  
		  	"-s"|"--split") 
			  	COMPREPLY=($(compgen -W "$memes" -- $cur)) ;;
		  	*) COMPREPLY=($(compgen -W "$opts"  -- $cur)) ;;
		esac
	else
		case "$preprev" in
		  # complete normally
		  	"-s"|"--split") 
			  	COMPREPLY=($(compgen -W "$memes" -- $cur)) ;;
		  	*) COMPREPLY=($(compgen -W "$opts" -- $cur)) ;;
		esac
	fi

  # restore nullglob setting
  [[ $ng ]] && shopt -u nullglob

}

complete -o plusdirs -F _mememaker mememaker
