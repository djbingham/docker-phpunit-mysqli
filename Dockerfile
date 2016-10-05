FROM php:cli
MAINTAINER David Bingham

# Utilities
RUN apt-get update && apt-get install -y wget

# MySQLi
RUN docker-php-ext-install mysqli

# PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit
RUN phpunit --version

# X-Debug
RUN pecl install xdebug-2.4.0RC3
RUN echo "zend_extension=xdebug.so\nxdebug.cli_color=1\nxdebug.remote_autostart=1\nxdebug.remote_connect_back=1" > /usr/local/etc/php/conf.d/xdebug.ini

ENTRYPOINT ["/usr/local/bin/phpunit"]
CMD ["--help"]
