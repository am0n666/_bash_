#export COMPOSER_HOME=/etc/composer

export PATH=/usr/local/bin:$PATH

#if [ -d "$COMPOSER_HOME/vendor/bin" ]
#then
#	export PATH="$COMPOSER_HOME/vendor/bin:$PATH"
#fi


remove_duplicates_from_path() {
	PATH_NO_DUPLICATES=$(echo -n $PATH | awk -v RS=: -v ORS=: '!x[$0]++' | sed "s/\(.*\).\{1\}/\1/")
	export PATH=$PATH_NO_DUPLICATES
}

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

remove_duplicates_from_path

#mesg n

if [ -x "`which inxi 2>&1`" ]; then
    inxi -IpRS -v0 -c5
fi
