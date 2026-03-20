select 
		LEFT(c.Nome, CHARINDEX(' ', c.Nome)),
		format(cf.DataNascimento, 'dd/MM')
from ClienteFisico cf 
JOIN Cliente c on cf.ClienteID = c.ClienteID
order BY 
		format(cf.DataNascimento, 'dd/MM/yyyy')