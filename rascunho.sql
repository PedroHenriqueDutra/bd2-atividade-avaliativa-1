1-criar-tabelas
1-alterar-tabelas
1-chaves-estrangeiras
1-insert-update-delete

2-select

3-criar-alterar-acesso
3-configurar-privilegios-acesso






alter table turmas modify curso_id int;

alter table turmas add constraint fk_turma_curso FOREIGN key (curso_id) references cursos(id);



update alunos set ativo=true where ativo='sim';
update alunos set ativo=true where ativo='true';
update alunos set ativo=false where ativo='não';
update alunos set ativo=false where ativo='false';

alter table alunos modify column ativo boolean;


alter table alunos modify column data_nascimento date;
update alunos set data_nascimento='1999-08-15' where data_nascimento='15/08/1999';

alter table professores add column data_nascimento date;

alter table turmas modify column ano varchar(4) not null;


alter table alunos modify column id INT unique;

alter table matriculas add constraint fk_matricula_aluno foreign key (aluno_id) references alunos(id);

alter table turmas modify column id INT unique;

alter table matriculas add constraint fk_matricula_turmas foreign key (turma) references turmas(id);