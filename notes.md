# Notes

## Commands

### Create new API project:
```bash
$ mix phx.new project-name --no-html --no-webpack
```

### Create database:
_with database online_
```bash
$ mix ecto.create
```

### Install dependencies:
```bash
$ mix deps.get
```

### Create config file for credo:
```bash
$ mix credo.gen.config
```

### Create a migration
```bash
$ mix ecto.gen.migration migration_name
```

### Run migrations
```bash
$ mix ecto.migrate
```

## Elixir

### Manipulate maps
```elixir
map = %{a: 1, b: 2}
IO.puts map[:a]

map2 = %{"a" => 1, "b" => 1}
IO.puts map["a"]
```

we can use `Map.get/2` to get the value
```elixir
iex> map = %{"a" => 1, "b" => 1}
iex> Map.get(map, "a")
1
```

we can use `Map.get/3` to get the value of a index, or a default value
```elixir
iex> map = %{"a" => 1, "b" => 1}
iex> map["name"]
nil
iex> Map.get(map, "name")
nil
iex> Map.get(map, "name", 5)
5
```

## Phoenix

### Use UUID as primary key

On `config/config.exs` add the config:
```elixir
config :project, Project.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]
```

### Use resources to create default routes of a controller

On `lib/project_web/router.ex`:
```elixir
scope "/api", ProjectWeb do
    pipe_through :api

    resources "/some-route", SomeController
  end
```

This will create all default route for SomeController, running `mix phx.routes` we will get:
```
some_path  GET     /api/some-route           ProjectWeb.SomeController :index
some_path  GET     /api/some-route/:id/edit  ProjectWeb.SomeController :edit
some_path  GET     /api/some-route/new       ProjectWeb.SomeController :new
some_path  GET     /api/some-route/:id       ProjectWeb.SomeController :show
some_path  POST    /api/some-route           ProjectWeb.SomeController :create
some_path  PATCH   /api/some-route/:id       ProjectWeb.SomeController :update
           PUT     /api/some-route/:id       ProjectWeb.SomeController :update
some_path  DELETE  /api/some-route/:id       ProjectWeb.SomeController :delete
```

We can pass the parameter `only` to specify the methods:
```elixir
scope "/api", ProjectWeb do
    pipe_through :api

    resources "/some-route", SomeController, only: [:create, :show]
  end
```