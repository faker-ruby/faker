
FROM ruby:2.7 as build

WORKDIR /build

COPY . .

RUN ["gem", "build", "faker.gemspec"]

RUN ["gem", "install", "faker-2.23.0.gem"]


FROM ruby:2.7 as app

COPY . .

RUN ["bundle", "install"]

COPY --from=build /build/faker-2.23.0.gem .

WORKDIR /app

VOLUME [ "/app" ]

# Force the container to stay open
ENTRYPOINT [ "tail", "-f", "/dev/null" ]