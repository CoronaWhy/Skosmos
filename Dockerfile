FROM php:7.3-apache

RUN apt-get update && \
  apt-get -y install locales curl unzip vim git libicu-dev libxslt-dev && \
  for locale in en_GB en_US fi_FI fr_FR sv_SE; do \
    echo "${locale}.UTF-8 UTF-8" >> /etc/locale.gen ; \
  done && \
  locale-gen

RUN a2enmod rewrite
COPY config/composer-install.sh /tmp/composer-install.sh
COPY config/composer.json /var/www/html/composer.json
COPY composer.phar /var/www/html/composer.phar
RUN /bin/bash /tmp/composer-install.sh
RUN docker-php-ext-install intl
RUN docker-php-ext-install xsl
RUN docker-php-ext-install gettext
WORKDIR /var/www/html
RUN php /var/www/html/composer.phar install --no-autoloader
COPY config/config.ttl /var/ww/html/config.ttl
