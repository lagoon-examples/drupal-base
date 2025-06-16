ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/nginx-drupal:latest

COPY lagoon/nginx.conf /etc/nginx/nginx.conf

COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=web
