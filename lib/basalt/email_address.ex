defmodule Basalt.EmailAddress do
  @moduledoc """
  Representation of an email address.

  iex> alias Basalt.EmailAddress
  nil
  iex> example_email = "test@example.com" |> EmailAddress.parse!
  %EmailAddress{domains: ["com", "example"], local_part: "test"}
  """

  defstruct local_part: nil, domains: []
  @regex ~r{^(?<local_part>[^@]+)@(?<hostname>[^@]+)$}

  def parse!(raw) do
    [_match, local_part, hostname] = Regex.run(@regex, raw)
    domains = String.split(hostname, ".") |> Enum.reverse
    __MODULE__ |> struct local_part: local_part, domains: domains
  end

  def new(raw) do
    {__MODULE__, parse!(raw)}
  end

  @doc """
  iex> %EmailAddress{domains: ["com", "example"], local_part: "test"} |> EmailAddress.hostname
  "example.com"
  """
  def hostname(%__MODULE__{domains: domains}) do
    domains
    |> Enum.reverse
    |> Enum.join(".")
  end

  def hostname({__MODULE__, email_address}) do
    hostname(email_address)
  end

  @doc """
  iex> %EmailAddress{domains: ["com", "example"], local_part: "test"} |> EmailAddress.top_level_domain
  "com"
  """
  def top_level_domain(%__MODULE__{domains: [tld | _rest]}) do
    tld
  end

  def top_level_domain({__MODULE__, email_address}) do
    top_level_domain(email_address)
  end

  @doc """
  iex> %EmailAddress{domains: ["com", "example"], local_part: "test"} |> EmailAddress.local_part
  "test"
  """
  def local_part(%__MODULE__{local_part: local_part}) do
    local_part
  end

  def local_part({__MODULE__, email_address}) do
    local_part(email_address)
  end

  @doc """
  iex> %EmailAddress{domains: ["com", "example"], local_part: "test"} |> EmailAddress.domains
  ["com", "example"]
  """
  def domains(%__MODULE__{domains: domains}) do
    domains
  end

  def domains({__MODULE__, email_address}) do
    domains(email_address)
  end

  def to_string({__MODULE__, email_address}) do
    String.Chars.to_string(email_address)
  end
end

defimpl String.Chars, for: Basalt.EmailAddress do
  def to_string(email_address) do
    Basalt.EmailAddress.local_part(email_address) <> "@" <> Basalt.EmailAddress.hostname(email_address)
  end
end
