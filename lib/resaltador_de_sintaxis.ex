defmodule ResaltadorDeSintaxis do
  def main(args\\[]) do
    IO.inspect(args)
  end
  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      case token do
        :funcion -> "<span class=\"funcion\">#{tchars}</span>"
        :metodo -> "<span class=\"metodo\">#{tchars}</span>"

        :ciclo -> "<span class=\"ciclo\">#{tchars}</span>"
        :condicional -> "<span class=\"condicional\">#{tchars}</span>"

        :comentario -> "<span class=\"comentario\">#{tchars}</span>"
        :comentario_largo -> "<span class=\"comentario_largo\">#{tchars}</span>"

        :int -> "<span class=\"int\">#{tchars}</span>"
        :float -> "<span class=\"float\">#{tchars}</span>"
        :string -> "<span class=\"string\">#{tchars}</span>"
        :boolean -> "<span class=\"boolean\">#{tchars}</span>"

        :operador_logico -> "<span class=\"operador_logico\">#{tchars}</span>"
        :operador_aritmetico -> "<span class=\"operador_aritmetico\">#{tchars}</span>"
        :operador_asignacion -> "<span class=\"operador_asignacion\">#{tchars}</span>"

        :puntuacion -> "<span class=\"puntuacion\">#{tchars}</span>"
        :parentesis -> "<span class=\"parentesis\">#{tchars}</span>"
        :llaves -> "<span class=\"llaves\">#{tchars}</span>"
        :corchetes -> "<span class=\"corchetes\">#{tchars}</span>"

        :palabra_reservada -> "<span class=\"palabra_reservada\">#{tchars}</span>"
        :identificador -> "<span class=\"identificador\">#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
  end
end