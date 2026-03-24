SELECT 
		g.Descricao as Grupo
		,format(v.DataPedido, 'MMM/yyyy', 'pt-br')
		,sum(vp.QtdeVendida) as QuantidadeVendida
		,SUM(p.PrecoVenda ) as TotalVendido
		,format(MIN(v.DataPedido ), 'dd/MM/yyyy', 'pt-br' ) as PrimeiraVenda
		,format(MAX(v.DataPedido ), 'dd/MM/yyyy', 'pt-br' ) as UltimaVenda
FROM VendaProduto vp
join Produto p 
	on VP.ProdutoID = P.ProdutoID 
join Grupo g 
	on p.GrupoID = g.GrupoID 
join Venda v 
	on vp.VendaID = v.VendaID 
group by 
		g.Descricao,
		format(v.DataPedido, 'MMM/yyyy', 'pt-br'),
		 YEAR(v.DataPedido),
        MONTH(v.DataPedido)
order BY 
		YEAR(v.DataPedido),
        MONTH(v.DataPedido),
        g.Descricao;