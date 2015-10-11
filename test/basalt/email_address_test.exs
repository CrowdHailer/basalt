defmodule Basalt.EmailAddressTest do
  use ExUnit.Case
  alias Basalt.EmailAddress
  doctest Basalt.EmailAddress

  setup do
    {:ok, %{email_address: EmailAddress.new("test@example.com")}}
  end

  test "can get hostname", %{email_address: email_address} do
    assert "example.com" = email_address.hostname
  end

  test "can get top level domain", %{email_address: email_address} do
    assert "com" = email_address.top_level_domain
  end

  test "can get local part", %{email_address: email_address} do
    assert "test" = email_address.local_part
  end

  test "can get domains", %{email_address: email_address} do
    assert ["com", "example"] = email_address.domains
  end
end
