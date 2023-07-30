use master;
drop database if exists trgovacki_centar;
go
create database trgovacki_centar;
go
use trgovacki_centar;


create table trgovina(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	vrsta varchar(20),
	radno_vrijeme datetime
);

create table radnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table sef(
	sifra int not null primary key identity(1,1),
	radnik int,
	trgovina int
);

create table trgovina_radnik(
	trgovina int,
	radnik int
);


alter table trgovina_radnik add foreign key (trgovina) references trgovina(sifra);
alter table trgovina_radnik add foreign key (radnik) references radnik(sifra);
alter table sef add foreign key (radnik) references radnik(sifra);
alter table sef add foreign key (trgovina) references trgovina(sifra);


insert into trgovina(sifra,naziv,vrsta,radno_vrijeme)
values
	(1,'Slavonija Boškoviæ','prehrambeni proizvodi','08:00:00-20:00:00'),
	(2,'ELECTRONIC CENTER','Trgovina elektronièkom robom','08:00:00-20:00:00'),
	(3,'HGSPOT','Prodavaonica raèunalne opreme','08:00:00-20:00:00');

insert into radnik(sifra,ime,prezime,oib)
values
	(1,'Anamarija','Mariæ','0123658596'),
	(2,'Mate','Matiæ','95635214842'),
	(3,'Hrvoje','Horvat','25452963510');

update trgovina set radno_vrijeme='08:00:00-19:00:00' where sifra=2
--drop database if exists trgovacki_centar;
