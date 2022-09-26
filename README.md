
If you dont have laravel project just run the command

<b>composer create-project laravel/laravel --prefer-dist my_app </b>

cd my_app

create a Dockerfile (D will be in upper case)

Write the follwing lines on you dockerfile

<p> 
FROM php:8.1-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql sockets
RUN curl -sS https://getcomposer.org/installer​ | php -- \
     --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .
RUN composer install
</p>

Build your docker image

<b>docker build -t my_app . </b>

Then, we may need to see the Image ID using this command.

<b>docker image ls</b>

Copy the image ID from the lists, and then we can run the image.

<b>docker run -p 8000:8000 -d <imageID> </b>
The flag -p above is exposing our main machine port, into the docker port. Then for the -d flag means that we’ll run the image in the background.

Now run bellow command to get container id

<b>docker ps</b>

then run this command

<b>docker exec -it <container ID> sh</b>
Inside the container command line, we can start the server using the usual php artisan serve.

<b>php artisan serve --host=0.0.0.0</b>
