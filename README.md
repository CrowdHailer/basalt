# Basalt

**Basalt is all the goodness of dedicated value objects ready to go**

This project is an experiment to see the value that can be had by using specific value types.
It is an evolution of [Typetanic](https://github.com/CrowdHailer/typetanic), a similar project for Ruby.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add basalt to your list of dependencies in `mix.exs`:

        def deps do
          [{:basalt, "~> 0.0.1"}]
        end

  2. Ensure basalt is started before your application:

        def application do
          [applications: [:basalt]]
        end

## Usage

This library can be used in the traditional functional manner.

```elixir
email_address = Basalt.EmailAddress.parse!("test@example.com")

["com", "example"] = Basalt.EmailAddress.domains(email_address)
"com" = Basalt.EmailAddress.top_level_domain(email_address)
"example.com" = Basalt.EmailAddress.hostname(email_address)
"test" = Basalt.EmailAddress.local_part(email_address)
```

This library also returns a tuple module when called using the new function. Which allows for the following module calls.

```elixir
email_address = Basalt.EmailAddress.new("test@example.com")

["com", "example"] = email_address.domains
"com" = email_address.top_level_domain
"example.com" = email_address.hostname
"test" = email_address.local_part
```
