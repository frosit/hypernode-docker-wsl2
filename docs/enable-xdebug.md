Enabling xDebug
===============

xDebug is enabled by default but not activated. To activate it you can copy the .user.ini.dist file to public and restart php-fpm.

```bash
cp /data/web/.user.ini.dist /data/web/public/.user.ini

sudo service php7.2-fpm restart # default pass is app
```

# Disable xdebug

```bash
sudo phpdismod xdebug # phpenmod for enable
```

# remote host

Depending on whether you run phpstorm from windows or from WSL, you might have to uncomment the last line of the .user.ini
Run the Xdebug validator within PhpStorm, it will tell you what to setup.

Also read the [the hypernode-docker documentation](https://github.com/ByteInternet/hypernode-docker/blob/master/Documentation/debugging-with-xdebug-in-phpstorm.md)

@todo improve docs