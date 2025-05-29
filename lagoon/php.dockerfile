ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM brittanym/pod-metrics-exporter:4.0

COPY --from=cli /app /app
