FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y ca-certificates jq

RUN echo "deb [trusted=yes] https://packages.cloudfoundry.org/debian stable main" > /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update
RUN apt-get install -y cf8-cli

# Add support for MTA deployment (Doesn't stick here - so run it in the entrypoint.sh)
# RUN cf install-plugin multiapps -f

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
