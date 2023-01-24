use sys;

CREATE TABLE personel2(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

insert into personel2 values('10001','Ahmet Aslan',7000);
insert into personel2 values('10002','Mehmet Yilmaz',12000);
insert into personel2 values('10003','Meryem',7215);
insert into personel2 values('10004','Veli Han',5000);
insert into personel2 values('10005','Mustafa Ali',5500);
insert into personel2 values('10006','Ayse Can',5600);
insert into personel2 values('10010','Ayse',4700);
insert into personel2 values('10009','Ayse Cemile',4000);
insert into personel2 values('10008','Ayse Cano',4300);
insert into personel2 values('10007','Can Ayse',7700);
insert into personel2 values('10011','Yeliz Alina',12700);

drop table personel2;

SELECT * FROM personel2;


-- ************************ Personel2 Tablosundan *******************************
/*-------------------------------------------------------------------------
Q1: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select isim
from personel2
where isim like '_e%' and isim like '%y%';

/*-------------------------------------------------------------------------
Q2: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel2
where isim not like '%a%';

/*-------------------------------------------------------------------------
Q3: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select*
from personel2
where maas like '_____';

/*-------------------------------------------------------------------------
Q4: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel2
where isim like 'a_____a%';

-- ************************ Fen Lisesi Tablosundan *****************************

CREATE TABLE lise1 (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);
INSERT INTO lise1 VALUES ('1001','Fatih Polat',89,'Ankara','2022-12-05');
INSERT INTO lise1 VALUES ('1002','Efe Torun',85,'Istanbul','2022-12-05');
INSERT INTO lise1 VALUES ('1003','Esra Turker',95,'Izmir','2022-12-05');
INSERT INTO lise1 VALUES ('1004','Mustafa Yilmaz',90,'Istanbul','2022-12-05');
INSERT INTO lise1 VALUES ('1005','Elif Kesen',92,'Berlin','2022-12-05');
INSERT INTO lise1 VALUES ('1006','Tugay Kala',75,null,'2022-12-05');
INSERT INTO lise1 VALUES ('1007','Semra Ulusoy',null,null,null);
INSERT INTO lise1 VALUES ('1008',null,89,'Ankara','2022-12-05');
INSERT INTO lise1 (okul_no,isim,derece,son_degisiklik_tarihi) VALUES ('1009','Mehmet Cil',89,'2022-12-05');
INSERT INTO lise1 (isim,derece,son_degisiklik_tarihi) VALUES ('Salim Oz',89,'2022-12-05');
INSERT INTO lise1 (isim,derece,son_degisiklik_tarihi) VALUES ('Suleyman Karaca',45,'2022-12-05');
INSERT INTO lise1 VALUES ('','Ozgur Ali',90,'Istanbul','2022-12-05');
INSERT INTO lise1 VALUES ('','Yusuf Enes',92,'Berlin','2022-12-05');
 
 select*from lise1;
 

-- Q1 : Okul_no ' su 1005'ten buyuk olan ogrencilerin tum bilgilerini listeleyin.

select *
from lise1
where okul_no>1005;

-- Q2 : Ismi Elif Kesen olan ogrencinin derecesini listeleyin.
select derece
from lise1
where isim ='Elif Kesen';

-- Q3 : Derecesi 90dan buyuk olan ogrencilerin okul_no ve isimlerini listeleyin.

select okul_no,isim
from lise1
where derece>'90';

-- Q4 : Ismi Tugay Kala olan ogrencinin derecesini listeleyin :)

select derece
from lise1
where isim like 'Tugay KALA';

-- Q5 : Istanbulda yasayan ogrencilerin isimlerini listeleyin.

select isim
from lise1
where adres like 'Istanbul';





