SELECT d.nome, AVG(n.nota) AS media
FROM disciplinas d
JOIN turmas t ON t.disciplina_id = d.id
JOIN matriculas m ON m.turma_id = t.id
JOIN notas n ON n.matricula_id = m.id
GROUP BY d.nome;