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
	(1,'Davor','Abramovi�','ODVJETNI�KO DRU�TVO VIDOVI� & PARTNERI d.o.o.'),
	(2,'Vinko','Agni�','CRNKI� GOTOVAC & ERCEG ODVJETNI�KO DRU�TVO d.o.o.'),
	(3,'Dora', 'Ad�i�','MATEKOVI� & partneri Odvjetni�ko dru�tvo d.o.o.');

insert into klijent(sifra,ime,prezime,optuzba)
values
	(1,'Mirko','Mirkovi�','Te�ka kra�a'),
	(2,'Ante','Ani�','Prijevara'),
	(3,'Mirjana','Bosi�','Razbojni�tvo');

update klijent set ime='Antonio' where sifra=2

--drop database if exists odvjetnik;
