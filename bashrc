export PS1="\e[7m[translations: \w]\e[0m\nSIWECOS\$ "
export PERL5LIB="$PWD/lib" # :/usr/local/lib/perl5/site_perl/5.30.0"
export PATH="$HOME:$PATH"

default_key="$HOME/.ssh/id_rsa"

# Do we have agent info stored? Get it then
if [ -r .ssh-agent-info ] ; then
  . .ssh-agent-info > /dev/null
fi

# # Does everything look like we still have an agent running?
# if [ -n "$SSH_AUTH_SOCK" -a -n "$SSH_AGENT_PID" -a -e "$SSH_AUTH_SOCK" ] ; then
#   # is it actually running
#   if ps "$SSH_AGENT_PID" | grep '[s]sh-agent' > /dev/null ; then
#     echo "still running agent $SSH_AGENT_PID"
#   else
#     unset SSH_AGENT_PID
#   fi
# else
#   unset SSH_AGENT_PID
# fi
# 
# # Last check - Do we need to start the ssh agent?
# if [ -z "$SSH_AGENT_PID" ] ; then
#   ssh-agent > .ssh-agent-info
#   . .ssh-agent-info
# fi
# 
# # Add the default key
# if ssh-add -l | grep "$default_key" > /dev/null ; then
#   echo "Using identity $default_key"
# else
#   ssh-add "$default_key"
# fi

