# $FreeBSD: src/etc/csh.cshrc,v 1.3.56.1.6.1 2010/12/21 17:09:25 kensmith Exp $
#
# System-wide .cshrc file for csh(1).

#alias ls	ls -G

# brighter color (like linux)
#setenv LSCOLORS	ExFxFxDxCxegedabagExEx
setenv CLICOLOR	yes
setenv GREP_OPTIONS --color=auto

# auto complete
set autolist

# auto complete include history
set autoexpand

# let csh/tcsh correct your typo
set correct = cmd
