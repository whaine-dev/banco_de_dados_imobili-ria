CREATE DATABASE imobiliaria;

USE imobiliaria;

CREATE TABLE edificio(
	id_edificio INT AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    cep VARCHAR(9) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    data_de_construcao DATE NOT NULL,
	PRIMARY KEY(id_edificio)
)CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO edificio VALUES
(NULL, "Rua do Sol", "100", "50010470", "Santo Antônio", "Recife", "2010-05-15"),
(NULL, "Avenida Boa Viagem", "850", "51020000", "Boa Viagem", "Recife", "2015-08-20"),
(NULL, "Rua do Apolo", "150", "50030220", "Recife", "Recife", "2005-03-10"),
(NULL, "Rua do Amparo", "100", "53025080", "Amparo", "Olinda", "2018-11-25"),
(NULL, "Rua Treze de Maio", "75", "53020170", "Carmo", "Olinda", "2020-07-30");

CREATE TABLE cliente_cpf_cnpj (
	id_cliente_cpf_cnpj INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_cliente_cpf_cnpj)
)CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE cliente_cpf(
	id_cliente_cpf_cnpj INT,
    cpf VARCHAR(100) NOT NULL UNIQUE,
    data_de_nascimento DATE NOT NULL,
    sexo ENUM("M", "F") NOT NULL,
	telefone VARCHAR(11),
    PRIMARY KEY(id_cliente_cpf_cnpj),
    FOREIGN KEY(id_cliente_cpf_cnpj) REFERENCES cliente_cpf_cnpj(id_cliente_cpf_cnpj )
)CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE cliente_cnpj (
	id_cliente_cpf_cnpj INT,
	cnpj VARCHAR(18) NOT NULL UNIQUE,
    data_de_criacao DATE NOT NULL,
	PRIMARY KEY(id_cliente_cpf_cnpj),
    FOREIGN KEY(id_cliente_cpf_cnpj) REFERENCES cliente_cpf_cnpj(id_cliente_cpf_cnpj)
)CHARSET= utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cliente_cpf_cnpj VALUES
(NULL, "Luciana Sabrina Lopes"),
(NULL, "Hugo Nelson Benício Ribeiro"),
(NULL, "Marcela Giovana Melissa da Paz"),
(NULL, "Nelson Julio Martins"),
(NULL, "Caroline Hadassa Benedita Moura"),
(NULL, "Tech Soluções Ltda."),
(NULL, "Construtora Horizonte Ltda."),
(NULL, "Comercial Nordeste Ltda."),
(NULL, "Logística Nacional Ltda."),
(NULL, "Serviços Digitais Ltda.");

INSERT INTO cliente_cpf VALUES
("1", "024.832.734-83", "1990-02-03", "F", "81971645288"),
("2", "250.019.714-03", "2003-06-23", "M", "81986751088"),
("3", "887.348.574-00", "1989-04-12", "F", "81995126057"),
("4", "327.945.394-18", "1997-07-23", "M", "81991381383"),
("5", "943.414.064-18", "1992-12-03", "F", "81983066257");

INSERT INTO cliente_cnpj VALUES
("6","44.482.710/0001-70","2016-04-27"),
("7","68.447.007/0001-90","2010-01-07"),
("8","19.504.487/0001-78","2004-05-08"),
("9","48.698.346/0001-31","2020-06-15"),
("10","91.370.594/0001-88","2018-05-29");

SELECT * FROM cliente_cpf_cnpj 
INNER JOIN cliente_cpf
	ON cliente_cpf.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj;
    
SELECT * FROM cliente_cpf_cnpj
LEFT JOIN cliente_cnpj
	ON cliente_cnpj.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj;
    
SELECT * FROM cliente_cpf_cnpj 
LEFT JOIN cliente_cpf
	ON cliente_cpf.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj
LEFT JOIN cliente_cnpj
	ON cliente_cnpj.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj;

CREATE TABLE compra (
	id_compra INT AUTO_INCREMENT,
    data_de_compra DATE NOT NULL,
    valor DECIMAL(12,2) NOT NULL,
    id_cliente_cpf_cnpj INT NOT NULL,
    PRIMARY KEY(id_compra),
    FOREIGN KEY(id_cliente_cpf_cnpj) REFERENCES cliente_cpf_cnpj(id_cliente_cpf_cnpj)
)CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO compra VALUES
(NULL, "2018-06-12", "480000.00", "1"),
(NULL, "2021-09-03", "335000.00", "2"),
(NULL, "2012-02-28", "655000.00", "3"),
(NULL, "2022-04-15", "260000.00", "4"),
(NULL, "2023-11-10", "410000.00", "5"),
(NULL, "2019-08-20", "495000.00", "6"),
(NULL, "2020-01-14", "320000.00", "7"),
(NULL, "2015-05-19", "610000.00", "8"),
(NULL, "2023-07-08", "245000.00", "9"),
(NULL, "2024-02-25", "395000.00", "10");

CREATE TABLE apartamento (
	id_apartamento INT AUTO_INCREMENT,
	id_compra INT NOT NULL,
	PRIMARY KEY(id_apartamento),
    FOREIGN KEY(id_compra) REFERENCES compra(id_compra)
)CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO apartamento VALUES
(NULL, "1"),
(NULL, "2"),
(NULL, "3"),
(NULL, "4"),
(NULL, "5"),
(NULL, "6"),
(NULL, "7"),
(NULL, "8"),
(NULL, "9"),
(NULL, "10");

CREATE TABLE edificio_apartamento (
	id_edificio_apartamento INT AUTO_INCREMENT,
	id_edificio INT NOT NULL,
	id_apartamento INT NOT NULL,
	PRIMARY KEY(id_edificio_apartamento),
    FOREIGN KEY(id_edificio) REFERENCES edificio(id_edificio),
    FOREIGN KEY(id_apartamento) REFERENCES apartamento(id_apartamento)
)CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO edificio_apartamento (id_edificio, id_apartamento) 
VALUES
("1","1"),
("1","2"),
("2","3"),
("2","4"),
("3","5"),
("3","6"),
("4","7"),
("4","8"),
("5","9"),
("5","10");

SELECT * FROM cliente_cpf_cnpj
LEFT JOIN cliente_cpf
	ON cliente_cpf.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj
LEFT JOIN cliente_cnpj
	ON cliente_cnpj.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj
INNER JOIN compra
	ON compra.id_cliente_cpf_cnpj = cliente_cpf_cnpj.id_cliente_cpf_cnpj
INNER JOIN apartamento
	ON apartamento.id_compra = compra.id_compra
INNER JOIN edificio_apartamento
	ON edificio_apartamento.id_apartamento = apartamento.id_apartamento;
