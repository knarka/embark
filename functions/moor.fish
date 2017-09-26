function moor --description 'add a harbors to later embark to'
	set -l harbors (string join '' $HOME '/.config/fisherman/embark/harbors')
	set -l usage "Usage: moor <a> - bookmark the current directory as 'a'"\n"OR moor -d <a> - remove bookmark 'a'"

	if not test -e $harbors
		mkdir $harbors
	end

	if test -z $argv[1]; echo $usage; return; end

	if test $argv[1] = "-d"
		if test (count $argv) -lt 2; echo $usage; return; end
		set -l harbor (string join '/' $harbors $argv[2])
		if not test -e $harbor
			echo "No such harbor! Can't remove it then."
			return
		end
		rm $harbor
	else
		set -l harbor (string join '/' $harbors $argv[1])
		if not test -e $harbor
			ln -s $PWD $harbor
			echo 'Aye aye!'
		else
			echo 'That name is already in use!'
			return
		end
	end
end
