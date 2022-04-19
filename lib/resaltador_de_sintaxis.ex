defmodule ResaltadorDeSintaxis do
  def main(args\\[]) do
    IO.inspect(args)
  end
  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      case token do
        #:id -> "<span class=\"identifier\">#{tchars}</span>"
        #:op -> "<span class=\"operator\">#{tchars}</span>"
        #:int -> "<span class=\"integer\">#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
  end
end