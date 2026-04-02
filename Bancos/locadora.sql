drop database if exists locadora;
create database if not exists locadora;
use locadora;

create table cliente(
	CLIcod int not null,
    CLInome varchar(30),
    CLIcpf decimal(11,0),
    CLIsexo char(1),
    CLIdatanasc datetime,
    CLItelres decimal(11,0),
    CLItelcom decimal(11,0),
    CLItelcel decimal(11,0),
    CLIrua varchar(40),
    CLInum decimal(4,0),
    CLIbairro varchar(40),
    CLIcep decimal(8,0),
    CLIcidade varchar(20),
    primary key (CLIcod)
);

create table filme(
	FILcod int not null,
    FILnome varchar(30),
    FILdataprod datetime,
    FILduracao decimal(5,0),
    FILvalorcompra decimal(10,2),
    FILvaloraluguel decimal(10,2),
    primary key (FILcod)
);

create table midtipo(
	MIDTIPOcod int not null,
    MIDTIPOnome varchar(100),
    primary key (MIDTIPOcod)
);

create table midia(
	MIDcod int not null,
    MIDdatagrav datetime,
    MIDstatus char(1),
    MIDvendaaluga varchar(30),
    CLIcod int,
    COMPdata datetime,
    MIDTIPOcod int,
    primary key (MIDcod),
    foreign key (CLIcod) references cliente(CLIcod),
    foreign key (MIDTIPOcod) references midtipo(MIDTIPOcod) 
);

create table clientealugamidia(
	CLIcod int not null,
    MIDcod int not null,
    ALUvalor decimal(10,2),
    ALUmulta decimal(10,2),
    ALUdataal datetime,
    ALUdatadev datetime,
    foreign key(CLIcod) references cliente(CLIcod) ON DELETE CASCADE,
    foreign key(MIDcod) references midia(MIDcod) ON DELETE CASCADE
);

create table dependente(
	DEPnome varchar(30),
    DEPrg decimal(10,0) not null,
    DEPdatanasc datetime,
    CLIcod int not null,
    primary key (DEPrg),
    foreign key (CLIcod) references cliente(CLIcod) ON DELETE CASCADE
);

create table midiacontemfilme(
	MIDcod int not null,
    FILcod int not null,
    primary key (MIDcod, FILcod),
    foreign key (MIDcod) references midia(MIDcod) ON DELETE CASCADE,
    foreign key (FILcod) references filme(FILcod) ON DELETE CASCADE
);

create table filclass(
	FILCLASScod int not null,
    FILCLASSnome varchar(100),
    primary key (FILCLASScod)
);

create table filmetemclass(
	FILcod int not null,
    FILCLASScod int not null,
    primary key (FILcod, FILCLASScod),
    foreign key (FILcod) references filme(FILcod) ON DELETE CASCADE,
    foreign key (FILCLASScod) references filclass(FILCLASScod) ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- TABELA: cliente
-- ------------------------------------------------------------
INSERT INTO cliente VALUES (1, 'Ana Souza',        12345678901, 'F', '1990-03-15', 1132001122, 1132003344, 11987654321, 'Rua das Flores',    10, 'Centro',        01310100, 'São Paulo');
INSERT INTO cliente VALUES (2, 'Carlos Lima',      23456789012, 'M', '1985-07-22', 1133001122, 1133003344, 11976543210, 'Av. Paulista',      500, 'Bela Vista',   01310900, 'São Paulo');
INSERT INTO cliente VALUES (3, 'Fernanda Costa',   34567890123, 'F', '1995-11-08', 1134001122, 1134003344, 11965432109, 'Rua Augusta',       200, 'Consolação',   01305100, 'São Paulo');
INSERT INTO cliente VALUES (4, 'Ricardo Alves',    45678901234, 'M', '1978-01-30', 1135001122, 1135003344, 11954321098, 'Rua Oscar Freire',  45,  'Jardins',      01426001, 'Araraquara');
INSERT INTO cliente VALUES (5, 'Patrícia Mendes',  56789012345, 'F', '2000-09-12', 1136001122, 1136003344, 11943210987, 'Av. Rebouças',      300, 'Pinheiros',    05402100, 'São Carlos');
INSERT INTO cliente VALUES (6, 'João Ferreira',    67890123456, 'M', '1992-05-18', 1137001122, 1137003344, 11932109876, 'Rua Haddock Lobo',  80,  'Cerqueira César',01414003,'São Carlos');

-- ------------------------------------------------------------
-- TABELA: filme
-- ------------------------------------------------------------
INSERT INTO filme VALUES (1, 'Oppenheimer',     '2023-07-21', 180, 150.00, 12.00);
INSERT INTO filme VALUES (2, 'Duna Parte 2',    '2024-03-01', 166, 140.00, 8.00);
INSERT INTO filme VALUES (3, 'Interestelar',    '2014-11-07', 169, 80.00,   8.00);
INSERT INTO filme VALUES (4, 'Parasita',        '2019-05-30', 132, 90.00,   10.00);
INSERT INTO filme VALUES (5, 'Tudo em Todo Lugar','2022-03-25',139, 110.00, 10.00);
INSERT INTO filme VALUES (6, 'Joker',           '2019-10-04', 122, 85.00,   8.00);

-- ------------------------------------------------------------
-- TABELA: midtipo (tipo de mídia)
-- ------------------------------------------------------------
INSERT INTO midtipo VALUES (1, 'DVD');
INSERT INTO midtipo VALUES (2, 'Blu-ray');
INSERT INTO midtipo VALUES (3, 'Blu-ray 4K Ultra HD');
INSERT INTO midtipo VALUES (4, 'VHS');
INSERT INTO midtipo VALUES (5, 'Streaming Digital');

-- ------------------------------------------------------------
-- TABELA: midia
-- MIDstatus: 'D' = disponível, 'A' = alugada, 'V' = vendida
-- ------------------------------------------------------------
INSERT INTO midia VALUES (1, '2024-01-10', 'D', 'ALUGUEL', 1, '2024-01-10', 2);
INSERT INTO midia VALUES (2, '2024-02-15', 'A', 'ALUGUEL', 2, '2024-02-15', 2);
INSERT INTO midia VALUES (3, '2024-03-20', 'V', 'VENDA',   3, '2024-03-20', 3);
INSERT INTO midia VALUES (4, '2024-04-05', 'D', 'ALUGUEL', 4, '2024-04-05', 1);
INSERT INTO midia VALUES (5, '2024-05-12', 'A', 'ALUGUEL', 5, '2024-05-12', 2);
INSERT INTO midia VALUES (6, '2024-06-01', 'V', 'VENDA',   6, '2024-06-01', 3);

-- ------------------------------------------------------------
-- TABELA: clientealugamidia
-- ------------------------------------------------------------
INSERT INTO clientealugamidia VALUES (1, 1, 12.00, 0.00,  '2024-06-01', '2024-06-05');
INSERT INTO clientealugamidia VALUES (2, 2, 11.00, 5.50,  '2024-06-03', '2024-06-10');
INSERT INTO clientealugamidia VALUES (3, 4,  8.00, 0.00,  '2024-06-05', '2024-06-08');
INSERT INTO clientealugamidia VALUES (4, 5,  9.00, 3.00,  '2024-06-07', '2024-06-15');
INSERT INTO clientealugamidia VALUES (5, 1, 10.00, 0.00,  '2024-06-10', '2024-06-13');
INSERT INTO clientealugamidia VALUES (6, 4,  8.50, 0.00,  '2024-06-12', '2024-06-14');
INSERT INTO clientealugamidia VALUES (2, 4,  8.50, 10.00,  '2024-06-12', '2024-06-14');
INSERT INTO clientealugamidia VALUES (4, 4,  8.50, 9.00,  '2024-06-12', '2024-06-14');

-- ------------------------------------------------------------
-- TABELA: dependente
-- ------------------------------------------------------------
INSERT INTO dependente VALUES ('Lucas Souza',    1234567890, '2015-04-10', 1);
INSERT INTO dependente VALUES ('Beatriz Lima',   2345678901, '2012-08-22', 2);
INSERT INTO dependente VALUES ('Pedro Costa',    3456789012, '2018-01-05', 3);
INSERT INTO dependente VALUES ('Sofia Alves',    4567890123, '2010-11-30', 4);
INSERT INTO dependente VALUES ('Mateus Mendes',  5678901234, '2016-07-19', 5);
INSERT INTO dependente VALUES ('Clara Ferreira', 6789012345, '2013-03-25', 6);

-- ------------------------------------------------------------
-- TABELA: midiacontemfilme
-- ------------------------------------------------------------
INSERT INTO midiacontemfilme VALUES (1, 1);
INSERT INTO midiacontemfilme VALUES (2, 2);
INSERT INTO midiacontemfilme VALUES (3, 3);
INSERT INTO midiacontemfilme VALUES (4, 4);
INSERT INTO midiacontemfilme VALUES (5, 5);
INSERT INTO midiacontemfilme VALUES (6, 6);
INSERT INTO midiacontemfilme VALUES (1, 3);

-- ------------------------------------------------------------
-- TABELA: filclass (classificação dos filmes)
-- ------------------------------------------------------------
INSERT INTO filclass VALUES (1, 'Ação');
INSERT INTO filclass VALUES (2, 'Drama');
INSERT INTO filclass VALUES (3, 'Ficção Científica');
INSERT INTO filclass VALUES (4, 'Suspense / Thriller');
INSERT INTO filclass VALUES (5, 'Comédia');
INSERT INTO filclass VALUES (6, 'Terror');

-- ------------------------------------------------------------
-- TABELA: filmetemclass
-- ------------------------------------------------------------
INSERT INTO filmetemclass VALUES (1, 2); -- Oppenheimer: Drama
INSERT INTO filmetemclass VALUES (1, 4); -- Oppenheimer: Thriller
INSERT INTO filmetemclass VALUES (2, 3); -- Duna 2: Ficção Científica
INSERT INTO filmetemclass VALUES (2, 1); -- Duna 2: Ação
INSERT INTO filmetemclass VALUES (3, 3); -- Interestelar: Ficção Científica
INSERT INTO filmetemclass VALUES (3, 2); -- Interestelar: Drama
INSERT INTO filmetemclass VALUES (4, 2); -- Parasita: Drama
INSERT INTO filmetemclass VALUES (4, 4); -- Parasita: Thriller
INSERT INTO filmetemclass VALUES (5, 5); -- Tudo em Todo Lugar: Comédia
INSERT INTO filmetemclass VALUES (5, 3); -- Tudo em Todo Lugar: Ficção Científica
INSERT INTO filmetemclass VALUES (6, 2); -- Joker: Drama
INSERT INTO filmetemclass VALUES (6, 4); -- Joker: Thriller


-- ------------------------------------------------------------
-- EXERCÍCIO
-- ------------------------------------------------------------

-- 1.
select max(c.CLIcidade) as cidade from cliente c;

-- 2.
select fc.FILCLASSnome, count(ftc.FILcod) as QtdFilme from filclass fc, filmetemclass ftc 
	where fc.FILCLASScod = ftc.FILCLASScod 
		group by ftc.FILCLASScod 
			order by count(ftc.FILcod) desc limit 1;

-- 3.
select FILvaloraluguel, count(*) as QtdFilme from filme f group by FILvaloraluguel;

-- 4.
select CLIsexo, count(*) as QtdCliente from cliente group by CLIsexo;

-- 5.
select c.CLIcod, c.CLInome, count(d.DEPnome) as QtdDependete from cliente c, dependente d where c.CLIcod = d.CLIcod group by CLIcod;

-- 6.
select mt.MIDTIPOnome, count(m.MIDcod) as QtdMidia from midia m, midtipo mt where mt.MIDTIPOcod = m.MIDTIPOcod group by MIDTIPOnome;

-- 7.
select CLIcod, sum(ALUmulta) as SomaMulta from clientealugamidia group by CLIcod;