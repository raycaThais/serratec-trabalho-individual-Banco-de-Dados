----------------------------------------------1:
INSERT INTO exercicio_2.livro --- adicionei mais 700 livros sem muitos detalhes para exemplificar o índice
	(titulo, autor, ano_publicacao, genero, quantida_estoque)
SELECT 'titulo' || i, 'autor' || i, '2020', 'Ficção', '10'
FROM generate_series (1, 700)i;


CREATE INDEX
idx_livro
ON
exercicio_2.livro(titulo)

----------------------------------------------2:
/* Aqui eu queria inserir emprestimos novos, como alguns termos são NOT NULL, 
eu quis gerar aleatoriamente emprestimos entre os 5 usuarios registrados anteriormente, 
bem como emprestimos aleatórios entre os 10 livros já registrados 
Gerei também datas aleatórias entre 01-01-2025 e 31-03-2025 para os emprestimos*/
INSERT INTO exercicio_2.emprestimo 
	(id_usuario, id_livro, data_emprestimo, status)
SELECT idU,idL, date, 'emprestado'

FROM generate_series (1, 5) as idU
CROSS JOIN generate_series (1, 10)as idL 
CROSS JOIN  (SELECT (DATE '01-01-2025' + (random() * 90)::int) as date
FROM generate_series (1, 90))  
/* esse fez gerar até 4500 emprestimos por causa do cross join, que faz todas as combinações possiveis entre as tabelas 
(5×10×90=4500) 5 usuarios, 10 livros e 90 datas
(Descobri depois que poderia usar um LIMIT ou ter gerado menos datas) */

/* PS: essa parte precisei fazer pesquisas para identificar como usar operadores mais complexos
 cross join pega cada linha de uma tabela e combina com cada linha da outra tabela
 random() gera um número aleatório entre 0 e 1 (incluindo números decimais) multiplicando por 90, gera um número entre 0 e 90
 então, o ::int converte o número gerado aleatoriamente pra um número inteiro
 ao somar esse número aleatório com a data que eu determinei ser a inicial (01-01-2025) acrescenta esse número a essa data */

CREATE INDEX
idx_emprestimo
ON
exercicio_2.emprestimo(data_emprestimo)


----------------------------------------------3:
CREATE VIEW vw_historico_emprestimos AS
SELECT
	usuario.nome,
	livro.titulo,
	emprestimo.data_emprestimo,
	emprestimo.data_devolucao
FROM
exercicio_2.emprestimo
INNER JOIN
exercicio_2.usuario ON id_usuario = usuario.id
INNER JOIN
exercicio_2.livro ON id_livro = livro.id
-------------------------------------------------4: 

/* Os índices melhoram a velocidade de busca. Enquanto normalmente (sem índices) para localizar os dados desejados o banco
de dados percorre todas as linhas, com o índice ele vai direto ao local.
	Os impactos negativos de se utilizar muitos índices é que eles ocupam muito espaço no disco e na memória. */
	
-------------------------------------------------5: -- há pastas com prints das comparações
DROP INDEX exercicio_2.idx_livro
DROP INDEX exercicio_2.idx_emprestimo
EXPLAIN ANALYSE SELECT * FROM exercicio_2.livro  WHERE titulo = 'titulo 700'
EXPLAIN ANALYSE SELECT * FROM exercicio_2.emprestimo  WHERE data_emprestimo = '21-02-2025'