FROM devopsedu/webapp

MAINTAINER Akila <akila4@gmail.com>


#Install Apache
RUN yum install -y httpd

#Install PHP Modules
RUN yum-config-manager --enable remi-php73
RUN yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd


#Copy Application Files
RUN rm -rf /var/www/html/*
COPY website /var/www/html/

#Open port 80
EXPOSE 80

#Start Apache service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
