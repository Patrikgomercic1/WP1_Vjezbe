use master;
drop database if exists DjecjiVrtic;
go
create database DjecjiVrtic;
go
use DjecjiVrtic;


create table skupina(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	odgajateljica int
);

create table dijete(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25),
	skupina int
);

create table odgajateljica(
	sifra int not null primary key identity(1,1),
	ime varchar(25) not null,
	prezime varchar(25) not null,
	strucnasprema int
);

create table strucnasprema(
	sifra int not null primary key identity(1,1),
	naziv varchar(50)
);

create table dijete_skupina(
	dijete int,
	skupina int
);


alter table odgajateljica add foreign key (strucnasprema) references strucnasprema(sifra);
alter table dijete_skupina add foreign key (dijete) references dijete(sifra);
alter table dijete_skupina add foreign key (skupina) references skupina(sifra);
alter table skupina add foreign key (odgajateljica) references odgajateljica(sifra);



insert into strucnasprema(sifra,naziv)
values (1,'odgajateljica');

insert into odgajateljica (sifra,ime,prezime,strucnasprema)
values 
	(1,'Glorija','Matijevi�','1'),
	(2,'Marta','Radi�','1'),
	(3,'Ivona','Radi�','1');

	insert into skupina (sifra,naziv,odgajateljica)
values 
	(1,'Bubamare','2'),
	(2,'Leptiri�i','1'),
	(3,'P�elice','3');

update skupina set naziv='' where sifra=3

--drop database if exists DjecjiVrtic;
