-- Simple telnet
-- Reference: https://github.com/nodemcu/nodemcu-firmware

s=net.createServer(net.TCP, 180)
s:listen(2323, function(c)
	function s_output(str)
		if(c~=nil)
			then c:send(str)
		end
	end
	
	node.output(s_output, 0) --redireciona  saida para funcao
	c:on("receive", function(c, l)
		node.input(l)
	end)
	c:on("disconnection", function(c)
		node.output(nil)
	end)
	
	print ("Welcome to NodeMCU world.")
end)
