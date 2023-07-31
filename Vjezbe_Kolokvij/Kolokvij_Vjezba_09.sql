﻿use master;
drop database if exists Kolokvij_vjezba_9;
go
create database Kolokvij_vjezba_9;
go
use Kolokvij_vjezba_9;




-- 0 --
create table ostavljena(
	sifra int not null primary key identity(1,1),
	modelnaocala varchar(34) not null,
	suknja varchar(32),
	eura decimal(18,7) not null,
	lipa decimal(15,7) not null,
	treciputa datetime not null,
	drugiputa datetime not null
);

create table snasa(
	sifra int not null primary key identity(1,1),
	prstena int,
	drugiputa datetime not null,
	haljina varchar(38) not null,
	ostavljena int
);

create table prijateljica(
	sifra int not null primary key identity(1,1),
	treciputa datetime,
	novcica decimal(16,7),
	kuna decimal(14,10) not null,
	drugiputa datetime,
	haljina varchar(45),
	kratkamajica varchar(49)
);

create table punac(
	sifra int not null primary key identity(1,1),
	narukvica int not null,
	modelnaocala varchar(30),
	kuna decimal(12,8),
	bojaociju varchar(33),
	suknja varchar(45)
);

create table punac_prijateljica(
	sifra int not null primary key identity(1,1),
	punac int not null,
	prijateljica int not null
);

create table cura(
	sifra int not null primary key identity(1,1),
	vesta varchar(49) not null,
	ekstrovertno bit,
	carape varchar(37),
	suknja varchar(37) not null,
	punac int not null
);

create table brat(
	sifra int not null primary key identity(1,1),
	novcica decimal(18,9) not null,
	ekstrovertno bit,
	vesta varchar(32) not null,
	cura int 
);

create table zarucnik(
	sifra int not null primary key identity(1,1),
	gustoca decimal(17,6),
	haljina varchar(40),
	kratkamajica varchar(48) not null,
	nausnica int not null,
	brat int not null
);

alter table snasa add foreign key(ostavljena) references ostavljena(sifra);
alter table zarucnik add foreign key(brat) references brat(sifra);
alter table brat add foreign key(cura) references cura(sifra);
alter table cura add foreign key(punac) references punac(sifra);
alter table punac_prijateljica add foreign key(punac) references punac(sifra);
alter table punac_prijateljica add foreign key(prijateljica) references prijateljica(sifra);

-- 1 --
insert into brat(novcica, vesta, cura)
values  
	(99.99, 'Zuta', 1),
	(88.88, 'Crvena', 2),
	(77.77, 'Crna', 3);

insert into cura(vesta, suknja, punac)
values  
	('Zuta', 'Crna', 1),
	('Crna', 'Zuta', 2),
	('Crvena',' Crvena', 3);
                 
insert into punac_prijateljica (punac, prijateljica)
values  
	(1, 3),
	(2, 2),
	(3, 1);

-- 2 --
update snasa set drugiputa = '2020-04-24';

-- 3 --
delete from zarucnik where haljina='AB';

-- 4 --
select carape from cura where ekstrovertno is null;

-- 5 --
select a.kuna , f.nausnica , e.ekstrovertno 
from prijateljica a
inner join punac_prijateljica   b on a.sifra      = b.prijateljica 
inner join punac                c on b.punac      = c.sifra
inner join cura                 d on c.sifra      = d.punac
inner join brat                 e on d.sifra      = e.cura
inner join zarucnik             f on e.sifra      = f.brat
where d.ekstrovertno is not null and c.modelnaocala like '%ba%'
order by e.ekstrovertno;

-- 6 --
select	a.modelnaocala , a.kuna 
from	punac a left join punac_prijateljica b on b.punac = a.sifra 
where	b.punac is null; 