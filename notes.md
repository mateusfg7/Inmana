# Notes

1. Create new API project:
```bash
$ mix phx.new project-name --no-html --no-webpack
```

2. Create database:
_with database online_
```bash
$ mix ecto.create
```

3. Install dependencies:
```bash
$ mix deps.get
```

4. Create config file for credo:
```bash
$ mix credo.gen.config
```