ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/php-8.4-fpm:latest

COPY --from=cli /app /app
