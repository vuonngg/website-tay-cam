
CREATE DATABASE controller_web;
USE controller_web;

CREATE TABLE [user] (
    [id] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [username] NVARCHAR(255) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    [email] NVARCHAR(255) NOT NULL,
    [phone] NVARCHAR(15),
    [role] NVARCHAR(20) NOT NULL,
    [created_at] DATE
);

CREATE TABLE [category] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(255) NOT NULL
);

CREATE TABLE [product] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(255) NOT NULL,
    [price] DECIMAL(10,2) NOT NULL,
    [quantity] INT NOT NULL,
    [image] VARBINARY(MAX),  -- Dùng VARBINARY(MAX) để lưu ảnh
    [description] NVARCHAR(255),
    [category_id] INT FOREIGN KEY REFERENCES [category]([id])
);

CREATE TABLE [product_image] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [product_id] INT FOREIGN KEY REFERENCES [product]([id]),
    [image_url] NVARCHAR(255) NOT NULL,
    [created_at] DATE
);

CREATE TABLE [cart] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES [user]([id]),  
    [product_id] INT NOT NULL FOREIGN KEY REFERENCES [product]([id]), 
	[price] DECIMAL(10,2),
    [quantity] INT NOT NULL,
	[created_at] DATE
);
CREATE TABLE [address] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [user]([id]),
    [name] NVARCHAR(50) NOT NULL,
    [phone] NVARCHAR(15),
    [thanh_pho] NVARCHAR(255),
    [quan] NVARCHAR(255),
    [phuong] NVARCHAR(255),
    [so_nha] NVARCHAR(255),
    [ghi_chu] NVARCHAR(255),
    [default] BIT,
    [created_at] DATE
);

CREATE TABLE [discount] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [code] NVARCHAR(50) NOT NULL,
    [percentage] INT NOT NULL,
	[quantity] Int not null,
    [valid_from] DATE NOT NULL,
    [valid_to] DATE NOT NULL,
    [create_at] DATE NOT NULL
);

CREATE TABLE [payment] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [order_id] INT,
    [payment_method] NVARCHAR(50) NOT NULL,
    [status] NVARCHAR(50) NOT NULL,
    [created_at] DATE
);

CREATE TABLE [order] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [user]([id]),
    [payment_id] INT FOREIGN KEY REFERENCES [payment]([id]),
    [discount_id] INT FOREIGN KEY REFERENCES [discount]([id]) NULL,
    [address_id] INT FOREIGN KEY REFERENCES [address]([id]),
    [total_price] DECIMAL(10,2) NOT NULL,
    [image] NVARCHAR(255),
	[status] NVARCHAR(30),
    [created_at] DATE
);

CREATE TABLE [order_items] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [order_id] INT FOREIGN KEY REFERENCES [order]([id]),
    [product_id] INT FOREIGN KEY REFERENCES [product]([id]),
    [quantity] INT NOT NULL,
    [price] DECIMAL(10,2) NOT NULL,
    [total_price] DECIMAL(10,2) NOT NULL
);


CREATE TABLE [invoice] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [order_id] INT FOREIGN KEY REFERENCES [order]([id]),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [user]([id]),
    [status] NVARCHAR(50),
    [price] DECIMAL(10,2),
    [discount_price] DECIMAL(10,2),
    [created_at] DATETIME
);


CREATE TABLE [reviews] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [user]([id]),
    [product_id] INT FOREIGN KEY REFERENCES [product]([id]),
    [rating] INT,
    [comment] NVARCHAR(255),
    [created_at] DATE
);

CREATE TABLE [wishlist] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [user]([id]),
    [product_id] INT FOREIGN KEY REFERENCES [product]([id]),
    [created_at] DATE
);

-- Thêm khóa ngoại vào bảng payment tham chiếu đến bảng order
ALTER TABLE [payment]
ADD CONSTRAINT FK_Payment_Order FOREIGN KEY (order_id) REFERENCES [order]([id]);


-- dữ liệu--
-- Thêm dữ liệu vào bảng [user]
INSERT INTO [user] ([username], [password], [email], [phone], [role], [created_at])
VALUES
('admin', 'vuong', 'user1@example.com', '1234567890', 'admin', GETDATE()),
('user2', 'password2', 'user2@example.com', '1234567891', 'customer', GETDATE()),
('user3', 'password3', 'user3@example.com', '1234567892', 'customer', GETDATE()),
('user4', 'password4', 'user4@example.com', '1234567893', 'customer', GETDATE()),
('user5', 'password5', 'user5@example.com', '1234567894', 'customer', GETDATE());

-- Thêm dữ liệu vào bảng [category]
INSERT INTO [category] ([name])
VALUES
('Xbox'),
('Playtation'),
('Nitendo switch');

-- Thêm dữ liệu vào bảng [product]
INSERT INTO [product] ([name], [price], [quantity], [image], [description], [category_id])
VALUES
('Xbox 1', 1000.00, 50, NULL, 'High performance laptop', 1),
('playtation controller 4', 20.00, 100, NULL, 'Comfortable cotton shirt', 2),
('Nitendo switch 2', 150.00, 30, NULL, 'Microwave oven for quick meals', 3);

-- Thêm dữ liệu vào bảng [discount]
INSERT INTO [discount] ([code], [percentage], [quantity], [valid_from], [valid_to], [create_at])
VALUES
('DISCOUNT10', 10, 5, '2025-01-01', '2025-12-31', GETDATE()),
('DISCOUNT20', 20, 10, '2025-01-01', '2025-12-31', GETDATE()),
('DISCOUNT30', 30, 2,'2025-01-01', '2025-12-31', GETDATE()),
('DISCOUNT40', 40, 4,'2025-01-01', '2025-12-31', GETDATE()),
('DISCOUNT50', 50, 9,'2025-01-01', '2025-12-31', GETDATE());

select * from [user]

-- Thêm dữ liệu vào bảng [address]
INSERT INTO [address] ([user_id], [name], [phone], [thanh_pho], [quan], [phuong], [so_nha], [ghi_chu], [default], [created_at])
VALUES
('894DE7E6-12C8-4387-94AD-05396CCA268D', 'John Doe', '1234567890', 'Hanoi', 'Hoan Kiem', 'Hang Bai', '12A', 'No notes', 1, GETDATE()),
('FAB1D957-8DC7-4584-B035-0B7FD7D5D9C4', 'Jane Doe', '1234567891', 'Hanoi', 'Cau Giay', 'Dich Vong', '45B', 'Please deliver in the evening', 0, GETDATE()),
('1E5307F8-6708-4B86-979D-750B774073FA', 'Admin User', '1234567892', 'Hanoi', 'Dong Da', 'Trung Liet', '78C', 'Urgent delivery', 0, GETDATE()),
('ECCE5C08-37CF-4B0D-A2D4-B93BBC0FC1F7', 'Alice Wonderland', '1234567893', 'Hanoi', 'Ba Dinh', 'Lien Quan', '22D', 'Leave at the door', 1, GETDATE()),
('D92A3EFD-B505-4CBA-96FA-BBC83988E3CA', 'Bob Marley', '1234567894', 'Hanoi', 'Thanh Xuan', 'Hoa Liet', '89E', 'Call before delivery', 0, GETDATE());

DROP TABLE [product_image];

-- Sửa bảng product
ALTER TABLE [product]
ALTER COLUMN [image] NVARCHAR(255); -- Thay đổi kiểu dữ liệu thành NVARCHAR(255) để lưu trữ URL hình ảnh

-- Nếu bạn muốn lưu trữ nhiều URL hình ảnh, bạn có thể sử dụng TEXT hoặc JSON
-- Ví dụ:
-- ALTER TABLE [product]
-- ALTER COLUMN [image] TEXT; -- Hoặc NVARCHAR(MAX) hoặc JSON nếu bạn sử dụng SQL Server 2016 trở lên

-- Thêm cột create_at
ALTER TABLE [product]
ADD create_at DATE;