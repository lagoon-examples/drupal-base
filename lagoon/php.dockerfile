ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/php-8.3-fpm:latest

COPY --from=cli /app /app
COPY lagoon/php-fpm-status.conf /usr/local/etc/php-fpm.d/zz-php-fpm-status.conf
