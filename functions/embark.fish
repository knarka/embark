function embark --description 'embark to a known harbor'
	set -l harbors (string join '' $HOME '/.config/fisherman/embark/harbors')
	set -l usage "Usage: embark <a> - set sail to harbor 'a'"

	if not test -e $harbors
		mkdir $harbors
	end

	if test -z $argv[1]; echo $usage; return; end

	set -l harbor (string join '/' $harbors $argv[1])
	if not test -e $harbor
		echo "Ye can't sail to a harbor that doesn't exist, matey."
		return
	end

	cd $harbor
end
