FROM elixir:1.10

ENV NODE_VERSION 12.x

RUN mkdir -p /app && chmod -R 777 /app && chmod g+s /app

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs

RUN npm install npm@latest -g

RUN mix local.hex --force && \
  mix archive.install hex phx_new 1.5.6 --force && \
  mix local.rebar --force

WORKDIR /app
