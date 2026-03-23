CREATE VIEW Atividade07Union AS
SELECT 
    c.Nome,
    c.ClienteID,
    cf.CPF AS CPFCNPJ
FROM Cliente c
JOIN ClienteFisico cf 
    ON c.ClienteID = cf.ClienteID

UNION

SELECT 
    c.Nome,
    c.ClienteID,
    cj.CNPJ AS CPFCNPJ
FROM Cliente c
JOIN ClienteJuridico cj 
    ON c.ClienteID = cj.ClienteID;