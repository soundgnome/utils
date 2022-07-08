export MARKPATH=$HOME/.local/marks

# Copied almost verbatim from https://datascienceworkshops.com/blog/quickly-navigate-your-filesystem-from-the-command-line/


function jd {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark {
	rm -i "$MARKPATH/$1"
}

function marks {
	ls -l $MARKPATH | awk '{print $9 "\t->  " $11}'
}

function completemarks {
	local curw=${COMP_WORDS[COMP_CWORD]}
	local wordlist=$(find $MARKPATH -type l -printf "%f\n")
	COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
	return 0
}

complete -F completemarks jd unmark
