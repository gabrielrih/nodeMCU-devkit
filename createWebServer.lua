-- This script create a Web Server which has the function to turn ON and turn OFF a led (GPIO = 4)
--
-- Gabriel Richter <gabrielrih@gmail.com>
-- Created on 2016-03-08
-- Modified on 2017-03-22
--
-- Reference: http://randomnerdtutorials.com/esp8266-web-server/

print ("Starting createWebServer.lua")

-- Internal led pin NODEMCU
led = 4
gpio.mode(led, gpio.OUTPUT)

-- Creating the service in port 80
srv = net.createServer(net.TCP, 30)
srv: listen(80,function(conn)

	-- Register callback when event RECEIVE happens
	conn:on ("receive",function(client,request)
	
		-- Client response
		local buf = "";

		-- I HAVE NO IDEA WHAT IT DOES
	        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
		if(method == nil) then
	            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
	        end
	        local _GET = {}
	        if (vars ~= nil) then
	            	for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
			_GET[k] = v
            		end
        	end

		-- Response HTML
		buf=buf.."<head><title>ESP8266 Web Server</title></head>"
		buf=buf.."<center><h1>ESP8266 Web Server</h1>";
		buf=buf.."<p>LED GPI04</p><a href=\"?pin=ON\"><button>TURN ON</button></a>&nbsp;<a href=\"?pin=OFF\"><button>TURN OFF</button></a></center>";

		-- Check if it needs turn ON or turn OFF the led
		if (_GET.pin == "ON") then
			gpio.write(led, gpio.LOW);
			print("Led ON")
		else
			gpio.write(led, gpio.HIGH);
			print ("Led OFF")
		end

		client:send(buf);
		client:close();
		collectgarbage();
	end)
end)
