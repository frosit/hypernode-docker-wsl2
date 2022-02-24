Socat SSH Socket | Windows SSH Agent
================

Socat SSH agent forwarding is great when using multiple WSL environments.
IT forwards the SSH-Agent from Windows to the WSL environments instead of having separate agents.
The keys you install in Windows will be available in this WSL env.

# Prerequisites

* The windows ssh-agent.exe should be started.
* SSH keys should be added.
* environment variable `HNWSL_SSH_AUTH_SOCK` be true (See /data/web/.wsl/.env)

To set it up, open an administrator powershell terminal.

```ps1
    # start ssh-agent and setup to autostart (as administrator)
	Start-Service ssh-agent
	Set-Service -StartupType Automatic ssh-agent
	
	# To check if service is running
	Get-Service ssh-agent

```

adding keys doesn't require admin or powershell, as long we're connected to the agent.
Adding keys from windows can be done the following way:

```ps1
	# add keys
	ssh-add.exe .ssh/id_rsa 
	
	# list keys
	ssh-add.exe -l
	
	#delete keys
	ssh-add.exe -d
```

From this point, we use `npipereplay.exe` to expose the windows SSH agent pipe and turn it into a socket using socat.
This is done automatically but there are 2 helpers:

```bash
# checks if everything setup right
hnwsl-ssh check

# force start
# hnwsl-ssh start
```

# disabling SSH integration

Within the `.wsl` folder (/data/web/.wsl) is a .env file containing a HNWSL_SSH_AUTH_SOCK variable that can be set to true
When enabled.

every time you open a new shell the agent integration is checked. If there's an agent.sock file in the .ssh dir, this is working.

For more about this solution see the original repo at: https://github.com/jstarks/npiperelay