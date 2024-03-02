ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM brittanym/pod-metrics-exporter:3.0

COPY --from=cli /app /app
