FROM ubuntu
MAINTAINER Ilya Ageev <iamuyga@gmail.com>

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        nginx \
        php7.0-fpm \
        php7.0-mysqlnd \
        php7.0-mbstring \
        vim \
        openssh-server \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/sites-enabled/default
COPY default.conf /etc/nginx/conf.d

RUN useradd -s /bin/bash -d /local/repositories -G www-data git

VOLUME /local/repositories
VOLUME /local/gitphp
EXPOSE 80 22

CMD service ssh start \
    && service nginx start \
    && service php7.0-fpm start \
    && mkdir /local/repositories/.ssh \
    && exec tail -F /var/log/php7.0-fpm.log
