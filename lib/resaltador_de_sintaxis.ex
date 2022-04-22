defmodule ResaltadorDeSintaxis do

  def main(args\\[]) do
    IO.inspect(args)
  end

  # Función que procesa el archivo .py
  def read_file(file) do
    File.read!(file) |> to_charlist() |> :lexer.string
  end

  # Función que genera una línea html como respuesta a un token
  def format(tokens) do
    Enum.map(tokens, fn {line, token, tchars} ->
      {line, "<span class=#{token}>#{tchars}</span>"}
    end)
  end

end