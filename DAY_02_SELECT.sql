/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.

-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;

-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/

use sys;

CREATE TABLE meslek_lisesi (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);

select * from meslek_lisesi;
insert into meslek_lisesi values('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
insert into meslek_lisesi values('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
insert into meslek_lisesi values('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
insert into meslek_lisesi values('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
insert into meslek_lisesi values('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
insert into meslek_lisesi values('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
insert into meslek_lisesi values('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
insert into meslek_lisesi values('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
insert into meslek_lisesi values('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');


-- Q1 : Derecesi 90'dan yuksek olan ogrencilerin tum bilgilerini getirin.

select *
from meslek_lisesi
where derece>90;

select*from meslek_lisesi;


-- Q2 : Derecesi 80'den kucuk olan ogrencilerin isimlerini listeleyin.

select isim
from meslek_lisesi
where derece<80;

-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.

select isim,derece  -- fieald yani sutun bilgileri
from meslek_lisesi -- hangi fieald adindan
where adres= 'Ankara'; -- neyi getirelim sorusuna cvp aldik..

-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin.

select isim, adres
from meslek_lisesi
where okul_no= '1005';

-- Q5 : Derecesi 70 ile 80 arasinda olan ogrencilerin okul_no ve adreslerini listeleyin.
select okul_no,adres
from meslek_lisesi
where derece>70 and derece<80;

-- *****************************************************************************

CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);
insert into ogretmen_lisesi values (111, 'Emine Yucel', 'Ankara', 75);
insert into ogretmen_lisesi values (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
insert into ogretmen_lisesi values (113, 'Ilhan Sahin', 'Ankara', 70);
insert into ogretmen_lisesi values (114, 'Kadir Corumlu', 'Corum', 90);
insert into ogretmen_lisesi values (115, 'Selman Kasabali', 'Ankara',70);
insert into ogretmen_lisesi values (116, 'Murat Aycicek', 'Izmir', 85);
insert into ogretmen_lisesi values (117, 'Tugba Ozsoy', 'Bolu', 85);
SELECT * FROM ogretmen_lisesi;
/*-------------------------------------------------------------------------*/

-- Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.

select * 
from ogretmen_lisesi
where sinav_notu>80;

-- Q2: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listeleyin.

select isim,adres
from ogretmen_lisesi
where adres='Ankara';

-- Q3: id'si 114 olan ogrencilerin tum bilgilerini listeleyin.

select *
from ogretmen_lisesi
where id=114;

/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
=========================================================================================*/
/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50  sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/

-- Q4: Sinav notu 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.

-- birinci yol
select *
from ogretmen_lisesi
where sinav_notu>=70 AND sinav_notu<=80;

-- ikinci yol
select *
from ogretmen_lisesi
where sinav_notu
between 70 and 80;

-- Q5: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.

select isim
from ogretmen_lisesi
where isim
between 'Muhammet Talha' and 'Murat';

-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.

-- Q6: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.

select isim,adres
from ogretmen_lisesi
where adres
between 'Ankara' and 'Corum';

-- **************************************************************
CREATE TABLE personel1(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

insert into personel1 values('10001','Ahmet Aslan',7000);
insert into personel1 values('10002','Mehmet Yilmaz',12000);
insert into personel1 values('10003','Meryem',7215);
insert into personel1 values('10004','Veli Han',5000);
insert into personel1 values('10005','Mustafa Ali',5500);
insert into personel1 values('10006','Ayse Can',5600);
insert into personel1 values('10010','Ayse',4700);
insert into personel1 values('10009','Ayse Cemile',4000);
insert into personel1 values('10008','Ayse Cano',4300);
insert into personel1 values('10007','Can Ayse',7700);
insert into personel1 values('10011','Yeliz Alina',12700);

drop table personel;

SELECT * FROM personel1;

-- Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele

select *
from personel1
where id
between '10005' and '10009';

/*-------------------------------------------------------------------------
Q8: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';
/*-------------------------------------------------------------------------
Q9: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Cano';

-- Q10: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
use sys;
SELECT id
FROM personel1
WHERE maas=700 or isim='Ayse';

/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
SELECT isim,id
FROM personel1
WHERE id = '10001' OR id = '10005' OR id = '10008';

/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/
/*-------------------------------------------------------------------------
Q12: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

SELECT isim
FROM personel1
WHERE id 
IN ('10001','10005','10008');

-- Q13: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele

SELECT isim
FROM personel1
WHERE maas IN ('7000','12000');

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
/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE 'a%';

/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '%ayse%';

/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '%n';

/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '_e%';

/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '_e%' AND isim LIKE '%y%';

/*-------------------------------------------------------------------------
Q19: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim NOT LIKE '%a%';

/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE maas LIKE '_____';

/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT id,isim,maas
FROM personel1
WHERE isim LIKE 'a_____a%';

select * 
from personel1
where id=10002;


-- ************************ Personel Tablosundan *******************************
/*-------------------------------------------------------------------------
Q1: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel1
where isim LIKE '_e%' and isim LIKE '%y%';

SELECT * FROM personel1;

/*-------------------------------------------------------------------------
Q2: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel1
where isim not LIKE '%a%';


/*-------------------------------------------------------------------------
Q3: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel1
where maas like  '_____';


/*-------------------------------------------------------------------------
Q4: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel1
WHERE isim LIKE 'a_____a%';

