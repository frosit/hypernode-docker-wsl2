Known issues
============

# Networking

Issues related to networking

## redismaster / mysqlmaster not available

By default, WSL overwrites the hosts file with entries from the windows environments hosts file. This override removes the mappings redismaster / mysqlmaster to localhost. You can disable this but at a cost of WSL handling networking which could result in the WSL environment not being able to access the internet. Go ahead if you know what you're doing, but instead of mysqlmaster / redismaster etc, just use localhost. You can also add these to your windows hosts file which will add them in the WSL environment.

## Windows commands (like explorer.exe) not available

Output your `$PATH` using `echo $PATH` and see if there are `Windows` entries in there. If not, try restarting WSL or report here. It's a known issue with new imports.

## Cannot start graphical apps

Make sure the directory under `/mnt/wslg/.X11-unix` exists. If not, report this issue.

@todo add fixes