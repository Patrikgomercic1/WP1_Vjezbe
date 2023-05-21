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