use master;
drop database if exists obiteljsko_poljoprivredno_gospodarstvo;
go
create database obiteljsko_poljoprivredno_gospodarstvo;
go
use obiteljsko_poljoprivredno_gospodarstvo;


create table proizvod(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	cijena decimal(10,2),
	djelatnik int
);

create table sirovina(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	kolièina varchar(25)
);

create table djelatnik(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25),
	oib char(11)
);

create table proizvod_sirovina(
    proizvod int,
    sirovina int
);


alter table proizvod_sirovina add foreign key (proizvod) references proizvod(sifra);
alter table proizvod_sirovina add foreign key (sirovina) references sirovina(sifra);
alter table proizvod add foreign key (djelatnik) references djelatnik(sifra);


insert into djelatnik(sifra,ime,prezime,oib)
values
	(1,'Rade','Mariæ','31258552697'),
	(2,'Ana','Magdiæ','54933258703'),
	(3,'Mate','Goriæ','6017982245');

insert into proizvod(sifra,naziv,cijena,djelatnik)
values
	(1,'Tikvice zelene kg','30','2'),
	(2,'Sok od šljiva 1l','50','3'),
	(3,'Sir Škripavac','20','1');

update proizvod set cijena='20.99' where sifra=3

--drop database if exists obiteljsko_poljoprivredno_gospodarstvo;
