# Some systems' /etc/profile setups export PS1, which really fouls things up
# when switching between non-login shells; let's put things right by unsetting
# it to break the export and then just setting them as simple variables
unset PS1 PS2 PS3 PS4
PS1='$ ' PS2='> ' PS3='? ' PS4='+ '

# If we have an SSH_CLIENT or SSH_CONNECTION environment variable, put the
# hostname in PS1 too.
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ] ; then
    PS1=$(hostname -s)'$ '
fi
