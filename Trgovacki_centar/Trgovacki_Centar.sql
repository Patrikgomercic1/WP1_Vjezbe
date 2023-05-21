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