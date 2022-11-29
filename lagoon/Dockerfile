FROM uselagoon/php-8.0-cli-drupal:latest as cli

COPY composer.* /app/
COPY assets /app/assets

RUN --mount=type=cache,target=/tmp/cache composer install \
     --no-dev

COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Define where the Drupal Root is located
ENV WEBROOT=web

FROM uselagoon/nginx-drupal:latest as nginx

COPY --from=cli /app /app

FROM uselagoon/php-8.0-fpm:latest as php
 
COPY --from=cli /app /app
