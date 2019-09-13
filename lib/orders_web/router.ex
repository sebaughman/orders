defmodule OrdersWeb.Router do
  use OrdersWeb, :router

  scope "/api" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: Graphql.Schema)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end
end
