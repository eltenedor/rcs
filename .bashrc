# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#########################################################################

#general variables
export PATH=/usr/local/bin:/usr/bin:/bin

# some aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sl='ls'
alias LS='ls'
alias reset_paths='export PATH=/usr/bin:/bin LD_LIBRARY_PATH=/usr/lib:/lib MANPATH=/usr/share/man:/usr/local/share/man; unset CPATH INCLUDE INSTALL_DIR INTEL_LICENSE_FILE IPPROOT LIBRARY_PATH LM_LICENSE_FILE MIC_LD_LIBRARY_PATH MKLROOT NLSPATH PETSC_DIR TBBROOT'
alias reset_env='reset_paths; unset PETSC_DIR PETSC_ARCH'
alias ed='ed -p:'
alias chrome='google-chrome --disk-cache-dir="/tmp/ram/ &>/dev/null &"'
alias weed='echo `date` >> /data/documents/consumation.log; head -n 24 /data/documents/consumation.log ; tail -n 10 /data/documents/consumation.log'
alias rep='cd caffa.MTM/block3d.MB/; cp ../../param3d.inb .; make clip-build EXPATH=../../; ...; ./block3d.MB.lnx ; cd caffa.MTM/caffa3d.MB/; cp ../../param3d.inc .; make opt-gnu-analytical EXPATH=../../; ...'
 
# change the command prompt
PS1="\[\033]0;\u@\h: \w\007\]\W\\$ "
PS2='>> '
PS3='>>> '
export PS1 PS2 PS3

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=500000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Linux Hacks
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\"";}

#gvim function
function gvim () { (/usr/bin/gvim -f "$@" &) }

#load intelCompilers
#. /software/intel/bin/compilervars.sh intel64

#openmpi
#export PATH=/software/openmpi/gnu/1.6.5/bin:$PATH
#export PATH=/software/openmpi/gnu/1.8.1/bin:$PATH
export PATH=/software/openmpi/gnu/1.8.2/bin:$PATH
#export PATH=/software/openmpi/intel/1.6.5/bin:$PATH

#export LD_LIBRARY_PATH=/software/openmpi/gnu/1.6.5/lib:${LD_LIBRARY_PATH}
#export LD_LIBRARY_PATH=/software/openmpi/gnu/1.8.1/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/software/openmpi/gnu/1.8.2/lib:${LD_LIBRARY_PATH}
#export LD_LIBRARY_PATH=/software/openmpi/intel/1.6.5/lib:${LD_LIBRARY_PATH}

#mpich
#export PATH=/software/mpich/gnu/3.1.2/bin:$PATH

#PETSc
#export PETSC_DIR=/software/petsc/gnu/3.5.1/arch-openmpi-dbg
#export PETSC_DIR=/software/petsc/gnu/3.5.1/arch-openmpi-opt
#export PETSC_DIR=/software/petsc/gnu/3.5.2/arch-openmpi-dbg
export PETSC_DIR=/software/petsc/gnu/git/arch-openmpi-opt
#export PETSC_DIR=/software/petsc/gnu/git/arch-openmpi-dbg

#export PETSC_DIR=/software/petsc/gnu/3.4.3/arch-openmpi
#export PETSC_DIR=/software/petsc/intel/3.4.3/arch-openmpi-mkl
#export PETSC_DIR=/software/petsc/intel/3.4.3/arch-openmpi-intel-dbg
#export PETSC_DIR=/software/petsc/intel/3.4.3/arch-openmpi-intel-mkl-static
#export PETSC_DIR=/software/petsc/intel/3.4.2/arch-openmpi-intel-mkl-flags

export LD_LIBRARY_PATH=${PETSC_DIR}/lib:${LD_LIBRARY_PATH}

#BLAS/LAPACK
export LD_LIBRARY_PATH=/software/netlib/blas/lib:/software/netlib/lapack/lib:${LD_LIBRARY_PATH}

#clipper
export LD_LIBRARY_PATH=/software/clipper/gnu/5.1.6/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/software/clipper/gnu/6.1.3/lib:$LD_LIBRARY_PATH

#oce
export LD_LIBRARY_PATH=/software/oce/lib:$LD_LIBRARY_PATH

#Valgrind
#export PATH=/software/valgrind/intel/3.8.1/bin:$PATH
#export PATH=/software/valgrind/gnu/3.8.1/bin:$PATH

#OpenMP
export OMP_NUM_THREADS=1

#aribas
#export PATH=/software/aribas/1.64/bin:$PATH

#maple
#export PATH=/software/mapleplayer:$PATH

#zoltan
#export LD_LIBRARY_PATH=/software/zoltan/3.8/lib:$LD_LIBRARY_PATH

#openFOAM
#. /software/OpenFOAM/OpenFOAM-2.2.2/etc/bashrc

#eclipse
#alias eclipse="/software/eclipse/kepler/eclipse"
alias eclipse="/software/eclipse/luna/eclipse"

#texlive
export PATH=/software/texlive/2014/bin/x86_64-linux:$PATH

#i3
export PATH=/home/fabian/bin:$PATH

#java
export PATH=/software/java/jdk1.7.0_55/jre/bin:$PATH
