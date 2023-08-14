#!/usr/bin/env bash

# Install PHP extensions with PECL
pecl install imagick xdebug

# Install Laravel Valet
composer global require laravel/valet
valet install
valet trust

# Install https://github.com/tighten/takeout
composer global require tightenco/takeout
