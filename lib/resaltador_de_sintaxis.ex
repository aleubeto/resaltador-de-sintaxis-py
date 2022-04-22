defmodule ResaltadorDeSintaxis do

  def main(args\\[]) do
    IO.inspect(args)
  end

  # 
  def read_file(file) do
    File.read!(file)
    
  end
  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      "<span class=#{token}>#{tchars}</span>"
    end)
  end


end