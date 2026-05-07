-- 8.

use medicamentos;

drop view if exists v_medicamentos_validos;
create view v_medicamentos_validos as
	select m.nome, f.razao_social from 
		medicamento m inner join fabricante f on m.codigo_fabricante = f.codigo 
			where m.data_validade > '2025-01-01';
            
            
# ------------------------------------------------------------------ #
-- 9.

use locadora;

start transaction;
update filme set FILvaloraluguel = FILvaloraluguel * 1.1; 
savepoint antes_da_atualizacao; 

ROLLBACK TO SAVEPOINT antes_da_atualizacao;

update filme set FILvaloraluguel = FILvaloraluguel / 1.1;


# ------------------------------------------------------------------ #
-- 10.

use locadora;

create view v_resumo_aluguel as
	select c.CLInome, ca.ALUdataal, ca.ALUmulta from cliente c, clientealugamidia ca
		where c.CLIcod = ca.CLIcod; 
        

# ------------------------------------------------------------------ #
-- 11.

use medicamentos;

drop view if exists v_celular_cliente;
create view v_celular_cliente as
	select c.nome_cliente, ct.telefone_celular from
		cliente c, cliente_telefone ct where c.cpf_cliente = ct.cpf_cliente;
        
        
# ------------------------------------------------------------------ #
-- 12.

alter view v_medicamentos_validos as
	select m.nome, f.razao_social, f.email from 
		medicamento m inner join fabricante f on m.codigo_fabricante = f.codigo 
			where m.data_validade > '2025-01-01';


