----- Cria��o do banco de dados -----

CREATE DATABASE bdFornecedor
USE bdFornecedor

----- Cria��o da tabela -----

CREATE TABLE tbFornecedores (
	id_fornecedor INT PRIMARY KEY NOT NULL,
	nome_fornecedor VARCHAR(50) NOT NULL,
	endereco_fornecedor VARCHAR(100) NOT NULL,
	CNPJ_fornecedor CHAR(14) NOT NULL,
	telefone_fornecedor VARCHAR(11) NOT NULL
);

----- Inser��o de dados -----

INSERT INTO tbFornecedores (id_fornecedor, nome_fornecedor, endereco_fornecedor, CNPJ_fornecedor, telefone_fornecedor)
VALUES (1, 'Casas Bahia', 'R. Prof. Jo�o de Lima Paiva, 65 - Guaianases, S�o Paulo - SP, 08411-020', '59291534000175', '1125512800'),
       (2, 'Marabraz', 'Av. Souza Ramos, 413 - Guaianases, S�o Paulo - SP, 08490-490', '01781795000185', '1148989842'),
	   (3, 'Lojas CEM', 'Av. Souza Ramos, 245 - Guaianases, S�o Paulo - SP, 08490-490', '56642960000100', '1122852644')

----- Cria��o da view -----

CREATE VIEW vwFornecedores AS
SELECT id_fornecedor AS 'ID', nome_fornecedor AS 'Nome', endereco_fornecedor AS 'Endere�o',
SUBSTRING(CNPJ_fornecedor,1,2) + '.' + SUBSTRING(CNPJ_fornecedor,3,3) + '.' + SUBSTRING(CNPJ_fornecedor,6,3) + '/' + SUBSTRING(CNPJ_fornecedor,9,4) + '-' + SUBSTRING(CNPJ_fornecedor,13,14) AS 'CNPJ',
'(' + SUBSTRING(telefone_fornecedor,1,2) + ') ' + SUBSTRING(telefone_fornecedor,3,4) + '-' + SUBSTRING(telefone_fornecedor,7,4) AS 'Telefone'
FROM tbFornecedores

SELECT * 
FROM vwFornecedores
WHERE ID IN (1, 2, 3)