----- Criação do banco de dados -----

CREATE DATABASE bdClientes
USE bdClientes

----- Criação das tabelas -----

CREATE TABLE Clientes (
	Codigo INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(15) NOT NULL,
	DataNascimento VARCHAR(10) NOT NULL
);

CREATE TABLE Telefones (
	Codigo INT FOREIGN KEY REFERENCES Clientes (Codigo),
	Fone INT NOT NULL,
	Tipo VARCHAR(15) NOT NULL
);

----- Inserção de dados -----

INSERT INTO Clientes
VALUES ('Marcio', '01061975'),
       ('Marlos', '05081980'),
	   ('Luciane', '10051970'),
	   ('Wilkie', '12031974')

INSERT INTO Telefones
VALUES (1, 22548954, 'Recidencial'),
       (2, 88512547, 'Celular'),
	   (3, 89665485, 'Celular'),
	   (4, 26539955, 'Recidencial')

----- Criação das views -----

CREATE VIEW vwCliente AS
SELECT Nome, SUBSTRING(DataNascimento,1,2) + '/' + SUBSTRING(DataNascimento,3,2) + '/' + SUBSTRING(DataNascimento,5,8) AS 'Data de Nascimento', Fone
FROM Clientes c
LEFT JOIN Telefones t
ON t.Codigo = c.Codigo

SELECT * FROM vwCliente

CREATE VIEW vwCliente2 AS
SELECT * 
FROM Clientes
WHERE Codigo = 2

SELECT * FROM vwCliente2

CREATE VIEW vwCliente3 AS
SELECT Codigo, Nome, SUBSTRING(DataNascimento,1,2) + '/' + SUBSTRING(DataNascimento,3,2) + '/' + SUBSTRING(DataNascimento,5,8) AS 'Data de Nascimento'
FROM Clientes

SELECT c.Codigo, c.Nome, c.[Data de Nascimento], t.Codigo, t.Fone, t.Tipo
FROM vwCliente3 c
INNER JOIN Telefones t
ON t.Codigo = c.Codigo