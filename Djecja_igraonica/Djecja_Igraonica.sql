use master;
drop database if exists djecja_igraonica;
go
create database djecja_igraonica;
go
use djecja_igraonica;


create table skupina(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	teta int
);

create table dijete(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25)
);

create table teta(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25)
);

create table dijete_skupina(
	dijete int,
	skupina int
);


alter table skupina add foreign key (teta) references teta(sifra);
alter table dijete_skupina add foreign key (dijete) references dijete(sifra);
alter table dijete_skupina add foreign key (skupina) references skupina(sifra);


insert into teta(sifra,ime,prezime)
values
	(1,'Ivana','Sokoliæ'),
	(2,'Gorana','Majiæ'),
	(3,'Maja','Antunoviæ');

insert into dijete(sifra,ime,prezime)
values
	(1,'Ivan','Horvat'),
	(2,'Luka','Babiæ'),
	(3,'Marija','Kusturiæ');

insert into skupina(sifra,naziv,teta)
values
	(1,'Skupina_1','2'),
	(2,'Skupina_2','3'),
	(3,'Skupina_3','1');

update skupina set naziv='Tigar' where sifra=1

--drop database if exists djecja_igraonica;