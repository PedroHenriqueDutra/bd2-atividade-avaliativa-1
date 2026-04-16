SELECT 
    d.nome AS disciplina,
    SUM(m.valor_pago) AS total_arrecadado
FROM disciplinas d
JOIN turmas t ON t.disciplina_id = d.id
JOIN matriculas m ON m.turma_id = t.id
JOIN alunos a ON a.id = m.aluno_id
WHERE a.ativo = TRUE
GROUP BY d.id, d.nome;