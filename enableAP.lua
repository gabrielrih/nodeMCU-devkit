-- Enable Access Point

-- Set AP mode
wifi.setmode(wifi.SOFTAP)

cfg={}
cfg.ssid="NodeMCUNetwork"
cfg.pwd="123asd.ASD"
cfg.auth=AUTH_WPA2_PSK
cfg.channel=11
wifi.ap.config(cfg)

tmr.alarm(0,1000,1, function()
	if wifi.ap.getip() == nil then
		print ("Creating network...")
	else
		print ("It's done")
		print ("IP Address: ", wifi.ap.getip())
		tmr.stop(0)
	end
end)
