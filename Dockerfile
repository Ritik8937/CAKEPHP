FROM ubuntu
MAINTAINER ritik
ENV DEBIAN_FRONTEND="noninteractive"
COPY . /usr/src/app
WORKDIR /usr/src/app/notejam
RUN apt-get update \
    && apt-get install curl -y \
    && apt-get install -y wget \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:ondrej/php -y \
    && apt-get install php5.6 -y \
    && apt-get install php5.6-mbstring -y \ 
    && apt-get install php5.6-mcrypt -y \
    && apt-get install php5.6-mysql -y \
    && apt-get install php5.6-gd -y \
    && apt-get install php5.6-intl -y \
    && apt-get install php5.6-xsl -y \
    && apt-get install php5.6-xml -y \ 
    && apt-get install php5.6-curl -y \
    && curl -s https://getcomposer.org/installer | php \
    && wget -O phpunit https://phar.phpunit.de/phpunit-5.phar \
    && chmod +x phpunit \
    && apt-get install composer -y \
    && composer update \
    && php composer.phar install 
ENTRYPOINT ./bin/cake server -H 0.0.0.0 -p 8765
