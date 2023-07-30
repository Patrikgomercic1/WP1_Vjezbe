use master;
drop database if exists vodoinstalater;
go
create database vodoinstalater;
go
use vodoinstalater;


create table kvar(
	sifra int not null primary key identity(1,1),
	vrsta varchar(25),
	kolièina int
);

create table popravak(
	sifra int not null primary key identity(1,1),
	trajanje datetime,
	cijena decimal(6,2),
	segrt int
);

create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime decimal(6,2),
	oib char(11),
	iskustvo varchar(20)
);

create table kvar_popravak(
	kvar int,
	popravak int
);


alter table kvar_popravak add foreign key (kvar) references kvar(sifra);
alter table kvar_popravak add foreign key (popravak) references popravak(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);

insert into popravak(sifra,trajanje,cijena,segrt)
values
	(1,'15:40:00-16:10:00','19.99',null),
	(2,'13:00:00-16:21:00','30.50',null),
	(3,'09:05:00-12:32:00','50.10',null);

insert into kvar(sifra,vrsta,kolièina)
values
	(1,'Zamjena bojlera','1'),
	(2,'Instalacija bojlera','5'),
	(3,'Instalacija radijatora','10');

update kvar set kolièina='2' where sifra=1

--drop database if exists vodoinstalater;