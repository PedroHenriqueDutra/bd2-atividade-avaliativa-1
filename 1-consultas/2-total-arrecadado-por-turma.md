SELECT 
    p.nome AS professor,
    SUM(m.valor_pago) AS total_arrecadado
FROM professores p
JOIN turmas t ON t.professor_id = p.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.id, p.nome;