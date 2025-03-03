CREATE DATABASE controller_web;
USE controller_web;

CREATE TABLE [users] (
    [id] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [username] NVARCHAR(255) NOT NULL,
	[password] NVARCHAR(255) NOT NULL,
    [email] NVARCHAR(255) NOT NULL,
	[phone] NVARCHAR(15),
	[role] NVARCHAR(20)NOT NULL,
    [created_at] Date
);

CREATE TABLE [categories] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(255) NOT NULL
);

CREATE TABLE [products] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(255) NOT NULL,
    [price] DECIMAL(10,2) NOT NULL,
	[quantity] INT NOT NULL,
	[image] VARBINARY(MAX),  -- Dùng VARBINARY(MAX) để lưu ảnh
    [description] NVARCHAR(255),
    [category_id] INT FOREIGN KEY REFERENCES [categories]([id])
);

CREATE TABLE [discounts] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [code] NVARCHAR(50) NOT NULL,
    [percentage] INT NOT NULL,
    [valid_from] DATE NOT NULL,
	[valid_to] DATE NOT NULL,
	[create_at] DATE NOT NULL
);

CREATE TABLE [orders] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [users]([id]),
    [discount_id] INT FOREIGN KEY REFERENCES [discounts]([id]) NULL,
    [total_price] DECIMAL(10,2) NOT NULL,
    [status] NVARCHAR(50) NOT NULL,
    [created_at] DATE
);

CREATE TABLE [order_details] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [order_id] INT FOREIGN KEY REFERENCES [orders]([id]),
    [product_id] INT FOREIGN KEY REFERENCES [products]([id]),
    [quantity] INT NOT NULL,
    [price] DECIMAL(10,2) NOT NULL
);

CREATE TABLE [payments] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [order_id] INT FOREIGN KEY REFERENCES [orders]([id]),
    [payment_method] NVARCHAR(50) NOT NULL,
    [status] NVARCHAR(50) NOT NULL,
    [created_at] DATE
);

CREATE TABLE [reviews] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [users]([id]),
    [product_id] INT FOREIGN KEY REFERENCES [products]([id]),
    [rating] INT NOT NULL,
    [comment] NVARCHAR(255),
    [created_at] DATE
);

CREATE TABLE [wishlist] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [users]([id]),
    [product_id] INT FOREIGN KEY REFERENCES [products]([id]),
    [created_at] DATE
);

CREATE TABLE [cart] (
    [id] INT PRIMARY KEY IDENTITY(1,1),
    [user_id] UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES [users]([id]),  
    [product_id] INT NOT NULL FOREIGN KEY REFERENCES [products]([id]), 
    [quantity] INT NOT NULL
);

-- Thêm dữ liệu vào bảng categories
INSERT INTO [categories] ([name]) 
VALUES 
('Tay cầm chơi game'),
('Phụ kiện máy tính');

-- Thêm dữ liệu vào bảng users
INSERT INTO [users] ([username], [password], [email], [phone], [role], [created_at]) 
VALUES 
('admin', 'password123', 'admin@example.com', '0901234567', 'admin', '2025-10-05'),
('user2', 'password123', 'user2@example.com', '0901234568', 'user', '2025-10-10'),
('user3', 'password123', 'user3@example.com', '0901234569', 'user', '2025-10-15'),
('user4', 'password123', 'user4@example.com', '0901234570', 'user', '2025-10-20'),
('user5', 'password123', 'user5@example.com', '0901234571', 'user', '2025-10-25');

-- Thêm dữ liệu vào bảng products
INSERT INTO [products] ([name], [price], [quantity], [image], [description], [category_id]) 
VALUES
('Tay Cầm Chơi Game Xbox Wireless Controller', 1500.00, 100, 0x1234567890, 'Tay cầm chơi game Xbox, kết nối không dây, chất lượng cao', 1),
('Tay Cầm Chơi Game PlayStation DualSense', 1700.00, 80, 0x9876543210, 'Tay cầm DualSense cho PlayStation, phản hồi xúc giác, thiết kế hiện đại', 1),
('Tay Cầm Chơi Game Logitech F310', 500.00, 150, 0xabcdef1234, 'Tay cầm Logitech F310, kết nối USB, bền bỉ', 1),
('Tay Cầm Chơi Game Nintendo Switch Pro', 2000.00, 70, 0x0a1b2c3d4e, 'Tay cầm Nintendo Switch Pro, chơi game mượt mà, kết nối không dây', 1),
('Tay Cầm Chơi Game Razer Wolverine V2', 2500.00, 60, 0x6789abcd12, 'Tay cầm Razer Wolverine V2, điều khiển chính xác, thiết kế mạnh mẽ', 1),
('Tay Cầm Chơi Game SteelSeries Stratus+', 1200.00, 90, 0x1122334455, 'Tay cầm SteelSeries Stratus+, chơi game không dây, tương thích Android', 1),
('Tay Cầm Chơi Game Hori Onyx Wireless', 1300.00, 85, 0x5566778899, 'Tay cầm Hori Onyx Wireless, kết nối ổn định, dễ sử dụng', 1),
('Tay Cầm Chơi Game Thrustmaster eSwap X Pro', 1800.00, 65, 0xa1b2c3d4e5, 'Tay cầm Thrustmaster eSwap X Pro, tùy chỉnh nút, độ bền cao', 1),
('Tay Cầm Chơi Game PDP Afterglow', 1400.00, 110, 0xabcdef5678, 'Tay cầm PDP Afterglow, đèn LED màu sắc, thiết kế đẹp', 1),
('Tay Cầm Chơi Game 8BitDo SN30 Pro', 1200.00, 95, 0x1a2b3c4d5e, 'Tay cầm 8BitDo SN30 Pro, retro, tương thích đa nền tảng', 1);

-- Thêm dữ liệu vào bảng reviews
INSERT INTO [reviews] ([user_id], [product_id], [rating], [comment], [created_at]) 
VALUES 
((SELECT id FROM [users] WHERE [username] = 'admin'), 1, 5, 'Tay cầm tuyệt vời, rất nhạy!', '2025-10-05'),
((SELECT id FROM [users] WHERE [username] = 'user2'), 2, 4, 'Giá trị tốt cho tiền.', '2025-10-07'),
((SELECT id FROM [users] WHERE [username] = 'user3'), 3, 3, 'Ổn nhưng chất lượng có thể cải thiện.', '2025-10-10'),
((SELECT id FROM [users] WHERE [username] = 'user4'), 4, 5, 'Sản phẩm tuyệt vời, rất thoải mái!', '2025-10-12'),
((SELECT id FROM [users] WHERE [username] = 'user5'), 5, 4, 'Chất lượng tốt, nhưng hơi đắt.', '2025-10-14');

-- Thêm dữ liệu vào bảng wishlist
INSERT INTO [wishlist] ([user_id], [product_id], [created_at]) 
VALUES 
((SELECT id FROM [users] WHERE [username] = 'admin'), 1, '2025-10-05'),
((SELECT id FROM [users] WHERE [username] = 'user2'), 2, '2025-10-06'),
((SELECT id FROM [users] WHERE [username] = 'user3'), 3, '2025-10-08'),
((SELECT id FROM [users] WHERE [username] = 'user4'), 4, '2025-10-11'),
((SELECT id FROM [users] WHERE [username] = 'user5'), 5, '2025-10-13');

-- Thêm dữ liệu vào bảng cart
INSERT INTO [cart] ([user_id], [product_id], [quantity]) 
VALUES 
((SELECT id FROM [users] WHERE [username] = 'admin'), 1, 1),
((SELECT id FROM [users] WHERE [username] = 'user2'), 2, 2),
((SELECT id FROM [users] WHERE [username] = 'user3'), 3, 1),
((SELECT id FROM [users] WHERE [username] = 'user4'), 4, 3),
((SELECT id FROM [users] WHERE [username] = 'user5'), 5, 2);