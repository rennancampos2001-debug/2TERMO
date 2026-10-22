-- 1:
CREATE DATABASE IF NOT EXISTS biblioteca_som2;

DROP DATABASE biblioteca_som2;

USE biblioteca_som2;

-- 2
CREATE TABLE usuario (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

-- 3:
CREATE TABLE livro (
  id_livro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  autor VARCHAR(120) NOT NULL,
  isbn CHAR(13) NOT NULL UNIQUE,
  ano_publicacao INT,
  quantidade_disponivel INT DEFAULT 0.00 CHECK (quantidade_disponivel >= 0)
);

-- 4:
CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'FECHADO')),
    CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    CONSTRAINT FK_id_livro FOREIGN KEY (id_livro) REFERENCES Livro (id_livro)
);

-- 5:
ALTER TABLE livro ADD editora VARCHAR(100);

-- 6:
INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Rennan Campos', 'rennan@email.com', 19999999999, TRUE),
('Luis Felipe', 'luis@email.com', 19999999967, TRUE),
('Enzo Magossi', 'piccin@email.com', 19999999976, TRUE),
('Rebecca Hernandes', 'rebecca@email.com', 19999999567, TRUE);

-- 7:
INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES
('Harry Potter e a Pedra Filosofal','J.K.Rowling', '9788532511010', 1997, 1),
('Harry Potter e a Camara Secreta','J.K.Rowling', '9788532511669', 1998, 2),
('Harry Potter e o Prisioneiro de Askaban','J.K.Rowling', '9788532512062', 1999, 3),
('Harry Potter e o Calice de Fogo','J.K.Rowling', '9788532512529', 2000,3),
('Harry Potter e a Ordem da Fenix','J.K.Rowling', '9788532516220', 2003, 1),
('Harry Potter e o Enigma do Principe','J.K.Rowling', '9788532519474', 2020, 4),
('Harry Potter e as Reliquias da Morte','J.K.Rowling', '9788532522610', 2021, 10)

SELECT * from usuario;

SELECT * from livro;

-- 8:
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
(1, 1, NOW(), '2026-10-24', '2026-10-26', 'ABERTO'),
(2, 2, NOW(), '2026-10-25', '2026-10-27', 'FECHADO'),
(3, 3, NOW(), '2026-10-27', '2026-10-28', 'ABERTO');

-- 9:
  UPDATE usuario
  SET telefone = '19999999997'
  WHERE id_usuario = 1

  SELECT id_usuario, nome, telefone
  FROM usuario
  WHERE id_usuario = 1;

-- 10:
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 2020;

-- 11:
INSERT INTO usuario (nome, email, telefone, ativo)
VALUES ('Pedro Henrique', 'pedro@email.com', '19988888888', TRUE);

DELETE FROM usuario
WHERE id_usuario = 5

-- 12:
SELECT titulo, autor, quantidade_disponivel
FROM livro

-- 13:
SELECT titulo, quantidade_disponivel
FROM livro
WHERE quantidade_disponivel >= 2
ORDER BY quantidade_disponivel DESC;

-- 14:
SELECT titulo, quantidade_disponivel
from livro
WHERE titulo LIKE '%Pedra%';

-- 15:
SELECT titulo, ano_publicacao
FROM livro
WHERE ano_publicacao BETWEEN 2015 AND 2025

-- 16:
SELECT COUNT(*) AS total_livros,
AVG(quantidade_disponivel) AS media_disponivel,
MIN(quantidade_disponivel) AS menor_quantidade,
MAX(quantidade_disponivel) AS maior_quantidade
FROM livro;

-- 17:
SELECT E.id_emprestimo, U.id_usuario, E.id_livro, E.data_prevista, E.status_emprestimo FROM emprestimo AS e INNER JOIN usuario AS U ON E.id_usuario = U.id_usuario;

-- 18:
SELECT status_emprestimo, COUNT(*) AS Quantidade FROM emprestimo GROUP BY status_emprestimo

-- 19:
SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade
FROM usuario AS U
LEFT JOIN emprestimo AS E ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome ORDER BY QUANTIDADE DESC;

-- 20:
SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade
FROM Usuario AS U
LEFT JOIN Emprestimo AS E ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome;

--21
START TRANSACTION;

INSERT Emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
(2, 4, NOW(), '2026-10-28', '2026-10-30', 'ABERTO');

UPDATE livro SET quantidade_disponivel = 1 WHERE id_livro = 4;

SELECT * FROM livro;

COMMIT;

-- 22:
START TRANSACTION;

UPDATE livro SET quantidade_disponivel = 10000 WHERE id_livro = 5;

SELECT * FROM livro;

ROLLBACK;

SELECT * FROM livro;

-- 23:
START TRANSACTION;

UPDATE livro SET quantidade_disponivel = 10 WHERE id_livro = 3;

SAVEPOINT quantidades_livros;

UPDATE livro SET quantidade_disponivel = 100000000000 WHERE id_livro = 10

ROLLBACK TO SAVEPOINT reajuste_cafes;

COMMIT;

-- 24:
START TRANSACTION

SELECT * FROM emprestimo;

UPDATE emprestimo
SET status_emprestimo = 'FECHADO',
data_devolucao = NOW()
WHERE id_emprestimo = 5;

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_livro = 1;

COMMIT;

SELECT * FROM emprestimo;

-- 25:

-- Para cada situação abaixo, identifique o mecanismo mais adequado entre constraint, integridade referencial, transação ou regra da aplicação, e justifique tecnicamente sua escolha.

-- Cadastrar dois usuários com o mesmo e-mail.

-- R: A melhor opção é usar o UNIQUE para deixar os email sendo unicos

-- Cadastrar dois livros com o mesmo ISBN.

-- O UNIQUE não permite que dois valores sejam colocados iguais, ou seja, se forem iguais, são os mesmos livros

-- Permitir quantidade disponível negativa.

-- Se permitir utilizaremos o CHECK irá verificar e travar a quantidade negativa

-- Criar empréstimo para usuário inexistente.

-- não pode ocorrer pois o emprestimo necesssita de uma referencia a algum usuario, e com algum espaco obrigatorio vazio nao é possivel cadastrar

-- Excluir livro com histórico de empréstimos.

-- Não é possivel pois está utilizando referencias a emprestimos com o CONSTRAINT

-- Gravar empréstimo e falhar na redução do estoque.

-- É uma transação que voce faz uma sequencia de coisas antes de ser realmente gravado, e depois de tudo ainda da para fazer um ROLLBACK

-- Emprestar livro cuja quantidade disponível seja zero.

-- Seria impossivel pois quando emprestamos algo com 0 disponiveis ele fia negativo, logo, não é possivel ter este emprestimo
