SELECT p.nome, COUNT(t.id) AS total_turmas
FROM professores p
LEFT JOIN turmas t ON t.professor_id = p.id
GROUP BY p.nome;