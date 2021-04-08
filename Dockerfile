FROM devopsedu/webapp

MAINTAINER Akila <akila4@gmail.com>


#Install Apache
RUN yum install -y httpd

#Install PHP Modules
sudo yum-config-manager --enable remi-php73
sudo yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd

RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#Copy Application Files
RUN rm -rf /var/www/html/*
COPY website /var/www/html/

#Open port 80
EXPOSE 80

#Start Apache service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
