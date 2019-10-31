# work from latest LTS ubuntu release
FROM ubuntu:18.04

# set the environment variables
ENV version 2.21.2
ENV PICARD /usr/local/bin/picard/picard.jar

# run update
RUN apt-get update -y && apt-get install -y \
    libnss-sss \
    openjdk-8-jre \
    curl \
    less \
    vim  \
    wget


# download picard tools and change permissions
RUN mkdir -p /usr/local/bin/picard \
    && curl -SL https://github.com/broadinstitute/picard/releases/download/${version}/picard.jar \
    > /usr/local/bin/picard/picard.jar
RUN chmod 0644 /usr/local/bin/picard/picard.jar

# set default command to print help
CMD ["java", "-jar", "/usr/local/bin/picard/picard.jar"]
