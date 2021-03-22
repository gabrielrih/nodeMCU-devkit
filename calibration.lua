-- Exemplo:
-- Para utilizar um sensor que o intervalo de leitura analógica é variável
-- é necessário calibrar o sensor com o valor mínimo e máximo
--
--
-- Gabriel Richter <gabrielrih@gmail.com
-- 2016-04-14

-- Valores para calibrar
val_min = 50
val_max = 500

-- Único pino do NodeMCU para ADC
local pin_adc = 0
val = adc.read(pin_adc)


-- CALIBRAGEM
-- Para calibrar deve-se deixar o tanque vazio
-- e o valor da leitura do sensor deve ser colocado na variável "val_min"
-- Depois deve-se encher o tanque e o valor da leitura do sensor deve ser
-- colocado na variável "val_max"
print("ADC Read: ",val)

-- Imprime a porcentagem do tanque cheio
print("O tanque está ",map(val,val_min,val_max),"% cheio")


-- A função retorna um valor entre 0 e 100
-- Pode ser medido em porcentagem
-- 
-- Referência: Função MAP do Arduino
-- <https://www.arduino.cc/en/Reference/Map>
function map (val, val_min, val_max) do
	return	(((val - val_min) * 1000) / ((val_max - val_min)))
end
