SELECT t.id, COUNT(m.aluno_id) AS total_alunos
FROM turmas t
JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.id;