FROM openfaas/classic-watchdog:0.18.1 as watchdog
FROM devries/cobol:latest

# Allows you to add additional packages via build-arg
ARG ADDITIONAL_PACKAGE

WORKDIR /cobol/src/handler
COPY . .

RUN cobc -x -o handler function/*.cbl

RUN groupadd -r app && useradd -ms /bin/bash -r -g app app 

WORKDIR /home/app

RUN mv /cobol/src/handler/handler .
COPY --from=watchdog /fwatchdog ./fwatchdog
RUN chmod +x ./fwatchdog

RUN chown -R app /home/app

USER app

ENV fprocess="./handler"
EXPOSE 8080

HEALTHCHECK --interval=3s CMD [ -e /tmp/.lock ] || exit 1

CMD ["./fwatchdog"]
