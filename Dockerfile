FROM debian:buster

RUN apt-get update && apt-get -y install vim && apt-get -y install wget && apt-get -y install unzip

RUN apt-get install -y mariadb-server

RUN apt-get install -y php7.3 php7.3-common php7.3-cli php7.3-fpm php7.3-mysql php7.3-mbstring php7.3-xml php7.3-zip php7.3-json php7.3-imagick php7.3-xmlrpc

RUN apt-get install -y curl libcurl3-dev php7.3-curl

RUN apt-get -y install apache2

RUN wget -O composer-setup.php https://getcomposer.org/installer
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN composer create-project laravel/laravel project


COPY ./srcs/docker.sh ./

COPY ./srcs/.env ./

CMD bash docker.sh
EXPOSE 80 8000


# docker build -t test .
# docker rm $(docker ps -a -f status=exited -q)
# docker exec -it 5ddb039c6510 /bin/bash