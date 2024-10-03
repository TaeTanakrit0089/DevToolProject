FROM php:apache-bullseye

WORKDIR /var/www/html

# Install necessary PHP extensions for PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
RUN echo "ServerName ${APACHE_SERVER_NAME}" >> /etc/apache2/apache2.conf
RUN sed -i 's/Listen 80/Listen 8000/' /etc/apache2/ports.conf && sed -i 's/*:80/*:8000/' /etc/apache2/sites-available/000-default.conf

COPY . .

EXPOSE 8000
CMD ["apache2-foreground"]