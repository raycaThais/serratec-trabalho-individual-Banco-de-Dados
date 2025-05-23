
------------------------------------------1:
SELECT 
	COUNT(*)
FROM
	exercicio_2.livro
------------------------------------------2:
UPDATE exercicio_2.emprestimo
SET
	data_devolucao ='03-03-2025',
	status = 'devolvido'
WHERE
	id_usuario= 1 AND id_livro = 1;
-----------------
UPDATE exercicio_2.emprestimo
SET
	data_devolucao ='15-01-2025',
	status = 'devolvido'
WHERE
	id_usuario= 3 AND id_livro = 7;
-----------------
UPDATE exercicio_2.emprestimo
SET
	data_devolucao ='25-03-2025',
	status = 'devolvido'
WHERE
	id_usuario= 4 AND id_livro = 2;
---------------- acima atualizei 3 emprestimos adicionando uma data de devolução e editando o status
SELECT
ROUND (AVG (data_devolucao - data_emprestimo),1) as media_tempo_emprestimo --- Usei o "round" para arrendondar e o "1" atribui as casas decimais exibidas
FROM
exercicio_2.emprestimo
where
data_devolucao is not null

------------------------------------------3:
SELECT
titulo as livro, ano_publicacao
FROM
	exercicio_2.livro
where
ano_publicacao = (SELECT min(ano_publicacao) FROM exercicio_2.livro)


SELECT
titulo as livro, ano_publicacao
FROM
	exercicio_2.livro
where
ano_publicacao = (SELECT max(ano_publicacao) FROM exercicio_2.livro)
------------------------------------------4:
INSERT into exercicio_2.emprestimo ------- adicionando mais emprestimos para usuarios
	(id_usuario, id_livro, data_emprestimo, data_devolucao, status)
VALUES 
	('3', '6', '15-03-2025',null,default),
	('5', '4', '30-03-2025',null,default)
	
SELECT
exercicio_2.usuario.nome,
COUNT (*) as total_emprestimos
FROM
exercicio_2.emprestimo
JOIN exercicio_2.usuario ON exercicio_2.emprestimo.id_usuario=usuario.id

GROUP BY 
exercicio_2.usuario.nome
------------------------------------------5:
SELECT
exercicio_2.livro.genero,
COUNT(*) as total_livro_genero
FROM
exercicio_2.livro
GROUP BY
exercicio_2.livro.genero
