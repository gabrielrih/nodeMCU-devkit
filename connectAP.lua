-- Connect to OpenWRTMaster wi-fi
-- 
-- Gabriel Richter <gabrielrih@gmail.com>
-- Created on 2016-03-30
-- Modified on 2017-03-22

-- Variables
ssid = "OpenWrtMaster"
pass = "a6aa406a7e"

-- Set station mode
wifi.setmode(wifi.STATION)
-- Connect to AP
wifi.sta.config(ssid, pass)

tmr.alarm(0,1000,1, function()

	if wifi.sta.getip() == nil then
		print("Connecting to AP...\n")
	else
		ip, nm, gw = wifi.sta.getip()
		print('MAC Address: ', wifi.sta.getmac())
		print("IP Address: ",ip)
		print("Netmask: ",nm)
		print("Gateway: ",gw)
		print("Hostname: ",wifi.sta.gethostname())
		tmr.stop(0)
	end
end)
