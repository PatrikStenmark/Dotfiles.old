. ~/.config/fish/completions/git.fish
set -e LC_CTYPE
set PATH /usr/local/bin $PATH
set PATH $HOME/.local/bin $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH

set -x PGDATA /usr/local/var/postgres/
set -x EDITOR "mvim -f"
set -x XML_CATALOG_FILES /usr/local/etc/xml/catalog $XML_CATALOG_FILES

rbenv rehash >/dev/null ^&1

