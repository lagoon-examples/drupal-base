ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/nginx-drupal:latest

RUN apk add --no-cache nginx nginx-mod-http-brotli
RUN apk add --no-cache nginx-mod-http-lua

COPY lagoon/nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/nginx.conf.apk-new
RUN rm /etc/nginx/fastcgi.conf.apk-new
RUN rm /etc/nginx/fastcgi_params.apk-new

RUN chmod 777 /etc/nginx/nginx.conf

COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=web
