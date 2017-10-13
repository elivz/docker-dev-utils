FROM node:latest

MAINTAINER Eli Van Zoeren

# Install PHP
RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
    && echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
    && wget https://www.dotdeb.org/dotdeb.gpg \
    && apt-key add dotdeb.gpg \
    && apt-get update && apt-get install -yqq --no-install-recommends php7.0 php7.0-mbstring rsync \
    && apt-get -y autoremove && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Gulp
RUN npm install -g gulp

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

VOLUME [/build]
WORKDIR /build

USER node