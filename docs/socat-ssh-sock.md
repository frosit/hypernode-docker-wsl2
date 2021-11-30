Socat SSH Socket
================

This feature allows SSH to connect to Windows' ssh-agent pipe by using a socat socket.
This saves the trouble of setting up SSH configs on multiple WSL instances.

# Prerequisites

The windows ssh-agent.exe should be started and keys loaded.

```ps1
    # start ssh-agent and setup to autostart (as administrator)
	Start-Service ssh-agent
	Set-Service -StartupType Automatic ssh-agent
	
	# check if running
	Get-Service ssh-agent
	
	# add keys
	ssh-add.exe .ssh/id_rsa 
```

# enabling SSH socket

Within the `.wsl` folder (/data/web/.wsl) is a .env file containing a HNWSL_SSH_AUTH_SOCK variable that can be set to true
When enabled, restart your shell.

There's also a small script available at `~/.wsl/bin/hnwsl.ssh`