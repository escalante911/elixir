FROM kranfix/phoenix_dev:1.0.0

WORKDIR /app
COPY . /app
RUN mix deps.get && mix compile
CMD mix phx.server && mix ecto.create


