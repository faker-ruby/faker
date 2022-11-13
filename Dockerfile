FROM ruby:latest as app

COPY . .

RUN ["bundle", "install"]

WORKDIR /app

VOLUME [ "/app" ]

# Force the container to stay open
ENTRYPOINT [ "tail", "-f", "/dev/null" ]