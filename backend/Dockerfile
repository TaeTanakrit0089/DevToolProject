FROM php:8.0-apache

WORKDIR /var/www/html

# Install necessary PHP extensions for PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

COPY . .

EXPOSE 8000
CMD ["apache2-foreground"]