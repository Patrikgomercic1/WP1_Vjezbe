use master;
drop database if exists UdrugaZaZastituZivotinja;
go
create database UdrugaZaZastituZivotinja collate Croatian_CI_AS;
go
use UdrugaZaZastituZivotinja;

create table djelatnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	zivotinja int
);

create table zivotinja(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	vrsta varchar(40) not null,
	starost int
);

create table prostor(
	sifra int not null primary key identity(1,1),
	dimenzije decimal(20,2),
	lokacija varchar(30),
	naziv varchar(30)
);

create table �ivotinja_prostor(
	�ivotinja int,
	prostor int
);


alter table �ivotinja_prostor add foreign key (�ivotinja) references �ivotinja(sifra);
alter table �ivotinja_prostor add foreign key (prostor) references prostor(sifra);
alter table djelatnik add foreign key (�ivotinja) references �ivotinja(sifra);


insert into zivotinja(sifra,ime,vrsta,starost)
values
	(1,'Bijeli','Bengalski tigar','2'),
	(2,'Mato','Azijski slon','7'),
	(3,'Kristijan','Ameri�ki flamingo','1');

insert into djelatnik(sifra,ime,prezime,oib,zivotinja)
values
	(1,'Dalibor','Deji�','51536965856','2'),
	(2,'Kristina','Bla�evi�','02084268552','3'),
	(3,'Adrijan','Tukari�','582366245992','1');

update djelatnik set ime='Dori�' where sifra=3

--drop database if exists UdrugaZaZastituZivotinja;
