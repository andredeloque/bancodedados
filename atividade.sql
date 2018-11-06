create database venda;

create table cidades
(codCidade integer not null primary key,
nomeCidade varchar(30) not null,
ufCidade varchar(02) not null);

create table clientes
(codCliente integer not null primary key,
nomeCliente varchar(50) not null,
codCidade integer not null,
foreign key(codCidade) references cidades(codCidade));


create table vendas
 
 (numVenda integer not null primary key,
 
 data_venda date not null,
 
 codCliente integer not null,
 
 valorTotal float not null,
 
 foreign key (codCliente) references clientes(codCliente));


  
create table produtos

(codProduto integer not null primary key,
 
nomeProduto varchar(50) not null,

quantidade integer not null,

preco_unitario float not null);



create table ItemVendas

(numVenda integer not null,

codProduto integer not null,

quantVenda integer not null,

valorItem float not null,

primary key(numVenda, codProduto),

foreign key(numVenda) references vendas(numVenda),

foreign key(codProduto) references produtos(codProduto));

insert into cidades values(1,"MARINGÁ","PR");
insert into cidades values(2,"SÃO PAULO","SP");
insert into cidades values(3,"FLORIANÓPOLIS","SC");

insert into clientes values(1,"MARCIO GONÇALVES",1);
insert into clientes values(2,"ALTEMAR SILVA",1);
insert into clientes values(3,"ROGERIO XAVIER",2);
insert into clientes values(4,"MARIA APARECIDA SILVA",3);

insert into produtos values(1,"teclado lenovo preto",10,50.00);
insert into produtos values(2,"gabinete multilaser preto",10,80.00);
insert into produtos values(3,"hd sansung 1 tera",10,500.00);


insert into vendas values(1,"20/10/2018",1,250.00);
insert into vendas values(2,"20/10/2018",1,50.00);
insert into vendas values(3,"21/10/2018",3,130.00);
insert into vendas values(4,"22/10/2018",4,500.00);


insert into itemVendas values(1,1,5,50.00);
insert into itemVendas values(2,2,1,50.00);
insert into itemVendas values(3,2,1,80.00);
insert into itemVendas values(3,1,5,50.00);
insert into itemVendas values(4,3,1,500.00);

select * from vendas ;
update  vendas set data_venda = "2018/10/20" where numvenda = 1;
update  vendas set data_venda = "2018/10/20" where numvenda = 2;
update  vendas set data_venda = "2018/10/21" where numvenda = 3;
update  vendas set data_venda = "2018/10/22" where numvenda = 4;

select * from vendas ;

select * from venda.vendas where data_venda > '2018/10/21';

SELECT c.nomeCliente, v.data_venda FROM vendas v
	JOIN clientes c ON v.codCliente = c.codCliente
	WHERE data_venda > '2018-10-21';

SELECT c.nomeCliente, p.nomeProduto , v.data_venda, v.valorTotal FROM vendas v
	JOIN clientes c ON v.codCliente = c.codCliente
	JOIN itemvendas i ON v.numVenda = i.numVenda
    JOIN produtos p ON i.codProduto = p.codProduto
    WHERE data_venda > '2018-10-22';
    
SELECT c.nomeCliente, p.nomeProduto , v.data_venda, v.valorTotal FROM vendas v
	JOIN clientes c ON v.codCliente = c.codCliente
	JOIN itemvendas i ON v.numVenda = i.numVenda
    JOIN produtos p ON i.codProduto = p.codProduto
    WHERE valorTotal > 100;
    
SELECT clientes.nomeCliente, vendas.data_venda FROM vendas, clientes
	WHERE data_venda > '2018-10-21'
	GROUP BY clientes.codCliente;
    
    
SELECT vendas.data_venda, SUM(vendas.valorTotal), vendas.codCliente, clientes.nomeCliente FROM vendas, clientes
	where vendas.codCliente = clientes.codCliente
    group by vendas.codCliente;
    
SELECT vendas.data_venda, avg(vendas.valorTotal), vendas.codCliente, clientes.nomeCliente FROM vendas, clientes
	where vendas.codCliente = clientes.codCliente
    group by vendas.codCliente;
    
SELECT vendas.data_venda, max(vendas.valorTotal), vendas.codCliente, clientes.nomeCliente FROM vendas, clientes
	where vendas.codCliente = clientes.codCliente
    group by vendas.codCliente;
    
SELECT vendas.data_venda, SUM(vendas.valorTotal), vendas.codCliente, clientes.nomeCliente FROM vendas, clientes
	where vendas.codCliente = clientes.codCliente and clientes.nomeCliente like 'M%';
    

SELECT vendas.data_venda, SUM(vendas.valorTotal), vendas.codCliente, clientes.nomeCliente 
	FROM vendas
    JOIN clientes on clientes.codCliente = clientes.codCliente
    group by vendas.codCliente;
    
