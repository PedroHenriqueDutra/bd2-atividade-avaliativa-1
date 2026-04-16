SELECT 
    d.nome AS disciplina,
    SUM(m.valor_pago) AS total_arrecadado
FROM disciplinas d
JOIN turmas t ON t.disciplina_id = d.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY d.id, d.nome;