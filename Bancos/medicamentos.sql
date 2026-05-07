-- Criação do Banco de Dados
DROP DATABASE IF EXISTS `medicamentos`;
CREATE DATABASE `medicamentos`;
USE `medicamentos`;

-- 1. Tabela: cliente
CREATE TABLE `cliente` (
  `cpf_cliente` varchar(11) NOT NULL,
  `nome_cliente` varchar(60) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_de_nascimento` date NOT NULL,
  PRIMARY KEY (`cpf_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cliente` VALUES 
('11890023414','Daniel Abrantes','daniel@email.com','1991-04-11'),
('12345678901','Euclidis da Cunha','euclidis@email.com','1980-05-15'),
('23456789012','Fernando Pessoa','fernando@email.com','1982-02-28'),
('29022345222','Cleber Amaral','camaral@email.com','1998-09-23'),
('33301034101','Fabio Cortes','fabio@email.com','1989-01-30'),
('34567890123','Joana de Almeida','joana@email.com','1985-09-10'),
('45678901234','Carlos da Silva','carlos@email.com','2008-12-20'),
('56789012345','Bianca Nunes','bianca@email.com','1995-04-05'),
('67890123456','Gilberto Pessoa','gilberto@email.com','2000-07-12'),
('78901234567','Fabiana de Almeida','fabiana@email.com','1999-11-30'),
('89012345678','Ana Pessoa','ana@email.com','2007-03-25');

-- 2. Tabela: cliente_endereco
CREATE TABLE `cliente_endereco` (
  `cpf_cliente` varchar(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `rua` varchar(60) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `cep` varchar(15) NOT NULL,
  PRIMARY KEY (`cpf_cliente`),
  CONSTRAINT `fk_cliente_endereco_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cliente_endereco` VALUES 
('12345678901','SP','São Paulo','Centro','Rua XV de Novembro','123','01234-567'),
('23456789012','RJ','Rio de Janeiro','Copacabana','Avenida Beira Rio','456','04567-890'),
('34567890123','MG','Belo Horizonte','Savassi','Avenida Tiradentes','789','05678-901'),
('45678901234','RS','Porto Alegre','Moinhos de Vento','Avenida Dom Pedro','801','06789-012'),
('56789012345','PR','Curitiba','Batel','Rua Emiliano Costa','202','07890-123'),
('67890123456','SP','São Paulo','Vila Madalena','Rua Das Alamedas','303','08901-234'),
('78901234567','SP','São Paulo','Ipiranga','Avenida Getulio Vargas','585','09012-345'),
('89012345678','SP','São Paulo','Liberdade','Rua Coronel Leonidas','757','09123-456');

-- 3. Tabela: cliente_telefone
CREATE TABLE `cliente_telefone` (
  `cpf_cliente` varchar(11) NOT NULL,
  `telefone_celular` varchar(15) NOT NULL,
  `telefone_residencial` varchar(15) DEFAULT NULL,
  `telefone_comercial` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cpf_cliente`),
  CONSTRAINT `fk_cliente_telefone_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cliente_telefone` VALUES 
('12345678901','1198765421','1123456789','1133334411'),
('23456789012','2199998881','2145678901','2112345678'),
('34567890123','3198800771','3123456789','3155556600'),
('45678901234','5199996662','5123456789','5133334488'),
('56789012345','4199811771','4123456789','4144499556'),
('67890123456','1199777662','7123456789','1133399441'),
('78901234567','1199622555','8123456789','1133300442'),
('89012345678','1199711440','6123456789','1133322443');

-- 4. Tabela: fabricante
CREATE TABLE `fabricante` (
  `codigo` varchar(15) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `fabricante` VALUES 
('F001','FarmA','Nossa Farma Farmacêutica','nossafarma@farma.com'),
('F002','FarmB','Saúde Farmacêutica','contatosaude@farma.com'),
('F003','FarmC','Quimica Boa Farmacêutica','quimicaboa@farma.com'),
('F004','FarmD','Melhora Farmacêutica','melhora@farma.com'),
('F005','FarmE','CEMAC Farmacêutica','cemac@farma.com'),
('F006','FarmF','Quimio Farmacêutica','quimeiofarma@farma.com'),
('F007','FarmG','Quimera Farmacêutica','quimerafarma@farma.com'),
('F008','FarmH','Cooperativa Farmacêutica','coopfarma@farma.com'),
('F009','FarmI','Vitta Farmacêutica','vittafarma@farma.com'),
('F010','FarmJ','Vital Medical Farmacêutica','vmedical@farma.com'),
('F011','FarmL','SANS Farmacêutica','sansfarma@farma.com');

-- 5. Tabela: medicamento
CREATE TABLE `medicamento` (
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `codigo_fabricante` varchar(15) NOT NULL,
  `data_validade` date NOT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `fk_medicamento_fabricante` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `medicamento` VALUES 
('M001','Paracetamol','F001','2025-12-31'),
('M002','Ibuprofeno','F002','2024-06-30'),
('M003','Amoxicilina','F003','2026-09-15'),
('M004','Dipirona','F004','2023-12-20'),
('M005','Omeprazol','F005','2024-11-30'),
('M006','Ranitidina','F006','2026-08-25'),
('M007','Losartana','F001','2024-07-10'),
('M008','Metformina','F001','2025-11-05');

-- 6. Tabela: venda
CREATE TABLE `venda` (
  `codigo` varchar(10) NOT NULL,
  `data_venda` date NOT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `codigo_medicamento` varchar(10) NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_medicamento` FOREIGN KEY (`codigo_medicamento`) REFERENCES `medicamento` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venda_chk_1` CHECK (`quantidade` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `venda` VALUES 
('V001','2023-01-15','12345678901','M001',2),
('V002','2023-02-20','23456789012','M002',3),
('V003','2023-02-25','34567890123','M003',3),
('V004','2023-04-30','45678901234','M004',3),
('V005','2023-02-10','56789012345','M005',4);

-- join --

-- 1
	select c.nome_cliente, v.data_venda from cliente c inner join venda v;
    
-- 2
	select c.nome_cliente, ce.cidade, ce.estado, ct.telefone_celular from 
		cliente c inner join cliente_endereco ce on c.cpf_cliente = ce.cpf_cliente
			inner join cliente_telefone ct on c.cpf_cliente = ct.cpf_cliente;
            
-- 3
	select m.nome, f.nome_fantasia from medicamento m inner join fabricante f order by nome asc;
    
-- 4
	select v.codigo, c.nome_cliente, m.nome, v.quantidade, v.data_venda from
		cliente c inner join venda v on c.cpf_cliente = v.cpf_cliente
			inner join medicamento m on m.codigo = v.codigo_medicamento order by data_venda desc;
            
-- 5
	select m.codigo, f.nome_fantasia, f.email from 
		fabricante f left join medicamento m on f.codigo = m.codigo_fabricante order by f.codigo asc;

-- 6
	select c.cpf_cliente, c.nome_cliente, ce.cidade, ct.telefone_celular from
		cliente c left join cliente_endereco ce on c.cpf_cliente = ce.cpf_cliente
			left join cliente_telefone ct on c.cpf_cliente = ct.cpf_cliente;

-- 7
	select f.codigo, f.nome_fantasia from
		fabricante f left join medicamento m on f.codigo = m.codigo_fabricante
			where m.codigo is null;
            
-- 8
	select m.nome, f.nome_fantasia from 
		medicamento m right join fabricante f on f.codigo = m.codigo_fabricante order by nome_fantasia asc;
        
-- 9
	select v.codigo, c.nome_cliente, v.data_venda from
		venda v right join cliente c on v.cpf_cliente = c.cpf_cliente order by nome_cliente asc;

-- 10
	-- Consulta A: INNER JOIN (Apenas quem comprou)
	select c.nome_cliente, v.codigo from cliente c inner join venda v on c.cpf_cliente = v.cpf_cliente;

	-- Consulta B: LEFT JOIN (Todas as vendas, mesmo sem cliente - embora na FK seja obrigatório)
	select v.codigo, c.nome_cliente from venda v left join cliente c on v.cpf_cliente = c.cpf_cliente;

	-- Consulta C: RIGHT JOIN (Todos os clientes, inclusive os que não compraram)
	select c.nome_cliente, v.codigo from venda v right join cliente c on v.cpf_cliente = c.cpf_cliente;

-- 11
	select f.nome_fantasia, count(m.codigo) as quantidade_medicamentos from
		fabricante f inner join medicamento m on f.codigo = m.codigo_fabricante
			group by f.nome_fantasia;

-- 12
	select f.nome_fantasia, count(m.codigo) as qtd_medicamentos from
		fabricante f left join medicamento m on f.codigo = m.codigo_fabricante
			group by f.nome_fantasia order by qtd_medicamentos desc;

-- 13
	select m.nome, m.data_validade, v.data_venda from
		venda v inner join medicamento m on v.codigo_medicamento = m.codigo
			where m.data_validade < curdate();

-- 14
	select c.nome_cliente, ce.cidade, v.codigo from
		cliente c inner join cliente_endereco ce on c.cpf_cliente = ce.cpf_cliente
			inner join venda v on c.cpf_cliente = v.cpf_cliente where ce.estado = 'SP';

-- 15
	select m.nome, sum(v.quantidade) as total_unidades from
		venda v inner join medicamento m on v.codigo_medicamento = m.codigo
			group by m.nome order by total_unidades desc;

-- 16
	select c.cpf_cliente, c.nome_cliente from
		cliente c left join cliente_endereco ce on c.cpf_cliente = ce.cpf_cliente
			where ce.cpf_cliente is null;

-- 17
	select c.cpf_cliente, c.nome_cliente, c.email from
		cliente c left join venda v on c.cpf_cliente = v.cpf_cliente
			where v.codigo is null;

-- 18
	select f.nome_fantasia, sum(v.quantidade) as total_vendido from
		fabricante f inner join medicamento m on f.codigo = m.codigo_fabricante
			inner join venda v on m.codigo = v.codigo_medicamento
				group by f.nome_fantasia order by total_vendido desc limit 1;

-- 19
	select v.codigo, c.nome_cliente, ce.cidade, m.nome, f.nome_fantasia, v.quantidade, v.data_venda from
		venda v inner join cliente c on v.cpf_cliente = c.cpf_cliente
			inner join cliente_endereco ce on c.cpf_cliente = ce.cpf_cliente
				inner join medicamento m on v.codigo_medicamento = m.codigo
					inner join fabricante f on m.codigo_fabricante = f.codigo order by v.data_venda;

-- 20
	select c.nome_cliente, m.nome from cliente c cross join medicamento m;
