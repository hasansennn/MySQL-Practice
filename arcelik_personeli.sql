use sys;

create table arcelik_personeli(
id_personel_no varchar(10) unique,
isim_soyisim varchar(30),
maas double,
adres varchar(50),
ise_giris_tarihi date
);

drop table arcelik_personeli;
select * from arcelik_personeli;

insert into arcelik_calisanlari values('1234','Hasan AK','4500', 'Çubuk-ANKARA','2021-10-12');
insert into arcelik_calisanlari values('1235','Hakan BAL','5000', 'Bayat-ÇORUM','2020-05-18');
insert into arcelik_calisanlari values('1236','Omer KAR','6000', 'Talas-DENİZLİ','2020-01-10');
insert into arcelik_calisanlari values('1237','Ali BAL','5900', 'Manisa-MERKEZ','2020-10-19');
insert into arcelik_calisanlari values('1238','Hakkı ERMEZ','3500', 'Eruh-SİİRT','2022-12-01');
insert into arcelik_calisanlari values('1239','Osman KARA','7000', 'Çal-DENİZLİ','2021-05-12');
insert into arcelik_calisanlari values('1240','Veli BAKAR','6500', 'Torbalı-İZMİR','2020-09-29');
insert into arcelik_calisanlari values('1241','Ahmet COSAR','7250', 'Mamak-ANKARA','2022-10-25');

select *
from arcelik_personeli
where maas
in ('7250','3500','5000');

/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
select *
from arcelik_calisanlari
where adres  like  '%A';

select * from arcelik_personeli;
-- alter 
update
-- delete
create
comment
truncate
rename

alter table arcelik_calisanlari RENAME arcelik_personeli;

/*
// Sadece bir alan eklemek için
ALTER TABLE ogrenciler ADD sinif INT(2); 
 
//Birden fazla alan eklemek için
ALTER TABLE ogrenciler ADD (sinif INT(2), fakulte VARCHAR(50), kayit_tarihi DATE);
*/
alter table arcelik_personeli ADD sira_no varchar(4);

alter table arcelik_personeli DROP COLUMN sira_no;



-- update güncelleme yaparak maasi 4250 yaptik

update arcelik_personeli
set maas=4250
where id_personel_no='1234';





