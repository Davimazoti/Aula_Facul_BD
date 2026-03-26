-- drop database if exists cinema;
create database if not exists cinema;
use cinema;

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
    foreign key(CLIcod) references cliente(CLIcod),
    foreign key(MIDcod) references midia(MIDcod)
);

create table dependente(
	DEPnome varchar(30),
    DEPrg decimal(10,0) not null,
    DEPdatanasc datetime,
    CLIcod int not null,
    primary key (DEPrg),
    foreign key (CLIcod) references cliente(CLIcod)
);
