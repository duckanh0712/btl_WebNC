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

--proc check username and password
CREATE PROCEDURE checkLogin
    @username VARCHAR (50),
    @password VARCHAR (50)
AS
BEGIN
	DECLARE @Count INT
	DECLARE @ReturnCode INT
	
	SELECT @Count = COUNT(username) 
	FROM tblUser WHERE username = @username AND password = @password
	IF @Count > 0
	BEGIN
		SET @ReturnCode = 1
	END
	ELSE
	BEGIN
		SET @ReturnCode = -1
	END
	SELECT @ReturnCode as ReturnValue
END
GO

--exec checkLogin 'quang123', '123456'


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
CREATE PROCEDURE getProductById
@id INT
AS
BEGIN
	SELECT * FROM tblProduct WHERE tblProduct.id = @id
END
GO

--update product
CREATE PROCEDURE updateProduct
@id INT,
@name VARCHAR(50),
@price INT,
@quantity INT,
@description VARCHAR(50),
@guarantee VARCHAR(20),
@images VARCHAR(50),
@cateId INT,
@userId INT
AS
	UPDATE tblProduct SET name=@name, price=@price, quantity=@quantity, description=@description, guarantee=@guarantee, images=@images, category_id=@cateId, created_by=@userId WHERE tblProduct.id = @id
GO

--find product
CREATE PROCEDURE findProductByName
@name VARCHAR(50)
AS
	SELECT * FROM tblProduct WHERE tblProduct.name LIKE '%'+ @name +'%'
GO

--exec findProductByName 'ram'

--get all category
CREATE PROCEDURE getAllCategories
AS
	SELECT * FROM tblCategory
GO

--add category
CREATE PROCEDURE CreateCategory
@name VARCHAR(50)
AS
	INSERT INTO tblCategory(name) VALUES(@name) 
GO

--delete category by id
CREATE PROCEDURE deleteCategoryById
@id INT
AS
	DELETE FROM tblCategory WHERE tblCategory.id = @id
GO

--update category by id
CREATE PROCEDURE updateCategoryById
@id INT,
@name VARCHAR(20)
AS
	UPDATE tblCategory SET tblCategory.name = @name WHERE tblCategory.id = @id
GO

--get category by id
CREATE PROCEDURE getCategoryById
@id INT
AS
	DECLARE @namereturn VARCHAR(20)
		SELECT @namereturn=name FROM tblCategory WHERE tblCategory.id = @id
	SELECT @namereturn AS name
GO

--delete product by id
CREATE PROCEDURE deleteProductById
@id INT
AS
	DELETE FROM tblProduct WHERE tblProduct.id = @id
GO

--insert into product
CREATE PROCEDURE addProduct
@name VARCHAR(50),
@price INT,
@quantity INT,
@description VARCHAR(50),
@guarantee VARCHAR(20),
@images VARCHAR(50),
@cateId INT,
@userId INT
AS
	INSERT INTO tblProduct(name, price, quantity, description, guarantee, images, category_id, created_by) VALUES (@name, @price, @quantity, @description, @guarantee, @images, @cateId, @userId)
GO

--exec addProduct "RAM", 123123123, 20, "mo ta", "24", "1.jpg", 1, 1

CREATE PROCEDURE getUserByUsername
@username VARCHAR(20)
AS
	SELECT * FROM tblUser WHERE tblUser.username = @username
GO

exec getUserByUsername 'leequang198'

CREATE PROCEDURE addToCartItem
@userId INT,
@date DATE,
@pId INT,
@pId1 INT,
@price INT,
@amount INT,
@pCount INT
AS
	IF @pCount = 1
	BEGIN
		INSERT INTO tblCart(created_date, created_by) VALUES(@date, @userId)
		INSERT INTO tblCartItem(cart_id, product_id, price, amount) VALUES(SCOPE_IDENTITY(), @pId, @price, @amount)
	END
	ELSE
		INSERT INTO tblCart(created_date, created_by) VALUES(@date, @userId)
		INSERT INTO tblCartItem(cart_id, product_id, price, amount) VALUES(SCOPE_IDENTITY(), @pId, @price, @amount)
		INSERT INTO tblCartItem(cart_id, product_id, price, amount) VALUES(SCOPE_IDENTITY(), @pId1, @price, @amount)
GO

CREATE PROCEDURE addToCart
@userId INT,
@date DATE
AS
	INSERT INTO tblCart(created_date, created_by) VALUES(@date, @userId)
GO

--get product by category id
CREATE PROCEDURE getProductByCateId
@cateId INT
AS
	SELECT * FROM tblProduct WHERE tblProduct.category_id = @cateId
GO

--get all user
CREATE PROCEDURE getAllUser
AS
	SELECT * FROM tblUser
GO

--get user by id
CREATE PROCEDURE getUserById
@id INT
AS
	SELECT * FROM tblUser WHERE tblUser.id = @id
GO