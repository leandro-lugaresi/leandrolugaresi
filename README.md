Modulus CMF - SkeletonApplication
=======================

Introduction
------------

This is a SkeletonApplication module of ModulusCMF.This is a simple, skeleton application using the modules of ModulusCMF. This application is meant to be used as a starting place for those
looking to get their feet wet with ModulusCMF.

Installation
------------

Using Composer (recommended)
----------------------------
The recommended way to get a working copy of this project is to clone the repository and use `composer.phar` to install dependencies:

    cd my/project/dir
    git clone git@github.com:leandro-lugaresi/ModulusSkeletonApplication.git
    cd ModulusSkeletonApplication
    php composer.phar self-update
    php composer.phar install

(The `self-update` directive is to ensure you have an up-to-date `composer.phar`
available.)

Web Server Setup
----------------

### PHP CLI Server

The simplest way to get started if you are using PHP 5.4 or above is to start the internal PHP cli-server in the root directory:

    php -S 0.0.0.0:8080 -t public/ public/index.php

This will start the cli-server on port 8080, and bind it to all network
interfaces.

**Note: ** The built-in CLI server is *for development only*.

### Apache Setup

To setup apache, setup a virtual host to point to the public/ directory of the
project and you should be ready to go! It should look something like below:

    <VirtualHost *:80>
        ServerName modulus-tutorial.localhost
        DocumentRoot /path/to/modulus-tutorial/public
        SetEnv APPLICATION_ENV "development"
        <Directory /path/to/modulus-tutorial/public>
            DirectoryIndex index.php
            AllowOverride All
            Order allow,deny
            Allow from all
        </Directory>
    </VirtualHost>