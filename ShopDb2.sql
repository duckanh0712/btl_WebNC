--createdBy: Anh Quang

CREATE DATABASE Shop

USE Shop

CREATE TABLE tblCategory (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name VARCHAR (50) NOT NULL
);

CREATE TABLE tblUser (
    id INT PRIMARY KEY IDENTITY (1, 1),
    username VARCHAR (50) UNIQUE NOT NULL,
    password VARCHAR (50) NOT NULL,
    role VARCHAR(20),
    name VARCHAR (50) NOT NULL,
    address VARCHAR (50) NOT NULL,
    dateOfBirth DATETIME,
    phone VARCHAR(20),
    email VARCHAR(20),
    gender BIT
);

CREATE TABLE tblProduct (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name VARCHAR (50) NOT NULL,
    images VARCHAR (50) NOT NULL,
    description VARCHAR(100),
    price INT NOT NULL,
    quantity INT NOT NULL,
    guarantee VARCHAR(20),
    category_id INT NOT NULL,
    created_by INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES tblCategory (id),
    FOREIGN KEY (created_by) REFERENCES tblUser (id)
);

CREATE TABLE tblCart(
	id INT PRIMARY KEY IDENTITY (1, 1),
	created_date DATETIME,
	totalQuantity INT,
	created_by INT NOT NULL,
	FOREIGN KEY (created_by) REFERENCES tblUser (id)
);

CREATE TABLE tblCartItem(
	id INT PRIMARY KEY IDENTITY (1, 1),
	cart_id INT NOT NULL,
	product_id INT NOT NULL,
	price INT NOT NULL,
	amount INT NOT NULL,
	FOREIGN KEY (cart_id) REFERENCES tblCart (id),
	FOREIGN KEY (product_id) REFERENCES tblProduct (id)
);

--PROCEDURE
--register
CREATE PROCEDURE register
    @name VARCHAR (50),
    @address VARCHAR (50),
    @dateOfBirth DATETIME,
    @phone VARCHAR(20),
    @email VARCHAR(20),
    @gender BIT,
    @username VARCHAR (50),
    @password VARCHAR (50),
    @role VARCHAR(20)
AS
BEGIN
	DECLARE @Count INT
	DECLARE @ReturnCode INT
	
	SELECT @Count = COUNT(username) 
	FROM tblUser WHERE username = @username 
	IF @Count > 0
	BEGIN
		SET @ReturnCode = -1
	END
	ELSE
	BEGIN
		SET @ReturnCode = 1
		INSERT INTO tblUser(name,address,dateOfBirth,phone,email,gender,username,password,role) VALUES (@name, @address, @dateOfBirth, @phone, @email, @gender, @username, @password, @role)
	END
	SELECT @ReturnCode as ReturnValue
END
GO

--exec register 'quang','hn','','0988945310','leequang198@gmial.com',true,'quang123','123456','ADMIN'

--login
CREATE PROCEDURE login
	@username VARCHAR(50),
	@password VARCHAR(50)
AS
	SELECT COUNT(id) AS ID FROM tblUser WHERE username = @username AND password = @password;
GO

--exec login 'quang123','12345678';

--get all products
CREATE PROCEDURE getAllProducts
AS
	SELECT * FROM tblProduct;
GO

--get product by id
CREATE PROCEDURE getProduceById
@id INT
AS
	SELECT * FROM tblProduct WHERE tblProduct.id = @id;
GO

--get all category
CREATE PROCEDURE getAllCategories
AS
	SELECT * FROM tblCategory
GO

--delete category by id
CREATE PROCEDURE deleteCategoryById
@id INT
AS
	DELETE FROM tblCategory WHERE tblCategory.id = @id
GO