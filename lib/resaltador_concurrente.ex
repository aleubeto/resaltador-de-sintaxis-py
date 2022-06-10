defmodule ResaltadorConcurrente do

  def concurrencia(carpeta) do
    Task.start(fn -> ResaltadorSecuencial.main(carpeta) end)
  end

end