# Zoom

Elixir package to assist integrating with Zoom

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `zoom_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:zoom_ex, "~> 0.1.0"}
  ]
end
```

## Authentication

Generate a signature to be used for authentication:

```elixir
signature =
  Zoom.Auth.Token.generate(%Zoom.Auth{
    topic: "Testing",
    user_identity: "tester",
    password: "testing"
  })
```

## Configuration

```elixir
config :joken,
  default_signer: [
    signer_alg: "HS256",
    key_octet: System.get_env("ZOOM_SDK_SECRET")
  ]

config :zoom_ex, :zoom_sdk_key, System.get_env("ZOOM_SDK_KEY")
```

## Todos

- [ ] Move Joken config under `zoom_ex`

and many more things...

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/zoom_ex>.

