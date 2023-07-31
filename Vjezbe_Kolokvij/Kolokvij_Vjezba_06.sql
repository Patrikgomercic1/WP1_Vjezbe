﻿use master;
drop database if exists Kolokvij_vjezba_6;
go
create database Kolokvij_vjezba_6;
go
use Kolokvij_vjezba_6;



-- 0 -- 
create table punac(
	sifra int not null primary key identity(1,1),
	ekstrovertno bit not null,
	suknja varchar(30) not null,
	majica varchar(44) not null,
	prviputa datetime not null
);

create table svekrva(
	sifra int not null primary key identity(1,1),
	hlace varchar(48) not null,
	suknja varchar(42) not null,
	ogrlica int not null,
	treciputa datetime not null,
	dukserica varchar(32) not null,
	narukvica int not null,
	punac int
);

create table ostavljena(
	sifra int not null primary key identity(1,1),
	prviputa datetime not null,
	kratkamajica varchar(39) not null,
	drugiputa datetime,
	maraka decimal(14,10)
);

create table prijatelj(
	sifra int not null primary key identity(1,1),
	haljina varchar(35),
	prstena int not null,
	introvertno bit,
	stilfrizura varchar(36) not null
);

create table prijatelj_ostavljena(
	sifra int not null primary key identity(1,1),
	prijatelj int not null,
	ostavljena int not null
);

create table brat(
	sifra int not null primary key identity(1,1),
	nausnica int not null,
	treciputa datetime not null,
	narukvica int not null,
	hlace varchar(31),
	prijatelj int
);

create table zena(
	sifra int not null primary key identity(1,1),
	novcica decimal(14,8) not null,
	narukvica int not null,
	dukserica varchar(40) not null,
	haljina varchar(30),
	hlace varchar(32),
	brat int not null
);

create table decko(
	sifra int not null primary key identity(1,1),
	prviputa datetime,
	modelnaocala varchar(41),
	nausnica int,
	zena int not null
);

alter table svekrva add foreign key(punac) references punac(sifra);
alter table decko add foreign key(zena) references zena(sifra);
alter table zena add foreign key(brat) references brat(sifra);
alter table brat add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key(ostavljena) references ostavljena(sifra);

-- 1 --
insert into zena(novcica, narukvica, dukserica, brat)
values  
	(10.91, 3, 'Plava', 1),
	(20.92, 8, 'Zuta', 2),
	(30.93, 1, 'Crvena', 3);  
    
insert into brat(nausnica, treciputa, narukvica)
values  
	(1, '2020-11-12', 2),
    (2, '2019-12-11', 1),
    (3, '2018-01-13', 3);      
                  
insert into prijatelj_ostavljena(prijatelj, ostavljena)
values  
	(1, 3),
	(2, 2),
	(3, 1);

-- 2 --
update svekrva set suknja = 'Osijek';

-- 3 --
delete from decko where modelnaocala < 'AB';

-- 4 --
select narukvica from brat where treciputa is null;

-- 5 -- 
select a.drugiputa , f.zena , e.narukvica 
from ostavljena a
inner join prijatelj_ostavljena b on a.sifra      = b.ostavljena 
inner join prijatelj            c on b.prijatelj  = c.sifra
inner join brat                 d on c.sifra      = d.prijatelj 
inner join zena                 e on d.sifra      = e.brat
inner join decko                f on e.sifra      = f.zena
where d.treciputa is not null and c.prstena = 219
order by e.narukvica desc;

-- 6 --
select	a.prstena , a.introvertno
from	prijatelj a left join prijatelj_ostavljena b on a.sifra = b.prijatelj 
where	b.prijatelj is null; 