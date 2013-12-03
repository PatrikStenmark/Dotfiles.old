if status --is-login
	for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin /opt/local/lib/postgresql83/bin ~/bin ~/.config/fish/bin 
		if test -d $p
			set PATH $p $PATH
		end
	end
end



set fish_greeting ""
set -x CLICOLOR 1

function parse_git_branch
	sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

function parse_git_tag
	git describe --tags --always ^/dev/null
end

function parse_git_tag_or_branch
	if [ (parse_git_branch) != "(no branch)" ]
        	parse_git_branch
	else
        	parse_git_tag
	end
end

function git_parse_ahead_of_remote
	git status ^/dev/null | grep 'Your branch is ahead of' | sed -e 's/# Your branch is ahead of .* by \(.*\) commit.*/\1/g'
end

function is_git
	git status >/dev/null ^&1	
	return $status
end

function parse_svn_tag_or_branch
        sh -c 'svn info | grep "^URL:" | egrep -o "(tags|branches)/[^/]+|trunk" | egrep -o "[^/]+$"'
end

function parse_svn_revision
	sh -c 'svn info 2> /dev/null' | sed -n '/^Revision/p' | sed -e 's/^Revision: \(.*\)/\1/'
end

function is_svn
	svnversion | egrep -vq '^(Unversioned directory|exported)'
	return $status
end

bind \cr "rake"

function ss -d "Run the script/server"
	script/server
end

function sc -d "Run the Rails console"
	script/console
end

if test -d "/opt/java"
   set -x JAVA_HOME "/opt/java"
end

# yarrr, add /var/lib/gems/1.8/bin to path so gems installed by the retarded ubuntu rubygems package are on the path
set CUSTOM_GEM_PATH "/var/lib/gems/1.8/bin"
if test -d $CUSTOM_GEM_PATH
    set -x PATH $PATH "/var/lib/gems/1.8/bin"
end


# Load custom settings for current hostname
set HOST_SPECIFIC_FILE ~/.config/fish/(hostname).fish
if test -f $HOST_SPECIFIC_FILE
   . $HOST_SPECIFIC_FILE
else 
   echo Creating host specific file: $HOST_SPECIFIC_FILE
   touch $HOST_SPECIFIC_FILE
end
   
# Load custom settings for current user
set USER_SPECIFIC_FILE ~/.config/fish/(whoami).fish
if test -f $USER_SPECIFIC_FILE
   . $USER_SPECIFIC_FILE
else
   echo Creating user specific file: $USER_SPECIFIC_FILE
   touch $USER_SPECIFIC_FILE
end

# Load custom settings for current OS
set PLATFORM_SPECIFIC_FILE ~/.config/fish/(uname -s).fish
if test -f $PLATFORM_SPECIFIC_FILE
   . $PLATFORM_SPECIFIC_FILE
else
   echo Creating platform specific file: $PLATFORM_SPECIFIC_FILE
   touch $PLATFORM_SPECIFIC_FILE
end  

