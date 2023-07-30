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


insert into posao(sifra,naziv,datumnastanka)
values
	(1,'Branje plodova','2016-07-21'),
	(2,'Vrtlarenje','2010-12-13'),
	(3,'Kuhar','50','2005-06-06');

update posao set naziv='Èišæenje' where sifra=1

--drop database if exists samostan;
