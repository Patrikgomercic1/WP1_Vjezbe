select * from smjer;
insert into smjer(naziv, trajanje, cijena, upisnina, verificiran)
values ('Ide Pauza',222,null,null,0);

alter table smjer drop column tip;

delete from smjer where naziv like'%Novi smjer%';