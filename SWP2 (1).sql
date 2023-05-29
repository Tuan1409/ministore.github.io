








USE master
DROP DATABASE IF EXISTS SWPProject2
GO


CREATE DATABASE SWPProject2
GO
USE SWPProject2
GO

---------------------------------------------------------------------------- Create table for all attribute --------------------------------------------------------------------------------------------------------- 
   
 --Create table Account
CREATE TABLE Employee (
	EmployeeID				 INT		            IDENTITY(1, 1)		 PRIMARY KEY,
	EmployeeName		     NVARCHAR(50)							     NOT NULL,
	EmployeeAvatar           NVARCHAR(2000),
	Username                 Nvarchar(20)                                NOT NULL,
	Birthday                 datetime,
	EmployeeSex      Nvarchar(20) ,
	EmployeePassword         NVARCHAR(50)                                NOT NULL,
	EmployeeAddress          NVARCHAR(50) ,
	EmployeePhone            NVARCHAR(50) ,
	EmpRole				     Nvarchar(20)                   
	
)
 --Create table Account
CREATE TABLE Applications (
	ApplicationID		    INT		            IDENTITY(1, 1)		 PRIMARY KEY,
	LeaveDate				Date							     NOT NULL,
	LeaveReason				NVARCHAR(50),
	ApplicationStatus       BIT                                NOT NULL,
	EmployeeID		    INT						
	FOREIGN KEY REFERENCES Employee(EmployeeID)
	                 
	
)



 --Create table WordSheet
CREATE TABLE Shitf (
    ShitfID                INT                 IDENTITY(1, 1)	    PRIMARY KEY,
	StartTime		       Time		                        NOT NULL,
	EndTime                time									NOT NULL,
	ShiftDate			   Datetime                                 NOT NULL,
	CoefSalary             Float                                      NOT NULL ,  
	RoleEmployee           int
	
)


--Create table Work
CREATE TABLE Payroll (
    PayrollID              INT                 IDENTITY(1, 1)	     PRIMARY KEY,
	Hourswork                  INT,
	EmployeeID			   INT
	FOREIGN KEY REFERENCES Employee(EmployeeID),
	ShitfID			    INT
	FOREIGN KEY REFERENCES Shitf(ShitfID)
	
)

--Create table Attendance
CREATE TABLE Attendance (
    AttendanceID              INT                 IDENTITY(1, 1)	     PRIMARY KEY,
	CheckIn                   TIME, 
	CheckOut				  TIME,
	LateTime                  INT,
	EmployeeID			      INT
	FOREIGN KEY REFERENCES Employee(EmployeeID),
	ShitfID			    INT
	FOREIGN KEY REFERENCES Shitf(ShitfID)
	
)



--Create table categories
CREATE TABLE Categorie (
	CategoryID				INT						IDENTITY(1, 1)   		PRIMARY KEY,
	CategoryName			NVARCHAR(50)			UNIQUE					NOT NULL

)
GO


--Create table Products
CREATE TABLE Product (
	ProductID			INT 	        IDENTITY(1, 1)     	     PRIMARY KEY,
	ProductLink         NVARCHAR(2000)                                         ,
	ProductName		    VARCHAR(2000)				             NOT NULL,
	ProductPrice		MONEY			                         NOT NULL,
	Disscount       	MONEY			DEFAULT '0.00'			 NOT NULL,   
	ProductStatus       Bit                                      NOT NULL,
	Quatity             INt,
	CategoryID		    INT						
	FOREIGN KEY REFERENCES Categorie(CategoryID),
	EmployeeID		    INT						
	FOREIGN KEY REFERENCES Employee(EmployeeID)
)
GO



--create table customers
CREATE TABLE Customer (
	CustomerID			    INT               IDENTITY(1, 1) 				PRIMARY KEY,
	CustomerName		    NVARCHAR(50)									NOT NULL,
	Phone                   VARCHAR(20)                                     NOT NULL,

)
GO
--create table customers
CREATE TABLE Feedback (
	FeedbackID			    INT               IDENTITY(1, 1) 				PRIMARY KEY,
	Comment				  NVARCHAR(50)									NOT NULL,
	Rate                  INT                                     NOT NULL,
	EmployeeID		    INT						
	FOREIGN KEY REFERENCES Employee(EmployeeID),
	CustomerID				INT
	FOREIGN KEY REFERENCES Customer(CustomerID),


)
GO





GO
--create table voucher
CREATE TABLE Voucher (
	VoucherID				    INT					IDENTITY(1, 1) 			 PRIMARY KEY,
	VoucherName                 NVARCHAR(50)								 NOT NULL,
	DateStart					DATETIME									 NOT NULL,
	DateEnd			     		DATETIME									 NOT NULL,
	VoucherStatus				BIT,										
	Condition					INT,
	Quatity						INT											 NOT NULL,
	EmployeeID		    INT						
	FOREIGN KEY REFERENCES Employee(EmployeeID)
	
)
GO

--create table Payment
CREATE TABLE Payment (
	PayID			    INT					IDENTITY(1, 1) 			PRIMARY KEY,
	PayName		        NVARCHAR(50)											NOT NULL,
)
GO

--create table Orders
CREATE TABLE Orders (
	OrderID				    INT					IDENTITY(1, 1) 			PRIMARY KEY,
	OrderDate				DATETIME										NOT NULL,
	CustomerID				INT
	FOREIGN KEY REFERENCES Customer(CustomerID),
	PayID			        INT       
	FOREIGN KEY REFERENCES Payment(PayID)  ,
	VoucherID			     INT       
	FOREIGN KEY REFERENCES Voucher(VoucherID)  
)

--create table Order
CREATE TABLE Orderdetail (
    OrderdetailID                 INT 			IDENTITY(1, 1) 		PRIMARY KEY,
	ProdcutID		        INT               
	FOREIGN KEY REFERENCES Product(ProductID)       ,
	Quantity                INT                                     NOT NULL,	           
	OrderID			        INT       
	FOREIGN KEY REFERENCES Orders(OrderID)  
	)
GO









-- ------------------------------------------------------- Insert data for all table------------------------------------------------------------------------------------------------------------------------------------------------
--Add data for Account ok
--Manager : 1  
--Sales :2
--Guard :3

INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,EmpRole,EmployeePhone,EmployeeAddress,EmployeeAvatar)VALUES(N'Nguyễn Văn Tuấn','Tuan','123',N'Nam','1997-05-23','Manager','1234567890',N'Hồ Chí Minh','https://images.search.yahoo.com/images/view;_ylt=AwrO_3zTrmRk2.Ua.JGJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkA2RiZGU1YmM4ZDY3OTIzNWMyMDQzMGNhNzEzMWJhNDlmBGdwb3MDMgRpdANiaW5n?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3D%25E1%25BA%25A3nh%2Bth%25E1%25BA%25BB%2Bfull%2Bhd%26ei%3DUTF-8%26type%3DE210US91215G0%26fr%3Dmcafee%26fr2%3Dp%253As%252Cv%253Ai%252Cm%253Asb-top%26tab%3Dorganic%26ri%3D2&w=1366&h=2048&imgurl=hinhnenhd.com%2Fwp-content%2Fuploads%2F2021%2F11%2FTop-80-hinh-anh-the-3%25C3%25974-dep-nhat-moi-nhat.jpg&rurl=https%3A%2F%2Fhinhnenhd.com%2Ftop-80-hinh-anh-the-3x4-dep-nhat-moi-nhat%2F&size=189.4KB&p=%E1%BA%A3nh+th%E1%BA%BB+full+hd&oid=dbde5bc8d679235c20430ca7131ba49f&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&fr=mcafee&tt=Top+80+h%C3%ACnh+%E1%BA%A3nh+th%E1%BA%BB+3%C3%974+%C4%91%E1%BA%B9p+nh%E1%BA%A5t%2C+m%E1%BB%9Bi+nh%E1%BA%A5t&b=0&ni=160&no=2&ts=&tab=organic&sigr=7pFuuR5gJ856&sigb=_B1vY1odqcKy&sigi=8kkSD5XczuPp&sigt=xY4Z8GqMCSwY&.crumb=ubYMAKIsLGZ&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&type=E210US91215G0')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,EmpRole,EmployeePhone,EmployeeAddress,EmployeeAvatar)VALUES(N'Đặng Thu Hà','Ha','123',N'Nữ','2002-06-26','Sales','0326987512',N'Bình Định','https://images.search.yahoo.com/images/view;_ylt=AwrO_3zTrmRk2.Ua.ZGJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkA2E3Nzg3YjI5MzBkM2UxZDI1ODk3OTk0ZTJiZGNiMTA3BGdwb3MDMwRpdANiaW5n?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3D%25E1%25BA%25A3nh%2Bth%25E1%25BA%25BB%2Bfull%2Bhd%26ei%3DUTF-8%26type%3DE210US91215G0%26fr%3Dmcafee%26fr2%3Dp%253As%252Cv%253Ai%252Cm%253Asb-top%26tab%3Dorganic%26ri%3D3&w=800&h=1199&imgurl=toplist.vn%2Fimages%2F800px%2Fkamiwedding-554101.jpg&rurl=https%3A%2F%2Fkthn.edu.vn%2Ftop-5-tiem-chup-anh-the-dep-va-chat-luong-nhat-tai-tinh-thai-nguyen%2F&size=585.3KB&p=%E1%BA%A3nh+th%E1%BA%BB+full+hd&oid=a7787b2930d3e1d25897994e2bdcb107&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&fr=mcafee&tt=Top+5+Ti%E1%BB%87m+ch%E1%BB%A5p+%E1%BA%A3nh+th%E1%BA%BB+%C4%91%E1%BA%B9p+v%C3%A0+ch%E1%BA%A5t+l%C6%B0%E1%BB%A3ng+nh%E1%BA%A5t+t%E1%BA%A1i+t%E1%BB%89nh+Th%C3%A1i+Nguy%C3%AAn+-+KTHN&b=0&ni=160&no=3&ts=&tab=organic&sigr=eLmJVB1ACHQi&sigb=g434fFdvEQSi&sigi=vK4WHxT7Vlw2&sigt=t.E12qWZcs1D&.crumb=ubYMAKIsLGZ&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&type=E210US91215G0')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,EmpRole,EmployeePhone,EmployeeAddress,EmployeeAvatar)VALUES(N'Hồ Văn Thanh','Thanh','123',N'Nam','2001-07-13','Sales','0265014325',N'Đồng Nai','https://images.search.yahoo.com/images/view;_ylt=AwrO_3zTrmRk2.UaBJKJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkAzcyY2Y0NmY3OTI0ZjA0YmUwNTFiMzAxMWEzODIxNmU3BGdwb3MDMTQEaXQDYmluZw--?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3D%25E1%25BA%25A3nh%2Bth%25E1%25BA%25BB%2Bfull%2Bhd%26ei%3DUTF-8%26type%3DE210US91215G0%26fr%3Dmcafee%26fr2%3Dp%253As%252Cv%253Ai%252Cm%253Asb-top%26tab%3Dorganic%26ri%3D14&w=700&h=1005&imgurl=img2.thuthuatphanmem.vn%2Fuploads%2F2019%2F05%2F06%2Fanh-the-nu-sinh_100828812.jpg&rurl=http%3A%2F%2Fthuthuatphanmem.vn%2Ftong-hop-nhung-anh-the-dep-nhat%2F&size=82.5KB&p=%E1%BA%A3nh+th%E1%BA%BB+full+hd&oid=72cf46f7924f04be051b3011a38216e7&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&fr=mcafee&tt=T%E1%BB%95ng+h%E1%BB%A3p+nh%E1%BB%AFng+%E1%BA%A3nh+th%E1%BA%BB+%C4%91%E1%BA%B9p+nh%E1%BA%A5t&b=0&ni=160&no=14&ts=&tab=organic&sigr=mGOxd2w81f8D&sigb=dn2aBOM07N.i&sigi=xKi7wMvcixJO&sigt=umVAqA_6BRHR&.crumb=ubYMAKIsLGZ&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&type=E210US91215G0')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,EmpRole,EmployeePhone,EmployeeAddress,EmployeeAvatar)VALUES(N'Huỳnh Thảo Trang','Trang','123',N'Nữ','2003-02-03','Sales','03265984210',N'Ninh Bình','https://images.search.yahoo.com/images/view;_ylt=AwrO_3zTrmRk2.UaApKJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkAzQwZWRmNGM2MDM0ZDc5MGI1Zjk2YTY5NWIzYjUxYTYwBGdwb3MDMTIEaXQDYmluZw--?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3D%25E1%25BA%25A3nh%2Bth%25E1%25BA%25BB%2Bfull%2Bhd%26ei%3DUTF-8%26type%3DE210US91215G0%26fr%3Dmcafee%26fr2%3Dp%253As%252Cv%253Ai%252Cm%253Asb-top%26tab%3Dorganic%26ri%3D12&w=703&h=960&imgurl=toigingiuvedep.vn%2Fwp-content%2Fuploads%2F2021%2F07%2Fmau-anh-the-dep-voi-ao-so-mi.jpg&rurl=https%3A%2F%2Fthoitrangwiki.com%2Fbst-600-anh-the-phong-trang-nam-chat-luong-full-hd-vi-cb.html&size=36.2KB&p=%E1%BA%A3nh+th%E1%BA%BB+full+hd&oid=40edf4c6034d790b5f96a695b3b51a60&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&fr=mcafee&tt=BST+600%2B+%E1%BA%A3nh+th%E1%BA%BB+ph%C3%B4ng+tr%E1%BA%AFng+nam+ch%E1%BA%A5t+l%C6%B0%E1%BB%A3ng+full+HD+-+Wikipedia&b=0&ni=160&no=12&ts=&tab=organic&sigr=xqmTrX2bWeQJ&sigb=6FFave3XV6WS&sigi=pA4HDfQKSZfz&sigt=OCk7AHbBj6_f&.crumb=ubYMAKIsLGZ&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&type=E210US91215G0')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,EmpRole,EmployeePhone,EmployeeAddress,EmployeeAvatar)VALUES(N'Lê Tấn Luân','Luan','123',N'Nam','2002-10-17','Guard','03265986321',N'Thanh Hóa','https://images.search.yahoo.com/images/view;_ylt=AwrjbHPMr2RkQgIa33mJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkAzA5NjBjNmEwZTE3MjEwNmVjM2Q4NTJkMDE4MmExNjFjBGdwb3MDNQRpdANiaW5n?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3D%25E1%25BA%25A3nh%2Bth%25E1%25BA%25BB%2Bfull%2Bhd%2Bc%25C3%25B4ng%2Ban%26ei%3DUTF-8%26type%3DE210US91215G0%26fr%3Dmcafee%26fr2%3Dp%253As%252Cv%253Ai%252Cm%253Asb-top%26tab%3Dorganic%26ri%3D5&w=682&h=1023&imgurl=toplist.vn%2Fimages%2F800px%2Ftiem-chup-anh-the-lay-ngay-dep-nhat-vi-thanh-hau-giang-chu-de-da-duoc-nhan-nguyen-hoang-ha-318573.jpg&rurl=https%3A%2F%2Fthoitrangwiki.com%2Fbst-600-anh-the-phong-trang-nam-chat-luong-full-hd-vi-cb.html&size=277.4KB&p=%E1%BA%A3nh+th%E1%BA%BB+full+hd+c%C3%B4ng+an&oid=0960c6a0e172106ec3d852d0182a161c&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&fr=mcafee&tt=BST+600%2B+%E1%BA%A3nh+th%E1%BA%BB+ph%C3%B4ng+tr%E1%BA%AFng+nam+ch%E1%BA%A5t+l%C6%B0%E1%BB%A3ng+full+HD+-+Wikipedia&b=0&ni=160&no=5&ts=&tab=organic&sigr=xqmTrX2bWeQJ&sigb=W56RqH3DLs34&sigi=1sK1VhOBFW18&sigt=OCk7AHbBj6_f&.crumb=ubYMAKIsLGZ&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&type=E210US91215G0')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,EmpRole,EmployeePhone,EmployeeAddress,EmployeeAvatar)VALUES(N'Phạm Hữu Nghĩa','Nghia','123',N'Nam','2000-05-30','Guard','02659864175',N'Bình Thuận','https://images.search.yahoo.com/images/view;_ylt=AwrjbHPMr2RkQgIa73mJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkA2NjMWJlZmZiZTU0NzI4ZTRiOWFmMWMyOTBlNTVkNjRlBGdwb3MDMjEEaXQDYmluZw--?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3D%25E1%25BA%25A3nh%2Bth%25E1%25BA%25BB%2Bfull%2Bhd%2Bc%25C3%25B4ng%2Ban%26ei%3DUTF-8%26type%3DE210US91215G0%26fr%3Dmcafee%26fr2%3Dp%253As%252Cv%253Ai%252Cm%253Asb-top%26tab%3Dorganic%26ri%3D21&w=600&h=890&imgurl=bizweb.dktcdn.net%2F100%2F175%2F849%2Ffiles%2Fchup-anh-the-dep-cho-hoc-sinh-03.jpg%3Fv%3D1609569926973&rurl=https%3A%2F%2Fthoitrangwiki.com%2Fbst-600-anh-the-phong-trang-nam-chat-luong-full-hd-vi-cb.html&size=40.6KB&p=%E1%BA%A3nh+th%E1%BA%BB+full+hd+c%C3%B4ng+an&oid=cc1beffbe54728e4b9af1c290e55d64e&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&fr=mcafee&tt=BST+600%2B+%E1%BA%A3nh+th%E1%BA%BB+ph%C3%B4ng+tr%E1%BA%AFng+nam+ch%E1%BA%A5t+l%C6%B0%E1%BB%A3ng+full+HD+-+Wikipedia&b=0&ni=160&no=21&ts=&tab=organic&sigr=xqmTrX2bWeQJ&sigb=sS_v57iEbNbM&sigi=SqbZJ6ZMS60k&sigt=OCk7AHbBj6_f&.crumb=ubYMAKIsLGZ&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&type=E210US91215G0')


--Add data for Shift no  ok
---Shiftdate
-- Ngày thường :1
-- Chủ Nhật:2
-- Lễ: 3
--roleEmployee
--nhân viên :1
--bảo vệ : 2

INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('06:00:00','12:00:00',1,1,1)
INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('12:00:00','18:00:00',1,1,1)
INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('18:00:00','06:00:00',1,1.5,1)
INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('18:00:00','06:00:00',2,2,1)
INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('12:00:00','18:00:00',3,3,1)
INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('18:00:00','06:00:00',1,1,1)
INSERT INTO Shitf(StartTime,EndTime,ShiftDate,CoefSalary,RoleEmployee) VALUES('18:00:00','06:00:00',1,1,1)


										  
--  Add data for categories ok
INSERT INTO Categorie(CategoryName) VALUES('Softdrink')
INSERT INTO Categorie(CategoryName) VALUES('Snack')
INSERT INTO Categorie(CategoryName) VALUES('Mask')
INSERT INTO Categorie(CategoryName) VALUES('Cake')
INSERT INTO Categorie(CategoryName) VALUES('Fast Food')



--Add data for Product

INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'Guava TEA',25000,20,'true',3.0,'https://drive.google.com/file/d/1_P5Xe_4hnyKv0qtvbF4VtPzPOicqA3-P/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'MILK FLAVOR',20000,30,'true',0.0,'https://drive.google.com/file/d/12Ycqn6fdkhtYXSbhkH9HKghlqrVm9ZfG/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'ROOKED MILK TEA',27000,50,'true',5.0,'https://drive.google.com/file/d/1_P5Xe_4hnyKv0qtvbF4VtPzPOicqA3-P/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'FRESH MILK COFFEE',25000,10,'true',3.0,'https://drive.google.com/file/d/1x2khxy5UlyfcjLYzb_FRtZa6KBmYYuh0/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'OLONG TEA',20000,25,'true',0.0,'https://drive.google.com/file/d/1q_719bZN-p63NvO5luCHbunv2m5meNec/view?usp=share_link')
 
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(2,'ORION Potato Snack',12000,12,'true',1.0,'https://drive.google.com/file/d/1q2kg9VI_xNoPBW5plGmPEKwN5EVxSqbG/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(2,'SWING MAXX KTC ',15000,8,'true',3.0,'https://drive.google.com/file/d/1rLJN-PJXw-H93BRx1Pa0H-ONZ1TlRQcP/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(2,'OSTAR Fries',15000,7,'true',0.0,'https://drive.google.com/file/d/11fF8sayYb7Ic_yE1qhBF5x0E8Kydgufq/view?usp=share_link')



INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(3,'Mask 3D',30000,20,'true',0.0,'https://drive.google.com/file/d/1hJ-SMX1CDhYdgYD5yRbdmeLV2wimmAno/view?usp=share_link')



INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'BROWNIE PARFAIT',32000,40,'true',0.0,'https://drive.google.com/file/d/18zT-sOiC4vKohoItxBBoWKWrrXb-miLa/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'CHOCOLATE CAKE',30000,37,'true',3.0,'https://drive.google.com/file/d/1UTbKPzReK1v6heQAYSZK9KGMkfU1haNK/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'CREPES',35000,28,'true',5.0,'https://drive.google.com/file/d/1kssHO_QHxE4CC-AJqUR8FXOB-zNlQFkQ/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'PANNA COTTA MEMBERS ',40000,9,'true',5.0,'https://drive.google.com/file/d/1-_86Hh1MMC-9bunz6NIBgi7MsCLzc6AS/view?usp=share_link')

INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Spicy Pork SALAD ',38000,5,'true',5.0,'https://drive.google.com/file/d/1bUJXB3lEq9kKTVDqa0nbItRzdCgTSH4i/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'TEMAKI ONIGIRI SHRIMP MAYO',30000,16,'true',3.0,'https://drive.google.com/file/d/1ltR_NKue3-Z3YejjyKZK8pzr0IOHj_VB/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Kimchi Grilled Beef Rice',35000,27,'true',0.0,'https://drive.google.com/file/d/1YWjCjr7Y9XkbfPA45oem5CkZVEtZ9ikd/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Japanese Curry Rice',40000,20,'true',4.0,'https://drive.google.com/file/d/1kNCarnZPJMwwao_zU4YFgnlEF4ovw6iY/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Fried rice with sausage & kimchi',25000,10,'true',3.0,'https://drive.google.com/file/d/1v7jKh05bdszPIeDqy9N0mzhcs4cZ0yZ3/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'TOMYUM SEAFOOD RICE',36000,9,'true',5.0,'https://drive.google.com/file/d/1BgwJRgX_OZ2af-s7Vrf__tjTW5eD6VuQ/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'FEMALE RICE ',35000,30,'true',5.0,'https://drive.google.com/file/d/1wpWtq0nxxAE0GiLzSL6DQd6ppYG2YWcB/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'HOTDOG',20000,40,'true',3.0,'https://drive.google.com/file/d/1Ye7tjw5WWFVM-0iEn5xT8BDWN2PCN8TO/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Noodles',20000,21,'true',0.0,'https://drive.google.com/file/d/1ZPPAOjD-Pm1cF4v2goQYXTBRPzZJYdac/view?usp=share_link')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'TUNA SALAD',36000,20,'true',2.0,'https://drive.google.com/file/d/12HBnU7tpwrZ-trZ1MlMfbe315ROzKUyx/view?usp=share_link')




--Add data for customer ok
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Huy','0994874853')
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Nhat','08937587693')
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Ngan','09838489685')
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Son','0994874853')
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Van','093365897443')
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Nam','0994874853')
INSERT INTO Customer(CustomerName,Phone) VALUES(N'Dung','0392272356')

--ok
INSERT INTO Voucher(VoucherName,DateStart,DateEnd,Quatity,VoucherStatus) VALUES('Voucher 1', '2023-05-23', '2023-05-30', 10, 'true')
INSERT INTO Voucher(VoucherName,DateStart,DateEnd,Quatity,VoucherStatus) VALUES('Voucher 2', '2023-05-24', '2023-06-01', 5, 'false')
INSERT INTO Voucher(VoucherName,DateStart,DateEnd,Quatity,VoucherStatus) VALUES ('Voucher 3', '2023-05-25', '2023-05-31', 7, 'true')
--ok
INSERT INTO Payment(PayName) VALUES('Cash')
INSERT INTO Payment(PayName) VALUES('Bank transfer')


-- Data for Orders ok
INSERT INTO Orders(CustomerID,OrderDate,PayID,VoucherID ) VALUES(1, '2023-05-23', 1, 1)
INSERT INTO Orders(CustomerID,OrderDate,PayID,VoucherID ) VALUES(2, '2023-05-24', 2, 2)



--data for order_details
INSERT INTO Orderdetail(OrderID,ProdcutID,Quantity) VALUES(1,2,3)
INSERT INTO Orderdetail(OrderID,ProdcutID,Quantity) VALUES(1,5,6)
INSERT INTO Orderdetail(OrderID,ProdcutID,Quantity) VALUES(1,10,3)
INSERT INTO Orderdetail(OrderID,ProdcutID,Quantity) VALUES(2,6,3)
INSERT INTO Orderdetail(OrderID,ProdcutID,Quantity) VALUES(2,5,1)
INSERT INTO Orderdetail(OrderID,ProdcutID,Quantity) VALUES(2,7,1)
					

-- add data for feedbak ok
INSERT INTO Feedback(CustomerID,Comment,Rate) VALUES(1, 'Great service!', 5)
INSERT INTO Feedback(CustomerID,Comment,Rate) VALUES(2, 'Good experience overall.', 4)
INSERT INTO Feedback(CustomerID,Comment,Rate) VALUES(3, 'Could be better.', 3)
INSERT INTO Feedback(CustomerID,Comment,Rate) VALUES(6, 'Needs improvement in packaging.', 3)
INSERT INTO Feedback(CustomerID,Comment,Rate) VALUES(5, 'Excellent customer support.', 5)

-- add Attendance
--add payroll
--INSERT INTO Payroll(EmployeeID,ShitfID,Hourswork) VALUES(1,1,'50')

INSERT INTO Applications(LeaveDate,ApplicationStatus,LeaveReason) VALUES('2023-05-23', 'True', 'Vacation'),
																		('2023-05-24', 'False', 'Sick Leave'),
																		('2023-05-25', 'False', 'Personal Reasons'),
																		('2023-05-26', 'True', 'Family Event'),
																		('2023-05-27', 'False', 'Workshop Attendance')






select EmployeeID,EmployeeName,EmployeeAvatar,EmployeeAddress,Birthday,EmployeeSex, EmployeePhone,EmpRole from Employee 