
-------------------------------------------------------------- Implementação de Banco de Dados 2.0 --------------------------------------------------------

-- Criação do Banco de Dados 
 
 CREATE DATABASE mercado;
 
 USE mercado;
 
-- Criação das tabelas

CREATE TABLE clientes (
id_cliente INT UNSIGNED NOT NULL AUTO_INCREMENT, 
cpf VARCHAR(15) NOT NULL, 
nome VARCHAR(100) NOT NULL, 
telefone VARCHAR(30) NOT NULL,
rua VARCHAR(200) NOT NULL,
numero VARCHAR(10) NOT NULL,
bairro VARCHAR(50) NOT NULL,
cep VARCHAR(20) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);



CREATE TABLE compras(
	id_compra INT UNSIGNED NOT NULL AUTO_INCREMENT,
	data_compra DATE NOT NULL,
	valor FLOAT NOT NULL,
	id_cliente INT UNSIGNED DEFAULT NULL,
	CONSTRAINT pk_compra PRIMARY KEY (id_compra),
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE);
	
	
CREATE TABLE produtos(
	id_produto INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	tipo VARCHAR(100) NOT NULL,
	preco FLOAT NOT NULL,
	estoque INT NOT NULL,
	CONSTRAINT pk_produto PRIMARY KEY (id_produto));
	
	
	
CREATE TABLE compras_contem_produtos(
	id_contem INT UNSIGNED NOT NULL AUTO_INCREMENT,
	id_compra INT UNSIGNED DEFAULT NULL,
	id_produto INT UNSIGNED DEFAULT NULL,
	quantidade INT NOT NULL,
	CONSTRAINT pk_contem PRIMARY KEY (id_contem),
	CONSTRAINT fk_compra FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
	CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON UPDATE CASCADE ON DELETE CASCADE);
	
	
-- Inserção de registros nas colunas(População)


INSERT INTO clientes (cpf, nome, telefone, rua, numero, bairro, cep, cidade, estado) VALUES
	('42.515.012-4','Leonardo Diego das Neves','(68)9.8106-8326','Avenida Santos Dumont','160','Centro','69934-970','Epitaciolândia','AC'),
	('35.993.799-8','Vallentina Jenniffer Livia','(64) 98941-7452','Avenida 11 de Novembro','729','Setor Central','75619-970','Aloândia','GO'), 
	('14.594.456-6','Benedito Henry Teixeira','(88) 99690-4161','Rua Eduardo Mota','640','Centro','62420-970','Chaval','CE'), 
	('11.946.174-2','Mariah Jaqueline Aparício','(88) 3753-8770','Rua Santa Isabel','539','São Miguel','63010-555','Juazeiro do Norte','CE'),
	('27.722.583-8','Alice Pietra Ramos','(31) 99404-8773','Rua Doutor Álvaro Lobo Leite','521','Centro','36419-970','Lobo Leite','MG'), 
	('38.895.346-9','Mário Márcio Ruan Pinto','(13) 98485-6954','Rua Rubião Júnior','418','Centro','11013-210','Santos','SP'),
	('88.895.346-9','Marcos Rafael Andrade','(71) 92885-6954','Rua Uruguai Avelar','22','Avenida','11228-210','Salvador','BA'),
	('17.778.228-2','Tereza Cristina Salvação','(71) 98630-6954','Rua Semírames Seixas','201','Liberdade','40013-365','Salvador','BA'),
	('19.725.110-2','Breno Amin Matos Gomes','(71) 99963-6954','Rua Arthur Coelho','28','Liberdade','40366-370','Salvador','BA'),
	('21.520.245-3','Pablo Henrique Matos Gomes','(71) 98630-8567','Rua Arthur Coelho','28','Liberdade','40366-370','Salvador','BA');
	
	
INSERT INTO compras (data_compra, valor, id_cliente) VALUES
	('2022-10-05',58.8,4),
	('2022-10-05',110,1),
	('2022-10-07',81.7,3), 
	('2022-10-08',51,6),
	('2022-10-15',80.5,4),
	('2022-10-22',10.6,7),
	('2022-10-28',7.9,9),
	('2022-11-04',22.5,6),
	('2022-11-05',35.4,9),
	('2022-11-06',36,8);
	
INSERT INTO produtos (nome, tipo, preco, estoque) VALUES
	('Energético TNT 269ML','Bebidas',5.5,35),
	('Arroz Juliano Parboilizado','Arroz',4.5,150),
	('Arroz Juliano Branco','Arroz',4.2,122)	,
	('Coca Cola 1 litro','Bebidas',8.5,36),
	('Biscoito Recheado Bolão Morango','Doces',2.7,45),
	('Água Mineral sem Gás','Bebidas',2,266),
	('Chocolate Gutti Gutti 50g','Doces',1.9,61),
	('Margarina Delícia 500G','Laticínio',8.31,220),
	('Tempero Alho com Sal 1kg Arisco','Especiarias e Condimentos',14.03,25),
	('Mistura Creme de Confeiteiro Fontini - 1kg','Mistura para Bolos',9.99,240),
	('Fruta Cristalizada Pacote 1Kg','Conservas e Enlatados',8.40,82),
	('Salsicha Sadia Hot Dog Pacote 500g','Enbutidos',12.78,66),
	('Bebida De Fruta Kapo Abacaxi 200ml','Bebidas',2.49,51),
	('Carvão Brasil Pacote 3kg','Carvão',15.47,187),
	('Detergente Em Pó Baby Soft 800g','Produtos de Limpeza',11.69,59);
	
	
	
INSERT INTO compras_contem_produtos (id_compra, id_produto, quantidade) VALUES
	(1,3,10),
	(1,15,4),
	(7,8,2),
	(2,12,15),
	(2,6,10),
	(6,9,4),
	(3,4,10),
	(3,7,22),
	(8,8,4),
	(4,4,13),
	(10,14,6),
	(6,13,6),
	(9,2,6),
	(9,1,6),
	(10,5,6),
	(6,10,2),
	(8,11,1);
	
------------------------------------------------------------------- Queries Executadas -----------------------------------------------------------

-- 1) Mostrar todos os dados de Clientes.

 SELECT * FROM clientes;

-- 2) Mostrar nome, cpf e telefone dos Clientes.
 
 SELECT nome, cpf, telefone FROM clientes;
 
-- 3) Mostrar nome e preço de todos os Produtos.

 SELECT nome, preco FROM produtos;

-- 4) Mostrar nome, preço e estoque das Bebidas.

 SELECT nome, preco, estoque FROM produtos WHERE tipo = 'Bebidas';
 
-- 5) Mostrar todos os produtos com preço acima de 5 reais.

 SELECT * FROM produtos WHERE preco > 5;
 
-- 6) Mostrar a quantidade total de produtos em estoque.

 SELECT SUM(estoque) AS qtd_estoque FROM produtos;
 
-- 7) Mostrar a soma de todas as compras.

 SELECT SUM(valor) FROM compras;
 
-- ou para "quebrar" os valores depois da vírgula, utiliza-se esta query abaixo.
 SELECT FORMAT (SUM(valor),2) AS soma_valor FROM compras;
 
-- 8) Mostrar todos os produtos ordenados pelo nome (A-Z).

 SELECT nome FROM produtos ORDER BY nome;
 
-- 9) Mostrar o nome e o valor total da compra realizada pela cliente "Mariah Jaqueline Aparício".	

 SELECT clientes.nome, SUM(compras.valor) AS valor_total
FROM clientes
INNER JOIN compras ON clientes.id_cliente = compras.id_cliente
WHERE clientes.nome = 'Mariah Jaqueline Aparício'
GROUP BY clientes.nome;

-- 10) Mostrar todos os clientes que são do estado de SP ou do CE.	
	
 SELECT nome, estado FROM clientes WHERE estado = 'SP' OR estado = 'CE';

-- 11) Mostrar todos os clientes que são do estado do CE e do bairro Centro.

 SELECT nome, estado, bairro FROM clientes WHERE estado = 'CE' and bairro = 'Centro';
 
-- 12) Mostrar a lista de produtos ordenado pelo preço do menor para o maior.

 SELECT nome, preco FROM produtos ORDER BY preco ASC;
 
 -- 13) Mostrar uma lista dos produtos que foram comprados pelo cliente "Benedito Henry Teixeira", bem como seu nome e endereço completo.
 
 SELECT nome, nome_cliente, rua, numero, bairro, cep, cidade, estado FROM clientes INNER JOIN compras ON clientes.id_cliente = compras.id_cliente INNER JOIN compras_contem_produtos ON 
compras.id_compra = compras_contem_produtos.id_compra INNER JOIN produtos ON compras_contem_produtos.id_produto = produtos.id_produto WHERE clientes.id_cliente = 3;
	
-- Nesta query houve a necessidade de alterar o nome da coluna "nome" da tabela clientes, pois a query não estava sendo executada devido a tabela de produtos ter uma coluna com o nome de "nome",
-- havendo ambiguidade de colunas nos JOINS
-- Comando utilizado: 

 ALTER TABLE clientes RENAME COLUMN nome TO nome_cliente;

-- 14) Mostrar a quantidade de clientes que são do estado do CE.
	
 SELECT COUNT(nome_cliente) FROM clientes WHERE estado = 'CE';
 
-- 15) Mostrar a soma dos estoques de todas as bebidas do estabelecimento.

 SELECT SUM(estoque) FROM produtos WHERE tipo = 'Bebidas';