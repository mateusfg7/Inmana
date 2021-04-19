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