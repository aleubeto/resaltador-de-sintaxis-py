defmodule ResaltadorDeSintaxis do

  # Funcion ejecutable del HTML:
  # escript resaltador_de_sintaxis "test/prueba1.py" "index.html"
  def main(args\\[]) do
    lectura = read_file(hd(args))
    formato = format(elem(lectura,1))
    File.rm(hd(tl(args)))
    {:ok, archivo} = File.open(hd(tl(args)), [:write])
    IO.binwrite(archivo, '<link rel = "stylesheet" href="lib/style.css">')
    IO.binwrite(archivo, '<body><div class="container"><p>')
    fin = htmlgen(formato, 1, archivo)
    IO.binwrite(archivo, '<p/></div><body/>')
    File.close(archivo)
    fin
  end

  # Función que procesa el archivo .py
  def read_file(file) do
    File.read!(file) |> to_charlist() |> :lexer.string
  end

  # Función que genera una línea html como respuesta a un token
  def format(tokens) do
    Enum.map(tokens, fn {token, line, tchars} ->
      if token == :tab do
        {line, "&emsp;"}
      else
        {line, "<span class=#{token}>#{tchars}</span>"}
      end
    end)
  end

  # Función que genera contenido de archivo html de forma recursiva
  def htmlgen(list, _acc, __file) when list == [] do
    "Fin de la ejecución"
  end
  def htmlgen(list, acc, file) do
    c = acc
    if c == elem(hd(list),0) do
      IO.binwrite(file, elem(hd(list), 1))
      htmlgen(tl(list), c, file)
    else
      c = c + 1
      IO.binwrite(file, "<br>")
      htmlgen(list,c,file)
    end
  end

end
