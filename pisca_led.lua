-- Pisca LED interno
--
-- Gabriel Richter <gabrielrih@gmail.com>
-- 2016-04-14

local led = 4
local i = 0
gpio.mode(led, gpio.OUTPUT)

while (i<50) do
	gpio.write(led, gpio.LOW)
	tmr.delay(50000)
	gpio.write(led, gpio.HIGH)
	tmr.delay(50000)
	i = i + 1
end
