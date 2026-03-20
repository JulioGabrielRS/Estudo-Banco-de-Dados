select
    m.Descricao
    ,SUM(vp.QtdeVendida) as NumVendas
    , (select SUM(QtdeVendida) from VendaProduto )  as TotaL_vendas
    ,(SUM(vp.QtdeVendida) * 100 / 
 CAST((select SUM(QtdeVendida) from VendaProduto) AS DECIMAL(10,2))) as Percentual
FROM VendaProduto vp
join Produto p on vp.ProdutoID = p.ProdutoID
join Marca m on p.MarcaID = m.MarcaID
group by m.Descricao
