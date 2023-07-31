﻿use master;
drop database if exists Kolokvij_vjezba_14;
go
create database Kolokvij_vjezba_14;
go
use Kolokvij_vjezba_14;



-- 0 --
create table mladic(
	sifra int not null primary key identity(1,1),
	drugiputa datetime not null,
	narukvica int,
	bojaociju varchar(49) not null,
	modelnaocala varchar(41)
);

create table prijatelj(
	sifra int not null primary key identity(1,1),
	stilfrizura varchar(39),
	kratkamajica varchar(32),
	treciputa datetime,
	modelnaocala varchar(32) not null,
	prviputa datetime,
	mladic int not null
);

create table muskarac(
	sifra int not null primary key identity(1,1),
	carape varchar(36),
	ogrlica int not null,
	vesta varchar(44) not null,
	ekstrovertno bit
);

create table neprijatelj(
	sifra int not null primary key identity(1,1),
	prstena int not null,
	gustoca decimal(17,7),
	bojakose varchar(48) not null,
	ogrlica int not null,
	stilfrizura varchar(47) not null
);

create table neprijatelj_muskrac(
	sifra int not null primary key identity(1,1),
	neprijatelj int not null,
	muskarac int not null
);

create table brat(
	sifra int not null primary key identity(1,1),
	eura decimal(15,10) not null,
	gustoca decimal(14,5) not null,
	kuna decimal(15,6),
	haljina varchar(38) not null,
	bojakose varchar(39),
	prstena int,
	neprijatelj int not null
);

create table ostavljen(
	sifra int not null primary key identity(1,1),
	majica varchar(39),
	drugiputa datetime not null,
	asocijalno bit not null,
	brat int not null
);

create table ostavljena(
	sifra int not null primary key identity(1,1),
	kuna decimal(17,7),
	hlace varchar(45),
	suknja varchar(36),
	dukserica varchar(36),
	kratkamajica varchar(47) not null,
	gustoca decimal(12,10) not null,
	ostavljen int
);

alter table prijatelj add foreign key(mladic) references mladic(sifra);
alter table ostavljena add foreign key(ostavljen) references ostavljen(sifra);
alter table ostavljen add foreign key(brat) references brat(sifra);
alter table brat add foreign key(neprijatelj) references neprijatelj(sifra);
alter table neprijatelj_muskrac add foreign key(neprijatelj) references neprijatelj(sifra);
alter table neprijatelj_muskrac add foreign key(muskarac) references muskarac(sifra);

-- 1 --
insert into ostavljen(drugiputa, asocijalno, brat)
values 
	('2019-04-07', 0, 3),
	('2019-03-14', 0, 2),
	('2019-05-13', 0, 1);

insert into brat(eura, gustoca, haljina, neprijatelj)
values 
	(11.11, 44.44, 'Plava', 3),
	(22.22, 55.55, 'Zuta', 2),
	(33.33, 66.66, 'Crna', 1);

insert into neprijatelj_muskrac(neprijatelj, muskarac)
values
	(1, 3),
	(2, 3),
	(3, 1);

-- 2 --
update prijatelj set kratkamajica = 'Osijek';

-- 3 --
delete from ostavljena where hlace > 'AB';

-- 4 --
select kuna from brat where gustoca not in(6,10,16,25,36);

-- 5 --
select a.vesta , f.dukserica , e.drugiputa 
from muskarac a 
inner join neprijatelj_muskrac	b on a.sifra		=b.muskarac 
inner join neprijatelj			c on b.neprijatelj  =c.sifra 
inner join brat					d on c.sifra		=d.neprijatelj 
inner join ostavljen			e on d.sifra		=e.brat 
inner join ostavljena			f on e.sifra		=f.sifra
where d.gustoca >100 and c.gustoca != 22
order by e.drugiputa desc;

-- 6 --
select	a.gustoca , a.bojakose
from	neprijatelj a left join neprijatelj_muskrac b on b.neprijatelj=a.sifra 
where	b.neprijatelj = null;