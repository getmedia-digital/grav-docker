FROM alpine:3.10
LABEL Maintainer="Pavel Janku <pavel@getmedia.digital>" \
      Description="Lightweight container with Nginx for GRAV CMS."

RUN apk update && apk upgrade

RUN apk --no-cache add \
    unzip \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    yaml-dev \
    musl-dev \
    make \
    gcc \
    make

RUN apk --no-cache add php7 \
    php7-fpm \
    php7-pear \
    php7-dev \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-zlib \
    php7-xml \
    php7-phar \
    php7-intl \
    php7-dom \
    php7-xmlreader \
    php7-ctype \
    php7-session \
    php7-mbstring \
    php7-gd \
    nginx \
    supervisor \
    curl \
    php7-gd \
    php7-opcache \
    php7-zip


RUN pecl install apcu \
    && pecl install yaml

# Nginx config
COPY .docker/nginx/nginx.conf /etc/nginx/nginx.conf

# PHP-FPM config
COPY .docker/php/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY .docker/php/php.ini /etc/php7/conf.d/zzz_custom.ini

# supervisord config
COPY .docker/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/tmp/nginx && \
  chown -R nobody.nobody /var/log/nginx

# Document root for Nginx
RUN mkdir -p /var/www
RUN chown -R nobody:nobody /var/www
#VOLUME /var/www/html TODO do volume

# Switch to use a non-root user from here on
USER nobody

WORKDIR /tmp

ENV GRAV_VERSION latest

# Download GRAV
RUN curl -o grav.zip -SL https://getgrav.org/download/core/grav-admin/${GRAV_VERSION} && \
    unzip grav.zip && \
    mv -f /tmp/grav-admin /var/www/html  && \
    rm grav.zip

COPY --chown=nobody:nobody plugins/ /var/www/html/user/plugins/
COPY --chown=nobody:nobody themes/ /var/www/html/user/themes/
COPY --chown=nobody:nobody config/ /var/www/html/user/config/

WORKDIR /var/www/html

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping
