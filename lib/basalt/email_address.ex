defmodule Basalt.EmailAddress do
  @moduledoc """
  Representation of an email address.

  iex> alias Basalt.EmailAddress
  nil
  iex> "test@example.com" |> EmailAddress.parse! |> EmailAddress.hostname
  "example.com"
  """

  defstruct local_part: nil, domains: []
  @regex ~r{^(?<local_part>[^@]+)@(?<hostname>[^@]+)$}

  def parse!(raw) do
    [_match, local_part, hostname] = Regex.run(@regex, raw)
    domains = String.split(hostname, ".") |> Enum.reverse
    __MODULE__ |> struct local_part: local_part, domains: domains
  end

  def hostname(%__MODULE__{domains: domains}) do
    domains
    |> Enum.reverse
    |> Enum.join(".")
  end
end
