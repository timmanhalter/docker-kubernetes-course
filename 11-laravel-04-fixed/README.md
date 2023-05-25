[READ} Laravel Project -- IF YOU HAVE ISSUES
63 upvotes
Joel · Lecture 119
· 7 months ago

OLD THREAD WITH FIXES WAS GETTING TOO LONG TO GO THROUGH.

1. Grab Max's snapshot from the end of the section, and use the code found in laravel-04-fixed.zip

2. Open the dockerfiles/php.dockerfile, and change the FROM instruction to FROM php:8.1-fpm-alpine , save and close the file

3. To avoid file permissions issue if you have an "src" folder still in your root project folder, delete it and recreate it (so it is an empty folder)

4. Time to create our Laravel project, run docker-compose run --rm composer create-project --prefer-dist laravel/laravel:^8.0 . , in your root project's folder

5. Open src/.env in your editor and change the configuration lines for the database connection as follows

    DB_DATABASE=homestead
    DB_USERNAME=homestead
    DB_PASSWORD=secret

6. Run the project, docker-compose up mysql server php and access it on http://localhost:8000

---

composer.dockerfile

    FROM composer:latest
     
    RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
     
    USER laravel 
     
    WORKDIR /var/www/html
     
    ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]

nginx.dockerfile

    FROM nginx:stable-alpine
     
    WORKDIR /etc/nginx/conf.d
     
    COPY nginx/nginx.conf .
     
    RUN mv nginx.conf default.conf
     
    WORKDIR /var/www/html
     
    COPY src .

php.dockerfile

    FROM php:8.1-fpm-alpine
     
    WORKDIR /var/www/html
     
    COPY src .
     
    RUN docker-php-ext-install pdo pdo_mysql
     
    RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
     
    USER laravel

docker-compose.yml

    version: '3.8'
     
    services:
        server:
            # image: 'nginx:stable-alpine'
            build:
                context: .
                dockerfile: dockerfiles/nginx.dockerfile
            ports:
                - '8000:80'
            volumes:
                - ./src:/var/www/html
                - ./nginx/nginx.conf:/etc/nginx/conf.d/default.conf:ro
            depends_on:
                - php
                - mysql
        php:
            build:
                context: .
                dockerfile: dockerfiles/php.dockerfile
            volumes:
                - ./src:/var/www/html:delegated
        mysql:
            image: mysql:5.7
            env_file:
                - ./env/mysql.env
        composer:
            build:
                context: ./dockerfiles
                dockerfile: composer.dockerfile
            volumes:
                - ./src:/var/www/html
        artisan:
            build:
                context: .
                dockerfile: dockerfiles/php.dockerfile
            volumes:
                - ./src:/var/www/html
            entrypoint: ['php', '/var/www/html/artisan']
        npm:
            image: node:14
            working_dir: /var/www/html
            entrypoint: ['npm']
            volumes:
                - ./src:/var/www/html