# VrBackend

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Note
  * `mix archive.install hex phx_new 1.4.6`
  * `mix phx.new . --app graphql_lab --no-ecto --no-html --no-webpack`
  * `{:absinthe, "~> 1.4"}, {:absinthe_plug, "~> 1.4"}`, `mix deps.get`
  * `iex -S mix phx.server`, `:init.stop`
  * `curl -v -H "content-type: application/json" -H "Authorization: Bearer token" -d'{ "query": "{ me{ name } }" }' http://localhost:4000/graphql`
