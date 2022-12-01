USE QA_PRD
SELECT * FROM parametros WHERE chave LIKE '%versao%'



USE SD_PRD_ULTIMO_PACOTE
SELECT * FROM parametros WHERE chave LIKE '%versao%' AND VALOR LIKE '%2022.3.0.0%'



SELECT VALOR FROM parametros WHERE chave LIKE '%versao%' AND VALOR LIKE '%2022.2.0.0%'

