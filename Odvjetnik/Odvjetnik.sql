use master;
drop database if exists odvjetnik;
go
create database odvjetnik;
go
use odvjetnik;


create table klijent(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	optuzba varchar(30)
);

create table obrana(
	sifra int not null primary key identity(1,1),
	kazneno_djelo varchar(30), 
	datum datetime,
	klijent int,
	suradnik int
);

create table suradnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	firma varchar(70)
);


alter table obrana add foreign key (klijent) references klijent(sifra);
alter table obrana add foreign key (suradnik) references suradnik(sifra);


insert into suradnik(sifra,ime,prezime,firma)
values
	(1,'Davor','Abramoviæ','ODVJETNIÈKO DRUŠTVO VIDOVIÆ & PARTNERI d.o.o.'),
	(2,'Vinko','Agniæ','CRNKIÆ GOTOVAC & ERCEG ODVJETNIÈKO DRUŠTVO d.o.o.'),
	(3,'Dora', 'Adžiæ','MATEKOVIÆ & partneri Odvjetnièko društvo d.o.o.');

insert into klijent(sifra,ime,prezime,optuzba)
values
	(1,'Mirko','Mirkoviæ','Teška kraða'),
	(2,'Ante','Aniæ','Prijevara'),
	(3,'Mirjana','Bosiæ','Razbojništvo');

update klijent set ime='Antonio' where sifra=2

--drop database if exists odvjetnik;
