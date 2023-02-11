use sys;

CREATE TABLE isciler40
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler40 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler40 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler40 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler40 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler40 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler40 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler40 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
select*from isciler40;
drop table isiler40;

/*======================== HAVING CLAUSE =======================
    HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan 
FILTRELEME komutudur.
    Aggregate fonksiyonlar ile ilgili bir kosul koymak 
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.    
===============================================================*/

-- 1) Sirketlere gore isci_sayisini 1'den buyukse yazdiriniz

select sirket,count(isim) isci_sayisi
from isciler40
group by sirket
having isci_sayisi>1;

-- 2 Toplam geliri 8000 liradan fazla olan isimleri gosteren sorgu yaziniz
select isim ,sum(maas)toplam_maas
from isciler40
group by isim
having toplam_maas>8000;


-- 3) Her sirketin MIN maaslari eger 4000'den buyukse goster


-- Yeni create ettigimiz bir field uzerinden filtreleme yaptigimiz icin
-- WHERE cumlecigini kullanamayiz, WHERE cumlecigi sadece tablomuzda var olan
-- field'lar icin bir filtreleme yapar.

select sirket, min(maas)min_maas
from isciler40
group by sirket
having min_maas>4000;

-- 4) Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini 
-- ve MAX maasi veren sorgu yaziniz

select sehir,max(maas)max_maas
from isciler40
group by sehir
having max_maas<5000;

-- 4) Eger bir sehirde alinan MAX maas 5000'den buyuk sehir ismini 
-- ve MAX maasi veren sorgu yaziniz

select sehir,isim,max(maas)max_maas
from isciler40
group by sehir,isim
having max_maas>5000
order by sehir;

/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.
>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken ikincisi kac kayit getirecegimizi belirtir. Baslangic 
noktasi dahil edilmez!
===============================================================*/

-- 1) Isciler tablosundan ilk 5 kaydi getiriniz
select*
from isciler
limit 5;

-- 2) Isim sirali tablodan ilk 3 kaydi listeleyin

select*
from isciler40
order by isim
limit 3;

-- 3) Maas sirali tablodan 4. kayittan 6. kayda kadar olan
-- kayitlarin isim ve sehir bilgilerini listeleyin.

select isim,sehir,maas
from isciler40
order by maas
limit 3,3;

-- 4) Maasi en yuksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.

select*
from isciler40
order by maas desc
limit 3;

-- 5) Maasi en dusuk 3 kisinin sadece isimlerini listeleyen sorguyu yaziniz.

select isim
from isciler40
order by maas 
limit 3;

-- 6) Maasi en dusuk 3 kisinin sadece isim sirali listeleyen sorguyu yaziniz.

select isim,sehir
from isciler40
order by maas,isim
limit 3;

-- 7) Maasi en dusuk 3 kisinin sadece isim sehir sirali listeleyen sorguyu yaziniz.

select*
from isciler40
order by maas,isim,sehir
limit 3;

-- 8) Maas'i 4000'den buyuk olan 3 kisinin sehrini siralayiniz.

select sehir,isim
from isciler40
where maas>4000
limit 3;

-- 9) Maas'i 4000'den buyuk olan 3 kisinin maas sirali siralayiniz.

select sehir,isim
from isciler40
where maas>4000
order by maas
limit 3;

/*============================ DISTINCT ===========================
    DISTINCT cumlecigi bir Sorgu ifadesinde benzer olan kayitlari
    filtrelemek icin kullanilir. Dolayisiyla secilen sutun veya 
    sutunlar icin benzersiz veri iceren satirlar olusturmaya yarar.
    
    Syntax :
    --------
    SELECT DISTINCT field_name1, field_name2,...
    FROM table_name
    
===============================================================*/

-- 1) Iscilerin yasadigi sehirleri listeleyin
select distinct sehir,isim
from isciler40;


-- Group By'da bir fielda gore gruplama yapip, Aggregate Function'lar
-- yardimiyla baska bir field'da islem yapip bize islem yaptigi field'i
-- yeni bir field olarak donduruyor.DISTINCT cumlecigi bir Sorgu ifadesinde
-- benzer olan kayitlari filtrelemek icin kullanilir. DISTINCT komutu bize
-- bir field'daki kayitlarin tek bir ornegini dondurur.

select*from manav1;

CREATE TABLE manav1 (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav1 VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav1 VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav1 VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav1 VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav1 VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav1 VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav1 VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav1 VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav1 VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav1 VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav1 VALUES( 'Ali', null, 2);
INSERT INTO manav1 VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav1 VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav1 VALUES( 'Ayse', null, 3);

-- 2) Manav tablosundan satilan farkli meyve turlerini listeleyen bir query yaziniz.

select distinct urun_adi
from manav1;

-- 3) Satilan farkli meyve turlerini NULL olmayanlari listeleyen
-- bir query yaziniz

select distinct urun_adi
from manav1
where urun_adi is not null;


-- 4) Satilan farkli meyve turlerini NULL olmayanlari isim sirali
--  listeleyen bir query yaziniz
select urun_adi
from manav1
where urun_adi is not null
order by urun_adi;


-- 5) Kac cesit  meyve sayisini sayisini listeleyen bir query yaziniz

select count(distinct urun_adi) urun_sayisi
from manav1;

-- 6) Satilan meyve ve satin alan kisi isimlerinden farkli olan ikilileri
-- listeleyen query yaziniz

select distinct isim,urun_adi
from manav1;



