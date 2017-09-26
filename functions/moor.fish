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
			echo "Thar ain't be such a harbor"
			return
		end
		rm $harbor
		echo 'Aye aye!'
	else
		set -l harbor (string join '/' $harbors $argv[1])
		if not test -e $harbor
			ln -s $PWD $harbor
			echo 'Aye aye!'
		else
			echo 'Thar already be a harbor with that name.'
			return
		end
	end
end
