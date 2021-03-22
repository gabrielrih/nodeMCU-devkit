-- Habilita a porta 25 e retorna um OK ao cliente
--
--
--
-- Gabriel Richter
-- 2016-03-11

print ("Iniciando enableSMTPport.lua")

-- Cria um servico TCP com time out de 30
service=net.createServer(net.TCP, 30)

-- Servico roda na porta 25 e chama a funcao conn
service:listen(25,function(conn)

	-- Quando algum cliente se conecta o servidor
	-- somente retorna uma mensagem e fecha a conexao
	conn:send("CONEXION OK \n")
	conn:close()
end)
