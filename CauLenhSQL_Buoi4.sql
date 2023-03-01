--CÂU 1
    SELECT * FROM NHANVIEN
    GO

--CÂU 2
    SELECT * FROM NHANVIEN
    WHERE PHG = '5'
--CÂU 3
    select HONV+ ' ' +TENLOT+ ' ' +TENNV 
    as 'Họ và tên', PHG 
    from NHANVIEN 
    where LUONG > 6000000
--CÂU 4 
    select * from NHANVIEN 
    where LUONG > 650000 and PHG = 1 or LUONG > 5000000 and PHG = 4
--CÂU 5
    select HONV+ ' ' +TENLOT+ ' ' +TENNV 
    as 'Họ và tên' from NHANVIEN 
    where DCHI 
    like '%TP Quảng Ngãi'
--CÂU 6
    select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên' from NHANVIEN  
    where HONV like 'N%'
--CÂU 7
    select NGSINH, DCHI from NHANVIEN 
    where HONV like 'Cao' and TENLOT like 'Thanh' and TENNV like 'Huyền'
--CÂU 8
    select * from NHANVIEN 
    where YEAR(NGSINH) between 1955 AND 1975
--CÂU 9
    select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', YEAR(NGSINH) as 'Năm sinh' from NHANVIEN
--CÂU 10
    select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', (2023 - YEAR(NGSINH)) as 'Tuổi' from NHANVIEN
--CÂU 11
    select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên Trưởng Phòng' from PHONGBAN,NHANVIEN
    where PHONGBAN.TRPHG = NHANVIEN.MANV
--CÂU 12
    select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', DCHI from NHANVIEN inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
    where PHONGBAN.MAPHG = 4
--CÂU 13
    select TENDEAN, TENPHG, HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', NG_NHANCHUC 
    from NHANVIEN inner join PHONGBAN 
    ON NHANVIEN.PHG = PHONGBAN.MAPHG 
    inner join DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
    where PHONGBAN.TRPHG = NHANVIEN.MANV and DCHI like '%Tp Quảng Ngãi'
--CÂU 14
    select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', TENTN as 'Tên người thân' 
    from NHANVIEN inner join THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
    where NHANVIEN.PHAI = N'Nữ'
--CÂU 15
    select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as 'Họ và tên nhân viên', QL.HONV+ ' ' + QL.TENLOT + ' ' + QL.TENNV as 'Họ và tên quản lí'
    from NHANVIEN NV,NHANVIEN QL
    where NV.MA_NQL = QL.MANV
--CÂU 16
    select HONV+ ' ' + TENLOT + ' ' + TENNV as 'Họ và tên' 
    from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
    where DEAN.TENDEAN = 'Xây dựng nhà máy chế biến thủy sản'
--CÂU 17
    select TENDEAN as 'Tên đề án'
    from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
    where NHANVIEN.HONV = N'Trần' and NHANVIEN.TENLOT = N'Thanh' and NHANVIEN.TENNV = N'Tâm'