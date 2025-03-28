ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/php-8.3-fpm:25.3.0

COPY --from=cli /app /app
