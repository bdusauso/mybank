FROM elixir:1.7

ENV APP_USER_UID 1000040000
ENV PHOENIX_VERSION "1.3.4"

USER root

RUN apt-get update && \
    apt-get install -y sudo

RUN mkdir -p /etc/sudoers.d/ && \
    echo "app ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/app && \
    chmod 0440 /etc/sudoers.d/app

RUN groupadd -g $APP_USER_UID app && \
    useradd -lm -u $APP_USER_UID -g $APP_USER_UID app

RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -

RUN apt-get update && \
    apt-get install -y \
        inotify-tools \
        build-essential \
        nodejs && \
    apt-get clean

RUN mkdir -p /usr/src/app && \
    chown -R app:app /usr/src/app

USER app
WORKDIR /usr/src/app

RUN mix local.hex --force && \
    mix local.rebar --force

ADD mix.exs mix.lock ./
RUN sudo chown -R app:app /usr/src/app && \
    mix deps.get

COPY . /usr/src/app

RUN sudo chown -R app:app /usr/src/app && \
    mix compile

ADD entrypoint.sh /

EXPOSE 4000
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /usr/src/app/deps /usr/src/app/_build
CMD ["mix", "phx.server"]
