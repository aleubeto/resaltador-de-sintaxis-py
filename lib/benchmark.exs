Benchee.run(%{
  "secuencial" => fn -> ResaltadorSecuencial.main("test") end,
  "concurrente" => fn -> ResaltadorConcurrente.concurrencia("test") end
})