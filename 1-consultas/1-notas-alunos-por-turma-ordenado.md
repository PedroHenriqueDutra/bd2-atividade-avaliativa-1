SELECT 
    t.id AS turma,
    d.nome AS disciplina,
    a.nome AS aluno,
    n.nota
FROM notas n
JOIN matriculas m ON m.id = n.matricula_id
JOIN alunos a ON a.id = m.aluno_id
JOIN turmas t ON t.id = m.turma_id
JOIN disciplinas d ON d.id = t.disciplina_id
ORDER BY d.nome ASC, n.nota DESC;