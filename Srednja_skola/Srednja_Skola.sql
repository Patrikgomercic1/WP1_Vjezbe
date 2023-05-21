use master;
drop database if exists srednja_skola;
go
create database srednja_skola;
go
use srednja_skola;


create table razred(
	sifra int not null primary key identity(1,1),
	naziv varchar(15),
	ucenik int
);

create table ucenik(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table profesor(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11),
	predmet varchar(20)
);

create table razred_profesor(
	razred int,
	profesor int
);


alter table razred add foreign key (ucenik) references ucenik(sifra);
alter table razred_profesor add foreign key (razred) references razred(sifra);
alter table razred_profesor add foreign key (profesor) references profesor(sifra);