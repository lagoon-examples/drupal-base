ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/nginx-drupal:24.11.0

COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=web
