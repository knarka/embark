function embark --description 'go to a bookmark'
	set -l bookmarks (string join '' $HOME '/.config/fisher/github.com/knarka/embark/bookmarks')
	set -l usage "Usage: embark <a> - go to bookmark 'a'"

	if not test -e $bookmarks
		mkdir $bookmarks
	end

	if test -z $argv[1]; echo $usage; return; end

	set -l bookmark (string join '/' $bookmarks $argv[1])
	if not test -e $bookmark
		echo "No such bookmark"
		return
	end

	cd $bookmark
end
