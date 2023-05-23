FROM composer:latest

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
 
USER laravel 

# Place of our code
WORKDIR /var/www/html

# Flag --ignore-platform-reqs for executing without any warnings
ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]