
-- Gets the WIFI station configuration
ssid, password, bssid_set, bssid=wifi.sta.getconfig()

-- WIFI disconnect
wifi.sta.disconnect()
print ("This device was disconnected of the WIFI:",ssid)
