SELECT 
    t.semestre,
    SUM(m.valor_pago) AS total_arrecadado
FROM turmas t
JOIN matriculas m ON m.turma_id = t.id
GROUP BY t.semestre
ORDER BY total_arrecadado DESC;