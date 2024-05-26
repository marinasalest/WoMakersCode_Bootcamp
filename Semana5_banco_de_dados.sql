--Exercícios Banco de Dados

-- 1.Crie uma tabela chamada "alunos" com os seguintes campos: id (inteiro), nome (texto), idade (inteiro) e curso (texto).
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INT,
    curso TEXT
);

--2. Insira pelo menos 5 registros de alunos na tabela que você criou no exercício anterior.
INSERT INTO alunos (id, nome, idade, curso) VALUES
(1, 'João Silva', 20, 'Engenharia'),
(2, 'Maria Santos', 22, 'Direito'),
(3, 'Pedro Costa', 19, 'Medicina'),
(4, 'Ana Oliveira', 21, 'Arquitetura'),
(5, 'Lucas Almeida', 23, 'Administração');

--3. Consultas Básicas
--Escreva consultas SQL para realizar as seguintes tarefas:
--a) Selecionar todos os registros da tabela "alunos".
SELECT * FROM alunos;

--b) Selecionar o nome e a idade dos alunos com mais de 20 anos.
SELECT nome, idade FROM alunos WHERE idade > 20;

--c) Selecionar os alunos do curso de "Engenharia" em ordem alfabética.
SELECT * FROM alunos WHERE curso = 'Engenharia' ORDER BY nome;

--d) Contar o número total de alunos na tabela
SELECT COUNT(*) FROM alunos;

--4. Atualização e Remoção
--a) Atualize a idade de um aluno específico na tabela.
UPDATE alunos SET idade = 21 WHERE id = 1;

--b) Remova um aluno pelo seu ID.
DELETE FROM alunos WHERE id = 1;

-- Criar uma Tabela e Inserir Dados
--Crie uma tabela chamada "clientes" com os campos: id (chave primária), nome (texto), idade (inteiro) e saldo (float). Insira alguns registros de clientes na tabela.
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INT,
    saldo FLOAT
);

INSERT INTO clientes (id, nome, idade, saldo) VALUES
(1, 'Maria Silva', 30, 1500.50),
(2, 'João Oliveira', 25, 2300.75),
(3, 'Ana Santos', 28, 1800.00),
(4, 'Pedro Costa', 35, 3000.20);

--6. Consultas e Funções Agregadas
--Escreva consultas SQL para realizar as seguintes tarefas:
--a) Selecione o nome e a idade dos clientes com idade superior a 30 anos.
SELECT nome, idade FROM clientes WHERE idade > 30;

--b) Calcule o saldo médio dos clientes.
SELECT AVG(saldo) AS saldo_medio FROM clientes;

--c) Encontre o cliente com o saldo máximo.
SELECT * FROM clientes WHERE saldo = (SELECT MAX(saldo) FROM clientes);

--d) Conte quantos clientes têm saldo acima de 1000.
SELECT COUNT(*) AS num_clientes FROM clientes WHERE saldo > 1000;

--7. Atualização e Remoção com Condições
--a) Atualize o saldo de um cliente específico.
UPDATE clientes SET saldo = 2000.50 WHERE id = 1;

--b) Remova um cliente pelo seu ID.
DELETE FROM clientes WHERE id = 2;

--8. Junção de Tabelas
--Crie uma segunda tabela chamada "compras" com os campos: id (chave primária), cliente_id (chave estrangeira referenciando o id da tabela "clientes"), produto (texto) e valor (real). Insira algumas compras associadas a clientes existentes na tabela "clientes".
--Escreva uma consulta para exibir o nome do cliente, o produto e o valor de cada compra.
CREATE TABLE compras (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto TEXT,
    valor REAL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO compras (id, cliente_id, produto, valor) VALUES
(1, 1, 'Notebook', 2500.00),
(2, 2, 'Smartphone', 1500.00),
(3, 3, 'Livros', 200.00),
(4, 1, 'Monitor', 800.00);

SELECT c.nome AS nome_cliente, co.produto, co.valor FROM compras co JOIN clientes c ON co.cliente_id = c.id;








