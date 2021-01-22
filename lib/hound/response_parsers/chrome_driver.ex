defmodule Hound.ResponseParsers.ChromeDriver do
  @moduledoc false

  use Hound.ResponseParser

  @spec handle_error(any) :: {:error, any}
  def handle_error(%{"message" => "no such element" <> _rest}) do
    {:error, :no_such_element}
  end
end
