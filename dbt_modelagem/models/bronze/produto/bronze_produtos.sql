WITH tabela_produtos_formatada AS 
(
SELECT
	a.id
	,a.nome_produto
	,a.sku
	,a.marca
	,a.modelo
	,a.cw
	,a.dia_criacao
	,a.mes_criacao
	,a.ano_criacao
	,a.data_criacao
	,a.anomesdia

FROM(
	select 
		id
		,upper(trim(nome_produto)) as nome_produto
		,sku
		,upper(trim(marca)) as marca
		,upper(trim(modelo)) as modelo
		,upper(trim(cw)) as cw
		,substr(cast(data_criacao as varchar), 7, 2) as dia_criacao
		,substr(cast(data_criacao as varchar), 5, 2) as mes_criacao
		,substr(cast(data_criacao as varchar), 1, 4) as ano_criacao
		,concat(substr(cast(data_criacao as varchar), 7, 2), '/', substr(cast(data_criacao as varchar), 5, 2), '/', substr(cast(data_criacao as varchar), 1, 4)) as data_criacao
		,data_criacao as anomesdia
		
	from
		{{ source("loja", "produtos") }}
	) AS A

)

SELECT
    id
	,nome_produto
	,sku
	,marca
	,modelo
	,cw
	,dia_criacao
	,mes_criacao
	,ano_criacao
	,data_criacao
	,anomesdia

FROM
    tabela_produtos_formatada