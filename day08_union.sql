use sys;

-- ====================== UNION ======================
/*
    Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini 
    birlestirerek tek bir sonuc kumesi olusturur.
    2.sorgunun sonuna ORDER BY komutunu kullanirsaniz 
    tum tabloyu istediginiz siralamaya gore siralar.
   
    NOT: Secilen Field SAYISI ve DATA TYPEâ€™i ayni olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. 
    Benzer verileri almak iÃ§in UNION ALL kullanilir.
======================================================*/
CREATE TABLE personel10(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
insert into personel10 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
insert into personel10 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
insert into personel10 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
insert into personel10 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
insert into personel10 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
insert into personel10 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
insert into personel10 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
insert into personel10 VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');

select*from personel10;

-- 1) Honda ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin

select isim
from personel10
where sirket='Honda'
UNION
select isim
from personel10
where sirket='Tofas';

-- 2) Honda, Ford ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin

select isim
from personel10
where sirket='Honda'
UNION
select isim
from personel10
where sirket='Tofas'
UNION
select isim
from personel10
where sirket='Ford';

-- 3) Honda, Ford ve Tofas'ta calisan butun personelleri listeleyin

select isim
from personel10
where sirket='Honda'
UNION ALL
select isim
from personel10
where sirket='Tofas'
UNION ALL
select isim
from personel10
where sirket='Ford';

-- 4) Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri gosteren sorguyu yaziniz

select isim,maas
from personel10
where maas>4000

UNION
select sehir,maas
from personel10
where maas>5000;

-- 5) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini bir tabloda gosteren sorgu yaziniz

select maas
from personel10
where isim='Mehmet Ozturk'
UNION
select maas
from personel10
where sehir='Istanbul';

-- 6) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini en yuksekten dusuge dogru siralayarak bir
-- tabloda gosteren sorguyu yaziniz.

select maas, isim AS isim_sehir
from personel10
where isim='Mehmet Ozturk'
UNION
select maas,sehir
from personel10
where sehir='Istanbul'
order by maas DESC;

-- 7) Sehirlerde odenen ucreti 3000'den fazla olan sehirleri ve personelden
-- ucreti 5000'den az olanlarin isimleri bir tabloda gosteren sorguyu yaziniz

select sehir AS sehir_ve_isci ,maas
from personel10
where maas>3000
UNION

select isim,maas
from personel10
where maas<5000;

-- 8) 5000'den az maas alanlarin, arti Honda calisani olmayanlarin bilgilerini
-- listeleyen bir sorgu yaziniz.

select *
from personel10
where maas<5000
UNION
select*
from personel10
where sirket !='Honda';

-- 9) Ismi Mehmet Ozturk olanlari ve ek olarak Istanbul'da calismayanlarin isimlerini ve
-- sehirlerini listeleyen sorguyu yaziniz.

select isim,sehir
from personel10
where isim ='Mehmet Ozturk'
UNION
select isim, sehir
from personel10
where sehir<>'Istanbul'; -- != anlamini tasiyor <>

