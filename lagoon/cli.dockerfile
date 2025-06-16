FROM uselagoon/php-8.3-cli-drupal:latest

RUN apk add --no-cache nginx nginx-mod-http-brotli
COPY lagoon/nginx.conf /etc/nginx/nginx.conf

COPY composer.* /app/
COPY assets /app/assets
RUN composer install --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Define where the Drupal Root is located
ENV WEBROOT=web
