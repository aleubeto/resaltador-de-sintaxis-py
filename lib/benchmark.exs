Benchee.run(%{
  "secuencial" => fn -> ResaltadorSecuencial.main("test") end,
  "concurrente" => fn -> ResaltadorConcurrente.main("test") end
  },
  formatters: [
    Benchee.Formatters.HTML,
    Benchee.Formatters.Console
  ])