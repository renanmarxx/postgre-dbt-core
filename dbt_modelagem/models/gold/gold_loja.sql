WITH cte_silver_join AS
(
SELECT
    id_venda
	,id_produto
    ,nome_produto
    ,sku
    ,marca
    ,modelo
    ,cw
	,valor
	,dia_venda
	,mes_venda
	,ano_venda
	,data_venda
	,anomesdia

FROM
    {{ ref('silver_join') }}
)

SELECT
    id_venda
	,id_produto
    ,nome_produto
    ,sku
    ,marca
    ,modelo
    ,cw
	,valor
	,dia_venda
	,mes_venda
	,ano_venda
	,data_venda
	,anomesdia

FROM
    cte_silver_join