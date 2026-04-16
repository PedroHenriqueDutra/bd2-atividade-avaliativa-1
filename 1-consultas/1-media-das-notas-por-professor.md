SELECT p.nome, AVG(n.nota) AS media
FROM professores p
JOIN turmas t ON t.professor_id = p.id
JOIN matriculas m ON m.turma_id = t.id
JOIN notas n ON n.matricula_id = m.id
GROUP BY p.nome;