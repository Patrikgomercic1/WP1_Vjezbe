use master;
drop database if exists restoran;
go
create database restoran;
go
use restoran;


create table kategorija(
	sifra int not null primary key identity(1,1),
	naziv varchar(50),
);

create table jelo(
	sifra int not null primary key identity(1,1),
	naziv varchar(50),
	cijena decimal(6,2), 
	sastojci varchar(50),
	velièina varchar(15),
	kategorija int
);

create table pice(
	sifra int not null primary key identity(1,1),
	naziv varchar(50),
	cijena decimal(6,2),
	volumen decimal(3,2) 
);

create table jelo_pice(
	jelo int,
	pice int
);


alter table jelo add foreign key (kategorija) references kategorija(sifra);
alter table jelo_pice add foreign key (jelo) references jelo(sifra);
alter table jelo_pice add foreign key (pice) references pice(sifra);


insert into pice(sifra,naziv,cijena,volumen)
values
	(1,'Coca Cola','3.05','0,25 l'),
	(2,'Instant capuccino (Franck vanilija, klasik, irish, èokolada)','1.75',null),
	(3,'Martini','3.50','0,10 l');

insert into kategorija(sifra,naziv)
values
	(1,'Bezalkoholna piæa / Beverages'),
	(2,'Topli napitci'),
	(3,'Žestoka alkoholna piæa');

update pice set cijena='1.85' where sifra=2

--drop database if exists restoran;
