Select 
		c.Nome
		,sum(v.ValorLiquido) as 'Total Comprado'
		,avg(v.ValorLiquido) as 'Ticket Médio do Cliente'
		,(select avg(ValorLiquido) from Venda ) as 'Media Empresa'
		,(avg(v.ValorLiquido) / (select avg(ValorLiquido) from Venda ))*100 as Comparativo
from Venda v 
join Cliente c  on v.ClienteID = c.ClienteID 
GROUP by c.Nome
order by 'Total Comprado' desc