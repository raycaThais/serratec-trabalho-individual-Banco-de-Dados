--CREATE SCHEMA exercicio_2
CREATE TABLE IF NOT EXISTS exercicio_2.livro
(
	id serial primary key,
	titulo varchar(100) NOT NULL,
	autor varchar(100) 	NOT NULL,
	ano_publicacao int NOT NULL,
	genero varchar(50) NOT NULL,
	quantidade_estoque int NOT NULL
)

CREATE TABLE IF NOT EXISTS exercicio_2.usuario
(
	id serial primary key,
	nome varchar(100) NOT NULL,
	cpf varchar(14) UNIQUE,
	email varchar(50)UNIQUE,
	telefone varchar(25) NOT NULL,
	endereco varchar(255) NOT NULL
)

CREATE TYPE status_enum AS ENUM ('emprestado', 'devolvido');

CREATE TABLE IF NOT EXISTS exercicio_2.emprestimo
(
	id serial primary key,
	id_usuario INT NOT NULL,  
    id_livro INT NOT NULL,   
	FOREIGN KEY (id_usuario) REFERENCES exercicio_2.usuario(id),
	FOREIGN KEY (id_livro) REFERENCES  exercicio_2.livro(id),
	data_emprestimo date NOT NULL,
	data_devolucao date,
	status status_enum NOT NULL DEFAULT 'emprestado'
)

--5. Escreva um comando SQL para alterar a tabela livro, adicionando um campo editora VARCHAR(100). 

ALTER TABLE exercicio_2.livro
	ADD COLUMN editora varchar(100)
