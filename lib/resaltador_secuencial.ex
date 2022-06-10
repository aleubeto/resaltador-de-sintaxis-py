defmodule ResaltadorSecuencial do

  # Funcion ejecutable del HTML:
  # ResaltadorSecuencial.main("test/test_files")

  def main(folder) do
    test_files = ResaltadorSecuencial.list_all(folder) |> Enum.filter(&String.ends_with?(&1, ".py"))
    for file <- test_files do
      name = List.last String.split(file, "/")
      lectura = read_file(file)
      formato = format(elem(lectura,1))
      File.rm(name)
      {:ok, archivo} = File.open("test/test_output/#{name}.html", [:write])
      IO.binwrite(archivo, '<title>#{name}</title><link rel="icon" href="../../lib/css/img/python.png">')
      IO.binwrite(archivo, '<link rel="stylesheet" href="../../lib/css/style.css">')
      IO.binwrite(archivo, '<body><div class="container"><p>')
      fin = htmlgen(formato, 1, archivo)
      IO.binwrite(archivo, '<p/></div><body/>')
      File.close(archivo)
      fin
    end
  end

  # Funciones para guardar archivos dentro de folders anidados
  def list_all(filepath) do
    _list_all(filepath)
  end
  defp _list_all(filepath) do
    cond do
      String.contains?(filepath, ".git") -> []
      true -> expand(File.ls(filepath), filepath)
    end
  end
  defp expand({:ok, files}, path) do
    files
    |> Enum.flat_map(&_list_all("#{path}/#{&1}"))
  end
  defp expand({:error, _}, path) do
    [path]
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
