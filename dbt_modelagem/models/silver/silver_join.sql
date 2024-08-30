WITH tabela_bronze_vendas AS
(
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
    {{ ref('bronze_vendas') }}
),

tabela_bronze_produtos as
(
SELECT
    id
	,nome_produto
	,sku
	,marca
	,modelo
	,cw

FROM
    {{ ref('bronze_produtos') }}
)

SELECT
    tbv.id_venda
	,tbv.id_produto
    ,tbp.nome_produto
    ,tbp.sku
    ,tbp.marca
    ,tbp.modelo
    ,tbp.cw
	,tbv.valor
	,tbv.dia_venda
	,tbv.mes_venda
	,tbv.ano_venda
	,tbv.data_venda
	,tbv.anomesdia

FROM
    tabela_bronze_vendas as tbv

JOIN
    tabela_bronze_produtos as tbp
ON
    cast(tbp.id as int) = cast(tbv.id_produto as int)