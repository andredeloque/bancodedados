create database vinicula;

create table regiao 
(cod_regiao int not null primary key,
 nome_regiao varchar(50) not null,
 descricao varchar(50) not null);
 
 create table vinicula 
 (cod_vinicula int not null primary key,
 nome_vinicula varchar(20) not null,
 fone varchar(15),
 codigoRegiao int not null,
 foreign key (codigoRegiao)references regiao (cod_regiao));
 
 create table vinho 
 (cod_vinho int not null primary key,
 nome_vinho varchar(30) not null,
 tipo_vinho varchar(30) not null,
 cod_vinicula int not null,
 foreign key (cod_vinicula)references vinicula(cod_vinicula));
 
 insert into regiao values (1,'sarandi','cidade');
 insert into regiao values (2,'maringa','municipio');
 
insert into vinicula values (1,'vinheira','123-456-789','1');
insert into vinicula values (2,'vinhado','321-654-987','2');

select * from  vinicula;