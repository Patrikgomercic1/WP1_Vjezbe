use master;
drop database if exists taksi_sluzba;
go
create database taksi_sluzba;
go
use taksi_sluzba;


create table vozilo(
	sifra int not null primary key identity(1,1),
	oznaka varchar(20),
	marka varchar(30)
);

create table vozac(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kontakt int,
	vozilo int
);

create table putnik(
	sifra int not null primary key identity(1,1),
	lokacija varchar(50),
	kontakt varchar(20),
);

create table voznja(
	sifra int not null primary key identity(1,1),
	trajanje datetime,
	cijena decimal(8,2),
	vozac int
);

create table voznja_putnik(
	voznja int,
	putnik int
);


alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table voznja_putnik add foreign key (voznja) references voznja(sifra);
alter table voznja_putnik add foreign key (putnik) references putnik(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);