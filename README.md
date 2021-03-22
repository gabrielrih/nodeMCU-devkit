# nodeMCU-devkit

##Sobre o dispositivo
Dispositivo: nodemcu devkit
Capacidade: 4MB

##Como configurar
- Gravar o firmware do NodeMCU  (http://nodemcu-build.com/). Esse firmware utiliza a linguagem Lua.
- Usar o esptool.py para gravar o firmware no dispositvo (https://github.com/themadinventor/esptool)
	
```shell
$esptool.py --port /dev/ttyUSB0 --bad 115200 write_flash --flash_mode dio --flash_size 32m 0x0 nodemcu-dev-39-modules-2016-03-09-00-54-59-float.bin
```

##Como usar
- Usar o gtkterm para abrir o console do nodeMCU (baixar via apt). Esse software é apenas un console para executar os comando diretamente no NodeMCU.
- Usar o luatool para enviar scripts para o nodeMCU (https://github.com/4refr0nt/luatool)

```shell
./luatool.py -p /dev/ttyUSB0 -b 115200 -f arquivo.lua (esse comando envia o arquivo.lua para o NodeMCU)
./luatool.py -p /dev/ttyUSB0 -b 115200 -l (lista os arquivos do File System do NodeMCU)
```
