-- Câu 1.

--a. Tạo login và user cho các nhân viên:

-- Tạo login cho admin
CREATE LOGIN admin WITH PASSWORD = 'pqh1207';
GO
-- Tạo user cho admin
USE AdventureWorks2008R2;
CREATE USER admin FOR LOGIN admin;
GO

-- Tạo login cho trưởng nhóm TN
CREATE LOGIN TN WITH PASSWORD = 'pqh1207';
GO

-- Tạo user cho trưởng nhóm TN
USE AdventureWorks2008R2;
CREATE USER TN FOR LOGIN TN;
GO

-- Tạo login cho nhân viên NV
CREATE LOGIN NV WITH PASSWORD = 'pqh1207';
GO


-- Tạo user cho nhân viên NV
USE AdventureWorks2008R2;
CREATE USER NV FOR LOGIN NV;
GO

-- Tạo login cho nhân viên QL
CREATE LOGIN QL WITH PASSWORD = 'pqh1207';
GO

-- Tạo user cho nhân viên QL
USE AdventureWorks2008R2;
CREATE USER QL FOR LOGIN QL;
GO

--b. Phân quyền cho các nhân viên:

-- Phân quyền cho trưởng nhóm TN
USE AdventureWorks2008R2;
GRANT SELECT, UPDATE ON Production.ProductInventory TO TN;
GO

-- Phân quyền cho nhân viên NV
USE AdventureWorks2008R2;
GRANT SELECT, DELETE ON Production.ProductInventory TO NV;
GO

-- Phân quyền cho nhân viên QL
USE AdventureWorks2008R2;
GRANT SELECT ON Production.ProductInventory TO QL;
GO

-- Admin phải có quyền CONTROL trên tất cả các đối tượng trong cơ sở dữ liệu
USE AdventureWorks2008R2;
GRANT CONTROL TO [Admin];
GO

--d. Ai có thể sửa được dữ liệu bảng Production.Product ?

--Chỉ có trưởng nhóm TN và nhân viên QL có thể sửa được dữ liệu bảng Production.Product, vì họ được phân quyền SELECT và UPDATE trên bảng này.

--e. Thu hồi quyền cấp cho nhân viên NV:

-- Thu hồi quyền của nhân viên NV
USE AdventureWorks2008R2;
REVOKE SELECT, DELETE ON Production.ProductInventory FROM NV;
GO

-- Xóa user của nhân viên NV
USE AdventureWorks2008R2;
DROP USER NV;
GO

-- Câu 2
--Để phục hồi database khi có sự cố ở thời điểm T8, ta thực hiện các bước sau:

--1. Restore full backup (T1) dùng lệnh 
RESTORE DATABASE AdventureWorks2008R2 FROM DISK = 'path_to_full_backup' WITH NORECOVERY;

--2. Apply differential backup 2 (T5) dùng lệnh 
RESTORE DATABASE AdventureWorks2008R2 FROM DISK = 'path_to_diff_backup_2' WITH NORECOVERY;

--3. Apply log backup (T7) dùng lệnh 
RESTORE LOG AdventureWorks2008R2 FROM DISK = 'path_to_log_backup' WITH NORECOVERY;

--4. Kiểm tra xem DB phục hồi có ở trạng thái T7 không (Tới trạng thái trước khi xóa DB) 

--Nếu muốn phục hồi đến thời điểm T7, ta sử dụng lệnh STOPAT 'T7' trong lệnh RESTORE LOG.
--Nếu muốn phục hồi đến thời điểm T9, ta sử dụng lệnh RECOVERY thay vì WITH NORECOVERY ở bước 3.

---Lưu ý: Để phục hồi database cần nắm rõ backup strategy và backup schedule được thực hiện.