WITH tabela_vendas_formatada AS
(
SELECT
	a.id_venda
	,a.id_produto
	,a.valor
	,a.dia_venda
	,a.mes_venda
	,a.ano_venda
	,a.data_venda
	,a.anomesdia

FROM(
	SELECT 
		id_venda
		,id_produto
		,cast(valor as decimal(10, 2)) as valor
		,substr(cast(data_venda as varchar), 7, 2) as dia_venda
		,substr(cast(data_venda as varchar), 5, 2) as mes_venda
		,substr(cast(data_venda as varchar), 1, 4) as ano_venda
		,concat(substr(cast(data_venda as varchar), 7, 2), '/', substr(cast(data_venda as varchar), 5, 2), '/', substr(cast(data_venda as varchar), 1, 4)) as data_venda
		,data_venda as anomesdia
		
	FROM 
		{{ source("loja", "vendas") }}
	) AS A
)

SELECT
    id_venda
	,id_produto
	,valor
	,dia_venda
	,mes_venda
	,ano_venda
	,data_venda
	,anomesdia

FROM
    tabela_vendas_formatada