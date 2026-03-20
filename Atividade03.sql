SELECT 
    FORMAT(v.DataPedido, 'MMM/yyyy', 'pt-BR') AS MesAno,
    SUM(vp.QtdeVendida) AS TotalVendido
FROM VendaProduto vp
JOIN Venda v ON vp.VendaID = v.VendaID 
GROUP BY 
    YEAR(v.DataPedido),
    MONTH(v.DataPedido),
    FORMAT(v.DataPedido, 'MMM/yyyy', 'pt-BR')
ORDER BY 
    YEAR(v.DataPedido),
    MONTH(v.DataPedido);