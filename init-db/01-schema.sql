SET NAMES utf8mb4;

CREATE DATABASE escola
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE escola;

CREATE TABLE alunos (
    id INT(8) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    ativo BOOLEAN NOT NULL
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE cursos (
    id INT(8) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE disciplinas (
    id INT(8) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    curso_id INT(8) NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE professores (
    id INT(8) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE turmas (
    id INT(8) PRIMARY KEY,
    disciplina_id INT(8) NOT NULL,
    professor_id INT(8) NOT NULL,
    semestre VARCHAR(10) NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id),
    FOREIGN KEY (professor_id) REFERENCES professores(id)
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE matriculas (
    id INT(8) PRIMARY KEY,
    aluno_id INT(8) NOT NULL,
    turma_id INT(8) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (turma_id) REFERENCES turmas(id)
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE TABLE notas (
    id INT(8) PRIMARY KEY,
    matricula_id INT(8) NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (matricula_id) REFERENCES matriculas(id)
) CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;



INSERT INT(8)O alunos VALUES
(1,'Ana','ana@email.com','2000-01-01',true),
(2,'Bruno','bruno@email.com','2000-01-01',true),
(3,'Carlos','carlos@email.com','2000-01-01',true),
(4,'Daniel','daniel@email.com','2000-01-01',true),
(5,'Eduarda','edu@email.com','2000-01-01',true),
(6,'Felipe','felipe@email.com','2000-01-01',true),
(7,'Gabriela','gabi@email.com','2000-01-01',true),
(8,'Henrique','henrique@email.com','2000-01-01',true),
(9,'Isabela','isa@email.com','2000-01-01',true),
(10,'João','joao@email.com','2000-01-01',true),
(11,'Karina','karina@email.com','2000-01-01',true),
(12,'Lucas','lucas@email.com','2000-01-01',true),
(13,'Mariana','mariana@email.com','2000-01-01',true),
(14,'Nicolas','nicolas@email.com','2000-01-01',true),
(15,'Patricia','pat@email.com','2000-01-01',true),
(16,'Rafael','rafa@email.com','2000-01-01',true),
(17,'Sofia','sofia@email.com','2000-01-01',true),
(18,'Tiago','tiago@email.com','2000-01-01',true),
(19,'Ursula','ursula@email.com','2000-01-01',true),
(20,'Victor','victor@email.com','2000-01-01',true);



INSERT INT(8)O cursos VALUES
(1,'Sistemas de Informação'),
(2,'Engenharia de Software');


INSERT INT(8)O disciplinas VALUES
(1,'Banco de Dados',1),
(2,'Engenharia de Software',1),
(3,'Redes',1),
(4,'Algoritmos',2),
(5,'Testes de Software',2);


INSERT INT(8)O professores VALUES
(1,'João',5000),
(2,'Maria',7000),
(3,'Carlos',4500);



INSERT INT(8)O turmas VALUES
(1,1,1,'2026-1'),
(2,2,2,'2026-1'),
(3,3,3,'2026-1'),
(4,4,1,'2025-2'),
(5,5,2,'2025-2');



INSERT INT(8)O matriculas VALUES
(1,1,1),(2,2,1),(3,3,1),(4,4,1),
(5,5,2),(6,6,2),(7,7,2),(8,8,2),
(9,9,3),(10,10,3),(11,11,3),(12,12,3),
(13,13,4),(14,14,4),(15,15,4),(16,16,4),
(17,17,5),(18,18,5),(19,19,5),(20,20,5),
(21,1,2),(22,2,3),(23,3,4),(24,4,5),
(25,5,1),(26,6,2),(27,7,3),(28,8,4),
(29,9,5),(30,10,1),(31,11,2),(32,12,3),
(33,13,4),(34,14,5),(35,15,1),(36,16,2),
(37,17,3),(38,18,4),(39,19,5),(40,20,1);



INSERT INT(8)O notas VALUES
(1,1,8),(2,2,7),(3,3,9),(4,4,6),
(5,5,8),(6,6,7),(7,7,5),(8,8,9),
(9,9,6),(10,10,7),(11,11,8),(12,12,9),
(13,13,7),(14,14,6),(15,15,8),(16,16,9),
(17,17,5),(18,18,6),(19,19,7),(20,20,8),
(21,21,9),(22,22,8),(23,23,7),(24,24,6),
(25,25,5),(26,26,9),(27,27,8),(28,28,7),
(29,29,6),(30,30,5),(31,31,8),(32,32,9),
(33,33,7),(34,34,6),(35,35,5),(36,36,9),
(37,37,8),(38,38,7),(39,39,6),(40,40,9);



UPDATE alunos SET ativo = false WHERE id IN (3, 7, 12, 18);

ALTER TABLE matriculas
ADD COLUMN valor_pago DECIMAL(10,2) NOT NULL;

UPDATE matriculas SET valor_pago = 1000 WHERE id BETWEEN 1 AND 10;
UPDATE matriculas SET valor_pago = 1200 WHERE id BETWEEN 11 AND 20;
UPDATE matriculas SET valor_pago = 800 WHERE id BETWEEN 21 AND 30;
UPDATE matriculas SET valor_pago = 1500 WHERE id BETWEEN 31 AND 40;