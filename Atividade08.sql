CREATE VIEW Atividade08 AS
SELECT 
    g.Descricao AS Grupo,
    YEAR(v.DataPedido) AS Ano,
    SUM(vp.QtdeVendida * vp.PrecoLiquido ) AS ValorAcumulado
FROM VendaProduto vp
JOIN Produto p 
	ON vp.ProdutoID = p.ProdutoID
JOIN Grupo g 
	ON p.GrupoID = g.GrupoID
JOIN Venda v 
	ON vp.VendaID = v.VendaID
GROUP BY 
    g.Descricao,
    YEAR(v.DataPedido);