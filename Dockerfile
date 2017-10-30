FROM elixir:alpine

WORKDIR /backend
RUN mix local.hex --force && mix local.rebar --force

ADD mix.exs /backend

RUN mix deps.get --force && \
    mix compile

ADD . /backend
CMD mix run --no-halt
