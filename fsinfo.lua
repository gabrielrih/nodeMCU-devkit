-- Imprime informações de espaço de armazenamento
-- Gabriel Richter <gabrielrih@gmail.com>
-- 2016-04-14

print ("Starting fsinfo.lua")

remaining, used, total = file.fsinfo()

remaining = remaining / 1024
used = used / 1024
total = total / 1024
print("\nFile system info:\nTotal: "..total.." KB\nUsed: "..used.." KB\nRemain: "..remaining.." KB\n")
