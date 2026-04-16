SELECT 
    p.nome AS professor,
    SUM(m.valor_pago) AS total_arrecadado,
    p.salario,
    (SUM(m.valor_pago) - p.salario) AS lucro
FROM professores p
JOIN turmas t ON t.professor_id = p.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.id, p.nome, p.salario
ORDER BY lucro DESC;