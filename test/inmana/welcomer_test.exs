defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very especial banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "MaTeUs \n", "age" => "18"}
      expected_result = {:ok, "Welcome mateus"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns a error" do
      params = %{"name" => "Mateus", "age" => "17"}
      expected_result = {:error, "You shall not pass mateus"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
