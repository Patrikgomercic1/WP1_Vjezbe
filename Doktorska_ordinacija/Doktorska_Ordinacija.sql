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
	kontakt varchar(15)
);

create table doktor(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt varchar(15)
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


insert into pacijent(sifra,ime,prezime,kontakt,osiguranje)
values
	(1,'Marta','Badriæ','0955324010','Wiener'),
	(2,'Marica','Jurèeviæ','0923176592','HZZO'),
	(3,'Nada','Kovaèiæ','0927848392','Allianz');

insert into doktor(sifra,ime,prezime,kontakt)
values
	(1,'Jakov','Iliæ','031 359 245'),
	(2,'Damir','Lovriæ','031 652 225'),
	(3,'Matea','Kovaè','031 985 886');

insert into medicinska_sestra(sifra,ime,prezime,kontakt)
values
	(1,'Jasmina','Baroviæ','031 359 245'),
	(2,'Ema','Katiæ','031 652 225'),
	(3,'Mia','Rebiæ','031 985 886');


update pacijent set kontakt='0955324055' where sifra=1
update doktor set kontakt='031 582 654' where sifra=1
--drop database if exists doktorska_ordinacija;
