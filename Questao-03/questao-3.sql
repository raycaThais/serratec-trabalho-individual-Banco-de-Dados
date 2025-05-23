SELECT * FROM exercicio_2.livro;
INSERT into exercicio_2.livro 
	(titulo, autor, ano_publicacao, genero, quantida_estoque, editora)
VALUES 
	('1984','George Orwell','1949','Distopia','78','Antígona'),
	('O Conto da Aia','Margaret Atwood','1985','Distopia','56','Bertrand Editora'),
	('Dom Casmurro','Machado de Assis','1899','Romance','54','Nova Fronteira'),
	('A Revolução dos Bichos','George Orwell','1945','Fábula política','64','Companhia das Letras '),
	('O Pequeno Príncipe','Antoine de Saint-Exupéry','1943','Fábula filosófica','44','HarperCollins Brasil'),
	('A Biblioteca da Meia-Noite','Matt Haig','2020','Ficcção contemporânea','32','Bertrand Brasil'),
	('Orgulho e Preconceito','Jane Austen','1813','Romance clássico','42','Zahar'),
	('Ensaio Sobre a Cegueira','José Saramago','1995','Ficção alegórica','25','Companhia das Letras'),
	('It: A Coisa','Stephen King','1986','Terror','22','Suma'),
	('O Nome do Vento','Patrick Rothfuss','2007','Fantasia','36','Arqueiro')

INSERT into exercicio_2.usuario
	(nome, cpf, email, telefone, endereco)
VALUES
	('Bruno Ventura','123.456.789-10','brunoventura@gmail.com','(21) 98765-4321','Rua Carmela Dutra, 678 – Agriões – Teresópolis – RJ, 25963-140'),
	('Cauã Pacheco','234.567.891-01','cauapacheco@gmail.com','(21) 99876-5432','Avenida Lúcio Meira, 375 – Centro – Teresópolis – RJ, 25953-002'),
	('Guilherme Henrique','345.678.910-11','guilhermehenrique@gmail.com','(21) 91234-5678','Estrada União Indústria, 9.900 – Centro/Itaipava – Petrópolis – RJ, 25730-736'),
	('Lívia Raissinger','456.789.101-12','liviaraissinger@gmail.com','(21) 96543-2109','Avenida Barão do Rio Branco, 2.001 – Centro – Petrópolis – RJ, 25680-270'),
	('Mateus Karl','567.891.011-12','mateuskarl@gmail.com','(21) 93456-7890','Avenida Barão do Rio Branco, 2.053 – Centro – Petrópolis – RJ, 25680-275')

UPDATE exercicio_2.usuario
SET
	telefone = '(21) 97543-2109'
WHERE
	id = 4;

-- 4. Tente remover um usuário específico da tabela usuario que possui um empréstimo. O que aconteceu? Explique o que ocorreu. 
INSERT into exercicio_2.emprestimo
	(id_usuario, id_livro, data_emprestimo, data_devolucao, status)
VALUES 
	('1', '1', '28-02-2025',null,default),
	('2', '5', '27-03-2025',null,default),
	('3', '7', '02-01-2025',null,default),
	('4', '2', '15-03-2025',null,default),
	('5', '10', '03-03-2025',null,default)

DELETE FROM exercicio_2.usuario
WHERE id=3;