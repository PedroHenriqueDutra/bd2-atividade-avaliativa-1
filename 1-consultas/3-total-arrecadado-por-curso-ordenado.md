SELECT 
    c.nome AS curso,
    SUM(m.valor_pago) AS total_arrecadado
FROM cursos c
JOIN disciplinas d ON d.curso_id = c.id
JOIN turmas t ON t.disciplina_id = d.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY c.id, c.nome
ORDER BY total_arrecadado DESC;