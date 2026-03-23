SELECT 
    g.Descricao,
    COUNT(DISTINCT p.ProdutoID) AS QtdeProdutos,
    SUM(DISTINCT p.Estoque) AS QuantidadeEstoque,
    SUM(vp.QtdeVendida) AS TotalVendido,
    FORMAT(MAX(v.DataPedido), 'dd/MM/yyyy') AS DataUltimaVenda,
    SUM(vp.QtdeVendida) * 100.0 /
        (SELECT SUM(QtdeVendida) FROM VendaProduto) AS Percentual
FROM Produto p
JOIN Grupo g 
    ON p.GrupoID = g.GrupoID
LEFT JOIN VendaProduto vp 
    ON vp.ProdutoID = p.ProdutoID
LEFT JOIN Venda v
    ON vp.VendaID = v.VendaID
GROUP BY 
    g.Descricao;