-- =====================
-- TABELAS (com problemas)
-- =====================

CREATE TABLE alunos (
    id VARCHAR(10),
    nome VARCHAR(255),
    email VARCHAR(255),
    data_nascimento VARCHAR(20),
    ativo VARCHAR(5)
);

CREATE TABLE cursos (
    id INT,
    nome VARCHAR(255),
    carga_horaria VARCHAR(10),
    valor DECIMAL
);

CREATE TABLE professores (
    id INT,
    nome VARCHAR(255),
    salario VARCHAR(20)
);

CREATE TABLE turmas (
    id INT,
    nome VARCHAR(255),
    curso_id VARCHAR(10),
    professor VARCHAR(255),
    ano VARCHAR(4)
);

CREATE TABLE matriculas (
    id INT,
    aluno_id INT,
    turma INT,
    data_matricula VARCHAR(20),
    status VARCHAR(20)
);

-- =====================
-- INSERTS (com inconsistências)
-- =====================

-- ALUNOS
INSERT INTO alunos VALUES
('1', 'Ana Silva', 'ana@email.com', '2000-05-10', 'true'),
('2', 'Bruno Souza', 'bruno@email.com', '15/08/1999', 'false'),
('3', 'Carlos Lima', 'carlos@email.com', '1998-12-01', 'sim'),
('4', 'Ana Silva', 'ana@email.com', '2001-01-01', 'true'); -- email duplicado

-- CURSOS
INSERT INTO cursos VALUES
(1, 'Sistemas de Informação', '3000h', 1500),
(2, 'Engenharia de Software', '3200', 1800.50),
(3, 'Banco de Dados', '100h', NULL);

-- PROFESSORES
INSERT INTO professores VALUES
(1, 'João Pereira', '5000'),
(2, 'Maria Oliveira', '7500.75'),
(3, 'Carlos Souza', 'quatro mil'); -- inválido

-- TURMAS
INSERT INTO turmas VALUES
(1, 'Turma A', '1', 'João Pereira', '2026'),
(2, 'Turma B', '2', 'Maria Oliveira', '2025'),
(3, 'Turma C', '10', 'Professor Inexistente', '2026'); -- curso inválido

-- MATRICULAS
INSERT INTO matriculas VALUES
(1, 1, 1, '2026-02-10', 'ativa'),
(2, 2, 1, '10/02/2026', 'ativa'),
(3, 10, 2, '2026-02-15', 'cancelada'), -- aluno inexistente
(4, 3, 5, '2026-02-20', 'ativa'); -- turma inexistente
