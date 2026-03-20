select p.Descricao
from Produto p 
join VendaProduto vp on p.ProdutoID = vp.ProdutoID
