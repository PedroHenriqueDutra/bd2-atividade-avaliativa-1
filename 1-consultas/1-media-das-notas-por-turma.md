SELECT t.id, AVG(n.nota) AS media
FROM turmas t
JOIN matriculas m ON m.turma_id = t.id
JOIN notas n ON n.matricula_id = m.id
GROUP BY t.id
ORDER BY media DESC;