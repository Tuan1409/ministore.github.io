









USE master
DROP DATABASE IF EXISTS SWPProject2
GO


CREATE DATABASE SWPProject2
GO
USE SWPProject2
GO

---------------------------------------------------------------------------- Create table for all attribute --------------------------------------------------------------------------------------------------------- 
   Create table Roles (
            RoleId      INT		            IDENTITY(1, 1)		 PRIMARY KEY,
			RoleName    NVARCHAR(20)							     NOT NULL
			)
 go    

CREATE TABLE Employee (
	EmployeeID				 INT		            IDENTITY(1, 1)		 PRIMARY KEY,
	EmployeeName		     NVARCHAR(50)							     NOT NULL,
	EmployeeAvatar           NVARCHAR(2000),
	Username                 Nvarchar(20)                                NOT NULL,
	Birthday                 Date,
	EmployeeSex              int ,
	EmployeePassword         NVARCHAR(50)                                NOT NULL,
	EmployeeAddress          NVARCHAR(50) ,
	EmployeePhone            NVARCHAR(50) ,
	EmployeeStatus           Bit                                         ,
	RoleId		    INT						
	FOREIGN KEY REFERENCES Roles(RoleId)               
	
)
go



 --Create table WordSheet
CREATE TABLE Shifts (
    ShiftID                INT                 IDENTITY(1, 1)	    PRIMARY KEY,
	StartTime		       Time		                        NOT NULL,  
	StartDate				Date										NOT NULL, 
	EndTime                Time									NOT NULL,
	EndDate					Date									NOT NULL,
	CoefSalary             Float                                      NOT NULL ,  
	EmployeeRole			int							NOT NULL , 
	EmployeeID				INT
	FOREIGN KEY REFERENCES Employee(EmployeeID)						,
	WorkStatus			int											NOT NULL,
)


--Create table Work
CREATE TABLE Payroll (
	EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	Salary INT,
)

CREATE TABLE Applications (
	ApplicationID		    INT		            IDENTITY(1, 1)		 PRIMARY KEY,
	ShiftID				INT							     FOREIGN KEY REFERENCES Shifts(ShiftID),
	LeaveReason				NVARCHAR(50),
	ApplicationStatus       BIT                                DEFAULT 0,
	EmployeeID		    INT						
	FOREIGN KEY REFERENCES Employee(EmployeeID),
	IsApproved BIT DEFAULT 0
)


--Create table Attendance
CREATE TABLE Attendance (
    AttendanceID              INT                 IDENTITY(1, 1)	     PRIMARY KEY,
	CheckInDate                   DATE, 
	CheckInTime				  TIME,
	CheckOutDate				DATE,
	CheckOutTime				TIME,
	LateTime                  INT,
	SoonTime				INT,
	EmployeeID			      INT
	FOREIGN KEY REFERENCES Employee(EmployeeID),
	ShiftID			    INT
	FOREIGN KEY REFERENCES Shifts(ShiftID),
	ShiftComplete BIT DEFAULT 0,
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


--Add data for Role
INSERT INTO Roles(RoleName) VALUES('Manager')
INSERT INTO Roles(RoleName) VALUES('Sales')
INSERT INTO Roles(RoleName) VALUES('Guard')
go

INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Nguyễn Văn Tuấn','Tuan','123',1,'1997-05-23',1,'1234567890',N'Hồ Chí Minh','True',N'6.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Đặng Thu Hà','Ha','123',2,'2002-06-26',2,'0326987512',N'Bình Định','True',N'1.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Hồ Văn Thanh','Thanh','123',1,'2001-07-13',2,'0265014325',N'Đồng Nai','True',N'4.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Huỳnh Thảo Trang','Trang','123',2,'2003-02-03',2,'03265984210',N'Ninh Bình','True',N'3.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Lê Tấn Luân','Luan','123',1,'2002-10-17',3,'03265986321',N'Thanh Hóa','True',N'4.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Phạm Hữu Nghĩa','Nghia','123',2,'2000-05-30',3,'02659864175',N'Bình Thuận','True',N'5.jpg')

INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Phạm Trần Huy','Huy','123',1,'1997-05-23',2,'1234567890',N'Hồ Chí Minh','True',N'5.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Hiếu Trần','Hieu','123',2,'2002-06-26',3,'0326987512',N'Bình Định','True',N'6.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Phạm Hiếu','Hieu','123',1,'2001-07-13',2,'0265014325',N'Đồng Nai','True',N'2.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Hồ Thảo','Thao','123',2,'2003-02-03',2,'03265984210',N'Ninh Bình','True',N'3.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Lê Tấn Bằng','Bang','123',1,'2002-10-17',3,'03265986321',N'Thanh Hóa','True',N'4.jpg')
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)VALUES(N'Nhật Hào','Hao','123',1,'2000-05-30',3,'02659864175',N'Bình Thuận','True',N'5.jpg')

go

--Add data for Shift no  ok
---Shiftdate
-- Ngày thường :1
-- Chủ Nhật:2
-- Lễ: 3
--roleEmployee
--nhân viên :1
--bảo vệ : 2


INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-05','12:00:00','2023-06-05',1,2, 2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-05','18:00:00','2023-06-05',1,2, 3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-05','06:00:00','2023-06-06',1.5,2, 4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-05','18:00:00','2023-06-05',1,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-05','06:00:00','2023-06-06',1.5,3, 6,1)

INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-06','12:00:00','2023-06-06',1,2 ,2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-06','18:00:00','2023-06-06',1,2 ,3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-06','06:00:00','2023-06-07',1.5,2 ,4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-06','18:00:00','2023-06-06',1,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-06','06:00:00','2023-06-07',1.5,3, 6,1)

INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-07','12:00:00','2023-06-07',1,2, 2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-07','18:00:00','2023-06-07',1,2, 3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-07','06:00:00','2023-06-08',1.5,2, 4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-07','18:00:00','2023-06-07',1,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-07','06:00:00','2023-06-08',1.5,3, 6,1)

INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-08','12:00:00','2023-06-08',1,2, 2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-08','18:00:00','2023-06-08',1,2, 3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-08','06:00:00','2023-06-09',1.5,2, 4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-08','18:00:00','2023-06-08',1,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-08','06:00:00','2023-06-09',1.5,3, 6,1)

INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-09','12:00:00','2023-06-09',1,2, 2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-09','18:00:00','2023-06-09',1,2, 3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-09','06:00:00','2023-06-10',1.5,2, 4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-09','18:00:00','2023-06-09',1,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-09','06:00:00','2023-06-10',1.5,3, 6,1)

INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-10','12:00:00','2023-06-10',1,2, 2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-10','18:00:00','2023-06-10',1,2, 3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-10','06:00:00','2023-06-11',1.5,2, 4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-10','18:00:00','2023-06-10',1,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-10','06:00:00','2023-06-11',1.5,3, 6,1)

INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-11','12:00:00','2023-06-11',2,2, 2,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('12:00:00','2023-06-11','18:00:00','2023-06-11',2,2, 3,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-11','06:00:00','2023-06-12',3,2, 4,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('06:00:00','2023-06-11','18:00:00','2023-06-11',2,3, 5,1)
INSERT INTO Shifts(StartTime,StartDate,EndTime,EndDate,CoefSalary,EmployeeRole, EmployeeID, WorkStatus) VALUES('18:00:00','2023-06-11','06:00:00','2023-06-12',3,3, 6,1)

-- Ket thuc

										  
--  Add data for categories ok
INSERT INTO Categorie(CategoryName) VALUES('Softdrink')
INSERT INTO Categorie(CategoryName) VALUES('Snack')
INSERT INTO Categorie(CategoryName) VALUES('Mask')
INSERT INTO Categorie(CategoryName) VALUES('Cake')
INSERT INTO Categorie(CategoryName) VALUES('Fast Food')



--Add data for Product

INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'Guava TEA',25000,20,'true',3.0, N'HỒNG TRÀ SỮA NƯỚNG.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'MILK FLAVOR',20000,30,'true',0.0, N'SỮA VỊ DƯA LƯỚI.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'ROOKED MILK TEA',27000,50,'true',5.0, N'hongtra.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'FRESH MILK COFFEE',25000,10,'true',3.0, N'CÀ PHÊ SỮA TƯƠI.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(1,'OLONG TEA',20000,25,'true',0.0,N'TRÀ OLONG VỊ ĐÀO.jpg')

INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(2,'ORION Potato Snack',12000,12,'true',1.0,N'orion-snack-khoai-tây-bốn-vị-150g.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(2,'SWING MAXX KTC ',15000,8,'true',3.0,N'swing-ktc-vị-bò-nướng-ny-63g.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(2,'OSTAR Fries',15000,7,'true',0.0,N'ostar-khoai-tây-chiên-vị-trứng-muối-56g.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(3,'Mask 3D',30000,20,'true',0.0, N'mayan-khẩu-trang-3d-medi-5-cai.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'BROWNIE PARFAIT',32000,40,'true',0.0,N'BROWNIE PARFAIT.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'CHOCOLATE CAKE',30000,37,'true',3.0, N'BROWNIE PARFAIT.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'CREPES',35000,28,'true',5.0, N'63e04d8157339_2a4ae6fdc600139d449fe1522e24df8b.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(4,'PANNA COTTA MEMBERS ',40000,9,'true',5.0,N'BROWNIE PARFAIT.jpg')

INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Spicy Pork SALAD ',38000,5,'true',5.0, N'SALAD THỊT HEO CAY SỐT MẮM TỎI.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'TEMAKI ONIGIRI SHRIMP MAYO',30000,16,'true',3.0, N'CREPE.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Kimchi Grilled Beef Rice',35000,27,'true',0.0, N'CƠM BÒ NƯỚNG KIM CHI.png')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Japanese Curry Rice',40000,20,'true',4.0, N'CƠM CÀ RI NHẬT & GÀ CHIÊN XÙ.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Fried rice with sausage & kimchi',25000,10,'true',3.0, N'CƠM CÀ RI NHẬT & GÀ CHIÊN XÙ.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'TOMYUM SEAFOOD RICE',36000,9,'true',5.0, N'CƠM HẢI SẢN XỐT TOMYUM..jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'FEMALE RICE ',35000,30,'true',5.0,N'CƠM SƯỜN CHẢ.png')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'HOTDOG',20000,40,'true',3.0, N'HOTDOG XÚC XÍCH.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'Noodles',20000,21,'true',0.0,N'MÌ KHÔ XÁ XÍU.jpg')
INSERT INTO Product(CategoryID,ProductName,ProductPrice,Quatity,ProductStatus,Disscount,ProductLink) VALUES(5,'TUNA SALAD',36000,20,'true',2.0, N'00400.jpg')





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
--INSERT INTO Payroll(EmployeeID,ShiftID,Hourswork) VALUES(1,1,'50')



INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(1, 'Travel', 2)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(21, 'Headache', 2)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(20, 'None', 6)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(10, 'Vacation', 6)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(17, 'See the doctor', 3)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(22, 'For a interview', 3)

INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(5, 'Stomach-ache', 6)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(8, 'Go for a pregnancy test', 4)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(14, 'For a interview', 5)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(27, 'COVID-19', 3)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(29, 'None', 5)
INSERT INTO Applications(ShiftID, LeaveReason, EmployeeID) VALUES(31, 'For a interview', 2)

select EmployeeID,EmployeeName,EmployeeAvatar,EmployeeAddress,Birthday,EmployeeSex, EmployeePhone,RoleId from Employee 
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =2
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =3
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =4
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =5
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =6
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =7
UPDATE Employee SET EmployeeStatus = 'true'  WHERE EmployeeID =1


Select EmployeeID,EmployeeName,EmployeeAvatar,EmployeeAddress,Birthday,EmployeeSex, EmployeePhone,RoleId,EmployeeStatus from Employee

Select p.*,c.RoleName from Employee p left join Roles c on p.RoleId = c.RoleId where EmployeeStatus = 'false'

SELECT e.*, r.RoleName FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId WHERE Username = 'tuan' and EmployeePassword = 123

SELECT e.EmployeeID, e.EmployeeName, e.EmployeeAvatar, e.EmployeeAddress, e.Birthday, e.EmployeeSex, e.EmployeePhone, r.RoleName, e.EmployeeStatus FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId

SELECT e.EmployeeID, e.EmployeeName, e.EmployeeAvatar, e.EmployeeAddress, e.Birthday, e.EmployeeSex, e.EmployeePhone, r.RoleName, e.EmployeeStatus FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId Where EmployeeID =1

SELECT e.EmployeeID, e.EmployeeName, e.EmployeeAvatar, e.EmployeeAddress, 
                  e.Birthday, e.EmployeeSex, e.EmployeePhone, r.RoleName, e.EmployeeStatus 
                  FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId 
                  Where EmployeeID =2
INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,
Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)
VALUES(N'Nhật Hào','Hao','123',1,'2000-05-30',3,'02659864175',N'Bình Thuận','True',N'5.jpg')


UPDATE Employee
SET EmployeeStatus = CASE 
                        WHEN EmployeeStatus = 'true' THEN 'false'
                        ELSE 'true'
                    END
WHERE EmployeeID =3 

INSERT INTO Employee(EmployeeName,Username,EmployeePassword,EmployeeSex,
Birthday,RoleId,EmployeePhone,EmployeeAddress,EmployeeStatus,EmployeeAvatar)
VALUES(N'Linh Nguyễn','Linh','123',1,'2002-05-30',3,'02659864175',N'Bình Định','True',N'2.jpg')






 
 SELECT *  from Roles

 SELECT e.EmployeeID, e.EmployeeName, e.EmployeeAvatar,e.EmployeeAddress, e.Birthday, e.EmployeeSex, e.EmployeePhone,
                r.RoleName, e.EmployeeStatus 
                FROM Employee e JOIN Roles r ON e.RoleId = r.RoleId
                where EmployeeStatus = 'false'

