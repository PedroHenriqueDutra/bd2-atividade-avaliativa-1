SELECT 
    c.nome AS curso,
    COUNT(DISTINCT m.aluno_id) AS total_alunos
FROM cursos c
JOIN disciplinas d ON d.curso_id = c.id
JOIN turmas t ON t.disciplina_id = d.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY c.id, c.nome;