use master;
drop database if exists doktorska_ordinacija;
go
create database doktorska_ordinacija;
go
use doktorska_ordinacija;


create table pacijent(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int,
	osiguranje varchar(30)
);

create table medicinska_sestra(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int
);

create table doktor(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int
);

create table lijecenje(
	sifra int not null primary key identity(1,1),
	datum datetime,
	pacijent int,
	medicinska_sestra int,
	doktor int
);


alter table lijecenje add foreign key (pacijent) references pacijent(sifra);
alter table lijecenje add foreign key (medicinska_sestra) references medicinska_sestra(sifra);
alter table lijecenje add foreign key (doktor) references doktor(sifra);
