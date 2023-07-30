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

create table životinja_prostor(
	životinja int,
	prostor int
);


alter table životinja_prostor add foreign key (životinja) references životinja(sifra);
alter table životinja_prostor add foreign key (prostor) references prostor(sifra);
alter table djelatnik add foreign key (životinja) references životinja(sifra);


insert into zivotinja(sifra,ime,vrsta,starost)
values
	(1,'Bijeli','Bengalski tigar','2'),
	(2,'Mato','Azijski slon','7'),
	(3,'Kristijan','Amerièki flamingo','1');

insert into djelatnik(sifra,ime,prezime,oib,zivotinja)
values
	(1,'Dalibor','Dejiæ','51536965856','2'),
	(2,'Kristina','Blaževiæ','02084268552','3'),
	(3,'Adrijan','Tukariæ','582366245992','1');

update djelatnik set ime='Doriæ' where sifra=3

--drop database if exists UdrugaZaZastituZivotinja;
