SELECT 
	p.ProdutoID 
	,p.Descricao 
	,SUM(vp.ValorDesconto ) as 'Total de desconto'
	,SUM(vp.ValorDesconto) * 100.0 /
        (SELECT SUM(ValorDesconto) FROM VendaProduto) AS Percentual
FROM  VendaProduto vp 
JOIN Produto p
	ON vp.ProdutoID = p.ProdutoID 
GROUP BY p.ProdutoID, 
		p.Descricao;