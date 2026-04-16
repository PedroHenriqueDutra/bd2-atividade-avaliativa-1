SELECT d.nome, COUNT(m.aluno_id) AS total
FROM disciplinas d
JOIN turmas t ON t.disciplina_id = d.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY d.nome;