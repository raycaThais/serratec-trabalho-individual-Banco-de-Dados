---------------------------------1:
SELECT * FROM exercicio_2.livro;
---------------------------------2:
SELECT 
exercicio_2.usuario.nome as nome, exercicio_2.livro.titulo	as livro
FROM 
exercicio_2.emprestimo
JOIN exercicio_2.usuario ON exercicio_2.emprestimo.id_usuario = usuario.id
JOIN exercicio_2.livro  ON exercicio_2.emprestimo.id_livro = livro.id;
---------------------------------3:
SELECT 
*
FROM 
exercicio_2.emprestimo
WHERE
status = 'emprestado'
---------------------------------4:
SELECT
exercicio_2.livro.autor, exercicio_2.livro.titulo 
FROM
exercicio_2.livro
ORDER BY 
autor asc
---------------------------------5:
INSERT into exercicio_2.usuario --adicionando usuários sem emprestimos
	(nome, cpf, email, telefone, endereco)
VALUES
	('Ana Karolina','213.142.415-30','anakarolina@gmail.com','(21) 99112-2334','Rua das Hortênsias, 1254 – Bairro Alto, Teresópolis - RJ, 25960-000'),
	('Beatriz Araújo','554.433.221-10','beatrizaraujo@gmail.com','(21) 95566-7788','Avenida das Montanhas, 872 – Várzea, Teresópolis - RJ, 25953-000')
	

SELECT 
exercicio_2.usuario.nome, exercicio_2.livro.titulo	as livro, exercicio_2.emprestimo.status
FROM 
exercicio_2.usuario
LEFT JOIN exercicio_2.emprestimo ON id_usuario = usuario.id
LEFT JOIN exercicio_2.livro ON emprestimo.id_livro = livro.id
