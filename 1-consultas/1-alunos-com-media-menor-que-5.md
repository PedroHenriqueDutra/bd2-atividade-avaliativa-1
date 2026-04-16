SELECT a.nome, AVG(n.nota) AS media
FROM alunos a
JOIN matriculas m ON m.aluno_id = a.id
JOIN notas n ON n.matricula_id = m.id
GROUP BY a.id, a.nome
HAVING AVG(n.nota) <= 5;