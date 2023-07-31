﻿﻿use master;
drop database if exists Kolokvij_vjezba_19;
go
create database Kolokvij_vjezba_19;
go
use Kolokvij_vjezba_19;



-- 0 --
create table decko(
	sifra int not null primary key identity(1,1),
	modelnaocala varchar(42) not null,
	gustoca decimal(16,10) not null,
	dukserica varchar(47) not null,
	stilfrizura varchar(40),
	novcica decimal(14,7) not null
);

create table svekar(
	sifra int not null primary key identity(1,1),
	nausnica int not null,
	indiferentno bit not null,
	suknja varchar(37) not null,
	drugiputa datetime,
	kuna decimal(13,6) not null,
	decko int
);

create table ostavljena(
	sifra int not null primary key identity(1,1),
	hlace varchar(41),
	ekstrovertno bit not null,
	narukvica int,
	eura decimal(17,6) not null,
	kratkamajica varchar(46)
);

create table punica(
	sifra int not null primary key identity(1,1),
	stilfrizura varchar(39) not null,
	maraka decimal(15,6) not null,
	jmbag char(11) not null
);

create table punica_ostavljena(
	sifra int not null primary key identity(1,1),
	punica int not null,
	ostavljena int not null
);

create table punac(
	sifra int not null primary key identity(1,1),
	maraka decimal(12,7),
	treciputa datetime,
	ekstrovertno bit,
	hlace varchar(32),
	punica int not null
);

create table svekrva(
	sifra int not null primary key identity(1,1),
	ekstrovertno bit,
	carape varchar(42),
	gustoca decimal(13,10) not null,
	stilfrizura varchar(34) not null,
	punac int not null
);

create table muskarac(
	sifra int not null primary key identity(1,1),
	drugiputa datetime not null,
	gustoca decimal(16,7),
	maraka decimal(16,9),
	ogrlica int not null,
	svekrva int
);

alter table svekar add foreign key(decko) references decko(sifra);
alter table muskarac add foreign key(svekrva) references svekrva(sifra);
alter table svekrva add foreign key(punac) references punac(sifra);
alter table punac add foreign key(punica) references punica(sifra);
alter table punica_ostavljena add foreign key(punica) references punica(sifra);
alter table punica_ostavljena add foreign key(ostavljena) references ostavljena(sifra);

-- 1 --
insert into svekrva(gustoca, stilfrizura, punac)
values  
	(11.11, '2011-01-22', 1),
	(22.22, '2012-03-13', 3),
	(33.33, '2013-02-11', 2);

insert into punac(punica)
values  
	(2),
	(3),
	(1);

insert into punica_ostavljena(punica, ostavljena)
values  
	(1, 3),
	(2, 2),
	(3, 1);

-- 2 --
update svekar set indiferentno = 0;

-- 3 --
delete from muskarac where  gustoca = 14.92;

-- 4 --
select ekstrovertno from punac where treciputa is null;

-- 5 --
select a.narukvica , f.ogrlica , e.carape 
from ostavljena a
inner join punica_ostavljena     b on a.sifra      = b.ostavljena 
inner join punica                c on b.punica     = c.sifra
inner join punac                 d on c.sifra      = d.punica 
inner join svekrva               e on d.sifra      = e.punac
inner join muskarac              f on e.sifra      = f.svekrva
where d.treciputa is null and c.maraka != 21
order by e.carape desc;

-- 6 --
select	a.maraka , a.jmbag
from	punica a left join punica_ostavljena b on b.punica = a.sifra
where	b.punica is null;