--
-- Creating wi-fi network as an AP and it also connect in another network
--
-- Gabriel Richter <gabrielrih@gmail.com>
-- Created on 2016-04-14
-- Modified on 2017-03-22

print ("Starting rede.lua")

-- Set as STATION and AP
wifi.setmode(wifi.STATIONAP)

-- Set AP configs
cfg={}
cfg.ssid="NewNodeMCUNetwork"
cfg.pwd="12345678"
cfg.channel=10
wifi.ap.config(cfg)

tmr.alarm(0,1000,1, function()
	if wifi.ap.getip() == nil then
		print("Creating WI-FI...")
	else
		print("It's done")
		print("IP Address: ",wifi.ap.getip())
		tmr.stop(0)
	end

end)


-- Connect in another Wi-Fi
ssid = "OpenWrtMaster"
pass = "a6aa406a7e"
wifi.sta.config(ssid,pass)

tmr.alarm(0,1000,1, function ()
	if wifi.sta.getip() == nil then
		print ("Connecting in the network: ",ssid)
	else
		ip, nm, gw = wifi.sta.getip()
		print("MAC Address: ", wifi.sta.getmac())
		print("IP Address: ",ip)
		print("Netmask: ",nm)
		print("Gateway: ",gw)
		print("Hostname: ",wifi.sta.gethostname())
		tmr.stop(0)
	end
end)
