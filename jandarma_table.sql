use sys;


create table usak_jandarma(
sira_no int unique,
pbik char(7) unique,
rütbe varchar(20),
isim varchar(20) not null,
maas double
);
select * from usak_jandarma;
drop table usak_jandarma;

insert into usak_jandarma values(1,'2306553', 'Assubay', 'Hasan Sen', '22500.00');
insert into usak_jandarma values(2,'2306564', 'Uzman', 'Mustafa Sagir', '15500.00');
insert into usak_jandarma values(3,'2306575', 'Subay', 'Haluk Bilginer', '16300.00');
insert into usak_jandarma values(4,'2306586', 'Sozlesmeli Er', 'Mehmet Karabacak', '14200.00');
insert into usak_jandarma values(5,'2306597', 'Sivil Memur', 'Erdal Kaynar', '14800.00');
insert into usak_jandarma (isim,sira_no,rütbe,pbik) values('Omer Ak', '6', 'Yarbay', '2401547');
insert into usak_jandarma values(7,'2306599', 'Sivil Memur', 'Erdal Ateş', '14200.00');
insert into usak_jandarma values(8,'2306501', 'Assubay', 'Osman Kara', '14400.00');
insert into usak_jandarma values(10,'2306502', 'Subay', 'Omer Toprak', '10000.00');
insert into usak_jandarma values(9,'2306503', 'Sozlesmeli Er', 'Ali Kara', '11200.00');
insert into usak_jandarma values(12,'2306504', 'Sivil Memur', 'Mehmet Ak', '9000.00');
insert into usak_jandarma values(11,'2306505', 'Sivil Memur', 'Ferdi İnal', '8000.00');

-- Q1 : Maaşi 15000'dan dusuk olan personelin tum bilgilerini getirin.

select *
from usak_jandarma
where maas>15000;


-- Q2 : Maaşi 10000'dan yuksek olan personelin tum bilgilerini getirin.

select *
from usak_jandarma
where maas>10000;

-- Q3 : Rütbesi Sivil Memur olan personelin  isim ve maas bilgilerini listeleyin.

select isim,maas,rütbe
from usak_jandarma
where rütbe='Sivil Memur';

-- Q4: Hasan ve Haluk arasinda olan personelin isimlerini listeleyin.

select isim
from usak_jandarma
where isim
between 'Erdal' and 'Hasan';

-- Q5: sira no 5 ile 10 arasinda olan personelin bilgilerini listeleyin.

select *
from usak_jandarma
where sira_no
between  5 and 10;

-- Q6: pbik  numarasi 2306553, 2306502 ya da 2306505 olan personel isimlerini listeleyin

select sira_no,rütbe,isim
from usak_jandarma
where pbik
in ('2306553','2306502','2306505');

-- Q7: Maasi sadece 10000 veya 15500 olan personelin bilgilerini listele

select *
from usak_jandarma
where maas IN ('10000','15500');


select * from usak_jandarma;

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


-- Q14: Ismi A ile baslayan personeli bütün bilgilerini listeleyiniz


select *
from usak_jandarma
where isim like 'o%';

-- Q8: Isminde Omer olan personelin bütün bilgilerini listeleyiniz

select *
from usak_jandarma
where isim like '%Omer%';

-- Q15: Ismi 'n' ile biten personelin bütün bilgilerini listeleyiniz

select *
from usak_jandarma
where isim like '%n';

-- Q9: Isminin 3. harfi e olan personelin bütün bilgilerini listeleyiniz

select *
from usak_jandarma
where isim like '__e%';

-- Q10: Isminin 2. harfi e olup diger harflerinde k olan personeli bütün bilgilerini listeleyiniz.

select *
from usak_jandarma
where isim like '_a%' and isim like '%n%';

-- Q11: Maasi 5 haneli olan personeli listeleyiniz

select isim,maas
from usak_jandarma
where maas like '____' ;

create table usak_jandarma(
sira_no int unique,
pbik int unique,
rütbe varchar(20),
isim varchar(20) not null,
maas double
);








