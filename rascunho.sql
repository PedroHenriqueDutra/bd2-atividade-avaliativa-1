1-criar-tabelas
1-alterar-tabelas
1-chaves-estrangeiras
1-insert-update-delete

2-select

3-criar-alterar-acesso
3-configurar-privilegios-acesso






alter table turmas modify curso_id int;

alter table turmas add constraint fk_turma_curso FOREIGN key (curso_id) references cursos(id);



update alunos set ativo=true where ativo='sim';
update alunos set ativo=true where ativo='true';
update alunos set ativo=false where ativo='não';
update alunos set ativo=false where ativo='false';

alter table alunos modify column ativo boolean;


alter table alunos modify column data_nascimento date;
update alunos set data_nascimento='1999-08-15' where data_nascimento='15/08/1999';

alter table professores add column data_nascimento date;

alter table turmas modify column ano varchar(4) not null;


alter table alunos modify column id INT unique;

alter table matriculas add constraint fk_matricula_aluno foreign key (aluno_id) references alunos(id);

alter table turmas modify column id INT unique;

alter table matriculas add constraint fk_matricula_turmas foreign key (turma) references turmas(id);





use escola;

SELECT t.semestre, t.disciplina_id, COUNT(m.id) AS total_alunos
FROM turmas t
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.semestre, t.disciplina_id;


SELECT d.nome, COUNT(m.id) AS total_alunos
FROM disciplinas d
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY d.nome;



SELECT p.nome, COUNT(t.id) AS total_turmas
FROM professores p
INNER JOIN turmas t ON t.professor_id = p.id
GROUP BY p.nome;



SELECT t.id, SUM(m.valor_pago) AS total_arrecadado
FROM turmas t
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.id;


SELECT t.semestre, COUNT(m.id) AS total_matriculas
FROM turmas t
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.semestre;



SELECT d.nome, SUM(m.valor_pago) AS total_arrecadado
FROM disciplinas d
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY d.nome;


SELECT p.nome, SUM(m.valor_pago) AS total_arrecadado
FROM professores p
INNER JOIN turmas t ON t.professor_id = p.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.nome;



SELECT c.nome, COUNT(m.id) AS total_alunos
FROM cursos c
INNER JOIN disciplinas d ON d.curso_id = c.id
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY c.nome;


SELECT d.nome, COUNT(m.id) AS total_alunos_ativos
FROM disciplinas d
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
INNER JOIN alunos a ON a.id = m.aluno_id
WHERE a.ativo = true
GROUP BY d.nome;


SELECT p.nome, COUNT(m.id) AS total_alunos
FROM professores p
INNER JOIN turmas t ON t.professor_id = p.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.nome;



SELECT t.semestre, SUM(m.valor_pago) AS total_arrecadado
FROM turmas t
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.semestre
ORDER BY total_arrecadado DESC;



SELECT d.nome, SUM(m.valor_pago) AS total_arrecadado
FROM disciplinas d
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
INNER JOIN alunos a ON a.id = m.aluno_id
WHERE a.ativo = true
GROUP BY d.nome;



SELECT p.nome, p.salario, SUM(m.valor_pago) AS total_arrecadado
FROM professores p
INNER JOIN turmas t ON t.professor_id = p.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.nome, p.salario;



SELECT p.nome,
       (SUM(m.valor_pago) - p.salario) AS lucro
FROM professores p
INNER JOIN turmas t ON t.professor_id = p.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.nome, p.salario
ORDER BY lucro DESC;



SELECT d.nome, t.semestre, SUM(m.valor_pago) AS total_arrecadado
FROM disciplinas d
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY d.nome, t.semestre;


SELECT c.nome, SUM(m.valor_pago) AS total_arrecadado
FROM cursos c
INNER JOIN disciplinas d ON d.curso_id = c.id
INNER JOIN turmas t ON t.disciplina_id = d.id
INNER JOIN matriculas m ON m.turma_id = t.id
GROUP BY c.nome
ORDER BY total_arrecadado DESC;



SELECT a.nome AS aluno,
       d.nome AS disciplina,
       t.id AS turma,
       n.nota
FROM alunos a
INNER JOIN matriculas m ON m.aluno_id = a.id
INNER JOIN turmas t ON t.id = m.turma_id
INNER JOIN disciplinas d ON d.id = t.disciplina_id
INNER JOIN notas n ON n.matricula_id = m.id
ORDER BY d.nome ASC, n.nota DESC;
