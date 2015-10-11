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
