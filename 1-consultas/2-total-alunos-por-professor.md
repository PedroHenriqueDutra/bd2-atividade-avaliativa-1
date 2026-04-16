SELECT 
    p.nome AS professor,
    COUNT(DISTINCT m.aluno_id) AS total_alunos
FROM professores p
JOIN turmas t ON t.professor_id = p.id
JOIN matriculas m ON m.turma_id = t.id
GROUP BY p.id, p.nome;