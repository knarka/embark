function moor --description 'add a bookmark to later embark to'
	set -l bookmarks (string join '' $HOME '/.config/fisher/github.com/knarka/embark/bookmarks')
	set -l usage "Usage: moor <a> - bookmark the current directory as 'a'"\n"OR moor -d <a> - remove bookmark 'a'"

	if not test -e $bookmarks
		mkdir $bookmarks
	end

	if test -z $argv[1]; echo $usage; return; end

	if test $argv[1] = "-d"
		if test (count $argv) -lt 2; echo $usage; return; end
		set -l bookmark (string join '/' $bookmarks $argv[2])
		if not test -e $bookmark
			echo "Folder does not exist"
			return
		end
		rm $bookmark
		echo 'Aye aye!'
	else
		set -l bookmark (string join '/' $bookmarks $argv[1])
		if not test -e $bookmark
			ln -s $PWD $bookmark
			echo 'Aye aye!'
		else
			echo 'Name already in use'
			return
		end
	end
end
