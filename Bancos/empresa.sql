drop database if exists empresa;
create database if not exists empresa;
use empresa;

create table Funcionario (
	numero int not null,
	nome varchar(64),
    rua varchar(32),
    nro int,
    bairro varchar(64),
    cidade varchar(32),
    estado varchar(2),
    cep varchar(9),
    salario float,
    numeroSupervisor int,
    primary key(numero),
    foreign key (numeroSupervisor) references Funcionario(numero)
);

create table Dependente (
	numeroFunc int not null,
    nome varchar(32) not null,
    dataNasc date,
    parentesco varchar(32),
    primary key (numeroFunc, nome),
    foreign key (numeroFunc) references Funcionario(numero)
    ON DELETE CASCADE
);

create table Departamento (
	numero int not null,
    nome varchar(32),
    numeroFuncGer int,
    dataIniGer date,
    primary key (numero),
    foreign key (numeroFuncGer) references Funcionario(numero)
    ON DELETE CASCADE
);

create table LocalDep (
	numeroDepto int not null,
    localizacao varchar(64),
    primary key (numeroDepto, localizacao),
    foreign key (numeroDepto) references Departamento(numero)
    ON DELETE CASCADE
);

create table Projeto (
	numero int not null,
    nome varchar(32),
    numeroDepto int,
    primary key (numero),
    foreign key (numeroDepto) references Departamento(numero)
    ON DELETE CASCADE
);

create table FuncionarioProjeto (
	numeroFunc int not null,
    numeroProj int not null,
    hora time,
    primary key (numeroFunc, numeroProj),
    foreign key (numeroFunc) references Funcionario(numero)
    ON DELETE CASCADE,
    foreign key (numeroProj) references Projeto(numero)
    ON DELETE CASCADE
);


#--------------------------------------------------------------------------------------------


alter table Funcionario add numerodepto integer;

alter table Funcionario add foreign key(numerodepto)
references Departamento(numero);

#---------------------------------------------------------------------------------------------

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (1, 'Carlos Alberto', 'Av. Paulista', 1000, 'Bela Vista', 'São Paulo', 'SP', '01310-100', 25000.00, NULL);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (2, 'Mariana Silva', 'Rua das Flores', 123, 'Centro', 'São Carlos', 'SP', '13010-000', 8500.00, 1);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (3, 'Roberto Gomes', 'Rua Chile', 45, 'Rebouças', 'Curitiba', 'PR', '80220-181', 7200.00, 1);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (4, 'Ana Oliveira', 'Rua Bahia', 99, 'Savassi', 'Belo Horizonte', 'MG', '30140-060', 2000.00, 2);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (5, 'Paulo Souza', 'Rua do Sol', 202, 'Centro', 'Recife', 'PE', '50010-000', 5500.00, 2);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (6, 'Fernanda Lima', 'Av. Boa Viagem', 500, 'Boa Viagem', 'Recife', 'PE', '51011-000', 9200.00, 1);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (7, 'Ricardo Alves', 'Rua dos Andradas', 1050, 'Centro Histórico', 'Porto Alegre', 'RS', '90020-007', 6800.00, 3);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (8, 'Beatriz Costa', 'Rua das Laranjeiras', 312, 'Laranjeiras', 'Rio de Janeiro', 'RJ', '22240-001', 1500.00, 3);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (9, 'Marcos Pereira', 'Av. Afonso Pena', 1200, 'Centro', 'Campo Grande', 'MS', '79002-074', 5200.00, 4);
insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor)
values (10, 'Julia Martins', 'Rua 13 de Maio', 88, 'Bela Vista', 'São Paulo', 'SP', '01327-000', 1900.00, 5);


insert into Departamento (numeroFuncGer, numero, nome, dataIniGer)
values (2, 10, 'Tecnologia', '2023-01-15');
insert into Departamento (numeroFuncGer, numero, nome, dataIniGer)
values (1, 20, 'Recursos Humanos', '2022-05-20');
insert into Departamento (numeroFuncGer, numero, nome, dataIniGer)
values (3, 30, 'Financeiro', '2023-03-10');
insert into Departamento (numeroFuncGer, numero, nome, dataIniGer)
values (4, 40, 'Vendas', '2024-01-02');
insert into Departamento (numeroFuncGer, numero, nome, dataIniGer)
values (1, 50, 'Marketing', '2023-06-15');

UPDATE funcionario SET numerodepto = 10
where numero = 1;

UPDATE funcionario SET numerodepto = 30
where numero = 2;

UPDATE funcionario SET numerodepto = 20
where numero = 3;

UPDATE funcionario SET numerodepto = 50
where numero = 4;

UPDATE funcionario SET numerodepto = 40
where numero = 5;

UPDATE funcionario SET numerodepto = 20
where numero = 6;

UPDATE funcionario SET numerodepto = 20
where numero = 7;

UPDATE funcionario SET numerodepto = 10
where numero = 8;

UPDATE funcionario SET numerodepto = 40
where numero = 9;

UPDATE funcionario SET numerodepto = 50
where numero = 10;

insert into Dependente (parentesco, nome, dataNasc, numeroFunc)
values ('Filha', 'Clara Alberto', '2015-05-12', 1);
insert into Dependente (parentesco, nome, dataNasc, numeroFunc)
values ('Primo', 'Marcos Alberto', '1980-10-20', 1);
insert into Dependente (parentesco, nome, dataNasc, numeroFunc)
values ('Filha', 'Beatriz Silva', '2018-12-01', 2);
insert into Dependente (parentesco, nome, dataNasc, numeroFunc)
values ('Filho', 'Enzo Gomes', '2010-03-15', 3);
insert into Dependente (parentesco, nome, dataNasc, numeroFunc)
values ('Filha', 'Julia Souza', '2021-07-22', 5);


insert into LocalDep (localizacao, numeroDepto)
values ('Prédio A - 5º Andar', 10);
insert into LocalDep (localizacao, numeroDepto)
values ('Prédio B - Sala 12', 10);
insert into LocalDep (localizacao, numeroDepto)
values ('Sede Principal', 20);
insert into LocalDep (localizacao, numeroDepto)
values ('Bloco Financeiro', 30);
insert into LocalDep (localizacao, numeroDepto)
values ('Anexo Sul', 50);


insert into Projeto (numeroDepto, numero, nome)
values (10, 1, 'Sistema ERP');
insert into Projeto (numeroDepto, numero, nome)
values (40, 2, 'Expansão Regional');
insert into Projeto (numeroDepto, numero, nome)
values (30, 3, 'Revisão Tributária');
insert into Projeto (numeroDepto, numero, nome)
values (50, 4, 'Campanha Verão');
insert into Projeto (numeroDepto, numero, nome)
values (10, 5, 'App Mobile');


insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('40:00:00', 1, 2);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('20:00:00', 1, 5);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('15:30:00', 2, 4);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('10:00:00', 3, 3);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('30:00:00', 5, 2);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('25:00:00', 2, 6);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('12:45:00', 4, 7);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('08:00:00', 3, 8);
insert into FuncionarioProjeto (hora, numeroProj, numeroFunc)
values ('40:00:00', 2, 1);

#--------------------------------------------------------------------------------------------

-- update Funcionario set numeroDepto = 50 where numero = 1;

#--------------------------------------------------------------------------------------------

-- 1
	select * from funcionario;
    
-- 2
	select f.nome, f.estado from funcionario f;
    
-- 3
	select distinct f.salario from funcionario f;
    
-- 4
	select f.nome from funcionario f where f.nome like '%R%';
    
-- 5
	select d.numeroFuncGer, f.nome, d.nome from departamento d, funcionario f where f.numero = d.numeroFuncGer;
    
-- 6
	select distinct f.numero, f.nome, f.salario, d.dataIniGer from funcionario f, departamento d 
		where f.numero = d.numeroFuncGer and salario > 2000 and dataIniGer < date_sub(now(), interval(3) year);
        
-- 7
	select * from funcionario where salario = 
		(select max(salario) from funcionario);
        
-- 8
	select f.nome, p.nome, fp.hora as horasTrabalhada from funcionario f, projeto p, funcionarioprojeto fp 
		where f.numero = fp.numerofunc and p.numero = fp.numeroproj and fp.numeroproj = 2;
        
-- 9
	select p.nome, time(avg(fp.hora)) as MediaHorasTrabalhada from projeto p, funcionarioprojeto fp
		where fp.numeroproj = 3 and p.numero = fp.numeroproj;
        
-- 10
	select dp.nome, timestampdiff(year, dataNasc, curdate()) as Idade from dependente dp;
    
-- 11
	select * from funcionario where cidade like 'São Paulo' and salario > 2200;
    
-- 12 
	select f.nome, dp.nome from funcionario f, dependente dp where f.numero = dp.numerofunc;
    
-- 13
	select f.nome, fp.numeroproj as numeroProjeto, p.nome from funcionario f, funcionarioprojeto fp, projeto p
		where p.numero = fp.numeroproj and f.numero = fp.numerofunc;
        
-- 14
	select f.nome, p.numero, p.nome from funcionario f, projeto p, funcionarioprojeto fp
		where p.numero = fp.numeroproj and f.numero = fp.numerofunc and fp.hora > "20:00:00";
        
-- 15
	select nome from funcionario order by nome asc;
    select nome from funcionario order by nome desc;
    
-- 16
	select * from funcionario order by cidade asc, salario desc;
    
-- 17
	select f.nome, f.salario from funcionario f 
		where salario >= 1000 and salario <= 2000;
    
-- 18
	select * from funcionario f where f.cidade like '%ar%';
    
-- 19
	select max(salario) as maiorSalario from funcionario;
    
-- 20
	select min(salario) as menorSalario from funcionario;

-- 21
	select avg(salario) as MediaSalario from funcionario;
    
-- 22
	select f.nome, f.salario from funcionario f;
    
-- 23
	select count(f.numero) from funcionario f
		where f.salario > 1500;

-- 24
	select f.nome, f.cidade from funcionario f
		where f.cidade like "São%";
        
-- 25
	select count(f.numero) as FuncRecebeMais from funcionario f
		where f.salario > (select avg(f.salario) from funcionario f);

-- 26
	select f.nome from funcionario f
		where numeroSupervisor is null;
        
-- 27
	select f.nome, f.numeroSupervisor from funcionario f
		where numeroSupervisor is not null;
	
-- 28
	select f.nome, fs.nome as nomeSupervisor from funcionario f, funcionario fs
		where fs.numero = f.numeroSupervisor;

-- 29
	select f.nome, fp.hora from funcionario f, funcionarioprojeto fp
		where f.numero = fp.numeroFunc and fp.hora = (select max(hora) from funcionarioprojeto); 
        
-- 30
	select f.nome, p.nome as nomeProjeto from funcionario f, projeto p, funcionarioprojeto fp
		where f.numero = fp.numerofunc and p.numero = fp.numeroproj;

-- 31
	select f.nome, p.nome as nomeProjeto from funcionario f, projeto p, funcionarioprojeto fp
		where f.numero = fp.numerofunc and fp.numeroproj is null;

-- 32
	select f.nome, fp.hora from funcionario f, funcionarioprojeto fp
		where f.numero = fp.numeroFunc and fp.hora > (select avg(hora) from funcionarioprojeto); 



-- ----------------------------------------------------------
-- JOIN
-- ----------------------------------------------------------

-- 1.
select f.nome as Funcionario, d.nome as departamento from funcionario f inner join departamento d on f.numerodepto = d.numero order by f.nome asc;

-- 2.
select f.nome as Funcionario, f.salario, d.nome as Departamento from funcionario f inner join departamento d on d.numero = f.numerodepto and d.nome like "Recursos Humanos";

-- 3.
select f.numero, f.nome as Funcionario, 