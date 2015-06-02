# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
	. ~/.bashrc
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

PLATFORM=`uname`;
case $PLATFORM in
    "Linux")
        # Nicer version of ls
        echo "*** Linux ***"
        alias ls='ls --color'
        ;;
    "Darwin")
        echo "/// Mac OSX \\\\\\"
        alias ls='ls -G'
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
        ;;
esac


# set PATH so it includes user's private bin if it exists
if [ -d ~/localbin ] ; then
    export PATH=~/localbin:"${PATH}"
    if [ -d ~/localbin/depot_tools ]; then
        export PATH=~/bin:"${PATH}"
    fi
fi
if [ -a ~/bin ]; then
    export PATH=~/bin:$PATH
fi
# same thing for LD_LIBRARY_PATH and ~/lib
if [ -d ~/lib ] ; then
    export LD_LIBRARY_PATH=~/lib:"${LD_LIBRARY_PATH}"
fi
# same thing for CPATH and ~/include
if [ -d ~/include ] ; then
    export CPATH=~/include:"${CPATH}"
fi
# same thing for PKG_CONFIG_PATH and ~/pkgconfig
if [ -d ~/pkgconfig ] ; then
    export PKG_CONFIG_PATH=~/pkgconfig:"${PKG_CONFIG_PATH}"
fi

# Default editor
export EDITOR=vim

# To prevent loggin out with Ctrl+d:
export IGNOREEOF=2

IS_64BIT=`uname -a | grep x86_64`

# OASIS
if [[ -z $IS_64BIT ]]; then
  echo "32 BIT SYSTEM";
  if [[ -d "/home/crameri/svn32/0.2" ]]; then
      export OASIS_DIR=/home/crameri/svn32/0.2;
      source $OASIS_DIR/env.sh
  fi;
else
  echo "64 BIT SYSTEM";
  if [[ -d "/home/crameri/oasis" ]]; then
      export OASIS_DIR=/home/crameri/oasis;
      source $OASIS_DIR/env.sh
  fi;
fi

export PATH=/home/cluster/bin:/usr/local/share/npm/bin:$PATH

# QT (qt-webkit, custom version)
# export PATH=/usr/local/Trolltech/Qt-4.8.0/bin:$PATH
#export QTDIR=/usr/share/qt4/
#export QTWEBKIT_INSTALL=/data/webkit-install
#export WEBKIT_SRC=/home/crameri/bugbuster/bugbuster-qtwebkit/Source
#export LD_LIBRARY_PATH=$QTWEBKIT_INSTALL:$LD_LIBRARY_PATH

# To compile using QtWebKit
# export PKG_CONFIG_PATH=$QTWEBKIT_INSTALL/pkgconfig

# CouchDB++
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib


# Chromium depot_tools:
export PATH=~/depot_tools:$PATH

# GIT
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
COLOR_NONE="\[\e[0m\]"
LIGHT_GRAY="\[\033[01;37m\]"
PURPLE="\[\033[00;35m\]"
BLINK="\[\e[5m\]";
NO_BLINK="\[\e[25m\]";

git_branch() {
    b=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'`
    echo $b;
}
commits_behind_develop() {
    # Is there a develop branch ?
    d=`git branch 2>/dev/null | egrep '\s+develop$' | wc -l`
    if [[ $d == "1" ]]; then
        n=`git rev-list HEAD..develop | wc -l`
        if [[ $n != "0" ]]; then
            echo "${BLINK}, $n commit(s) behind develop${NO_BLINK}"
        fi;
    fi;
}
git_prompt() {
    branch=$(git_branch);
    if [[ "$branch" == "" ]]; then
        echo "";
    else
        echo "${PURPLE}[$branch$(commits_behind_develop)${PURPLE}]";
    fi
}
build_prompt() {
    PS1="${GREEN}$HOSTNAME${COLOR_NONE} \w $(git_prompt) \$${COLOR_NONE} "
}

PROMPT_COMMAND=build_prompt;

# BUG BUSTER
export BBSETUP_HOME=~/bugbuster/bugbuster-setup;
export PYTHONPATH=~/bugbuster/bugbuster-setup/lib:$PYTHONPATH;
export EDITOR=vim
