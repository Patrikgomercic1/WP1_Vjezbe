use master;
drop database if exists samostan;
go
create database samostan;
go
use samostan;


create table svecenik(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	red varchar(30),
	nadredjeni int
);

create table posao(
	sifra int not null primary key identity(1,1),
	naziv varchar(20) not null,
	datumnastanka datetime
);

create table svecenik_posao(
	svecenik int,
	posao int
);


alter table svecenik add foreign key (nadredjeni) references svecenik(sifra);
alter table svecenik_posao add foreign key (svecenik) references svecenik(sifra);
alter table svecenik_posao add foreign key (posao) references posao(sifra);