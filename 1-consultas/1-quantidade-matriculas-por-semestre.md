SELECT t.semestre, COUNT(m.id) AS total
FROM turmas t
JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.semestre;