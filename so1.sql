
Create table Nhap
(
	SoHDN int primary key,
	MaVT nvarchar(10) not null,
	SoLuongN int not null,
	DonGiaN money not null,
	NgayN datetime not null
)
Create table Xuat
(
	SoHDX int primary key,
	MaVT nvarchar(10) not null,
	SoLuongX int not null,
	DonGiaX money not null,
	NgayX datetime not null

)
Create table Ton
(
	MaVT nvarchar(10) primary key,
	TenVT nvarchar(50) not null,
	SoLuongT int not null,
)
go
alter table Nhap
add
CONSTRAINT fk_ton_nhap Foreign key (MaVT) REFERENCES Ton(MaVT)

alter table Xuat
add
CONSTRAINT fk_ton_xuat Foreign key (MaVT) REFERENCES Ton(MaVT)
go
Insert into Ton Values ('VT01','Bánh Gạo',100),('VT02','Kẹo sữa bò',50),('VT03','Bia SaiGon',100),('VT04','Nước ngọt có gas',200),('VT05','Nước suối',200)
Insert into Nhap Values (101,'VT01',210,50000,'1/6/2022'),(102,'VT02',100,20000,'1/6/2022'),(103,'VT03',80,35000,'2/6/2022')
Insert into Xuat Values (10001,'VT02',50,23000,'5/6/2022'),(10002,'VT01',100,56000,'7/6/2022')
-- câu 2
CREATE VIEW CAU2
AS
select ton.MaVT,TenVT,sum(SoLuongX*DonGiaX) as tienban
from Xuat inner join ton on Xuat.MaVT=ton.MaVT
group by ton.mavt,tenvt
go
SELECT * FROM CAU2

-- câu 3 
CREATE VIEW CAU3
AS
select ton.tenvt, sum(soluongx) as SoLuongT
from xuat inner join ton on xuat.mavt=ton.mavt
group by ton.tenvt

SELECT * FROM CAU3

-- câu 4 
CREATE VIEW CAU4
AS
SELECT ton.TenVT, SUM(SoLuongN) AS SoLuongNhap
FROM Nhap inner join ton on Nhap.MaVT=ton.MaVT
group by ton.TenVT

SELECT * FROM CAU4

-- câu 5 
CREATE VIEW CAU5
AS
select ton.mavt,ton.tenvt,sum(soluongN)-sum(soluongX) +
sum(soluongT) as tongton
from nhap inner join ton on nhap.mavt=ton.mavt
 inner join xuat on ton.mavt=xuat.mavt
group by ton.mavt,ton.tenvt

SELECT * FROM CAU5

-- câu 6 
CREATE VIEW CAU6
AS
select tenvt
from ton
where soluongT = (select max(soluongT) from Ton)

SELECT * FROM CAU6

-- câu 7 
CREATE VIEW CAU7
AS
select ton.mavt,ton.tenvt
from ton inner join xuat on ton.mavt=xuat.mavt
group by ton.mavt,ton.tenvt
having sum(soluongX) >= 100

SELECT * FROM CAU7

--câu 8 
CREATE VIEW CAU8 AS
SELECT MONTH(NgayX) AS "Tháng xuất", YEAR(NgayX) AS "Năm xuất", SUM(SoLuongX) AS Total_Quantity
FROM Xuat
GROUP BY MONTH(NgayX), YEAR(NgayX);

SELECT * FROM CAU8

--câu 9: 
CREATE VIEW CAU9 AS
SELECT t.MaVT, t.TenVT,n.SoLuongN,x.SoLuongX, n.DonGiaN,x.DonGiaX, n.NgayN, x.NgayX
FROM Ton t
INNER JOIN Nhap n ON t.MaVT = n.MaVT
INNER JOIN Xuat x ON t.MaVT = x.MaVT;

SELECT * FROM CAU9

--câu 10: 
CREATE VIEW CAU10 AS
SELECT t.MaVT, t.TenVT, SUM(n.SoLuongN-x.SoLuongX+t.SoLuongT) as "SL còn lại"
FROM Ton t
INNER JOIN Nhap n ON t.MaVT = n.MaVT
INNER JOIN Xuat x ON t.MaVT = x.MaVT
where YEAR(n.NgayN) = 2015 OR YEAR(x.NgayX) = 2015
GROUP BY t.MaVT,t.TenVT;

SELECT * FROM CAU10