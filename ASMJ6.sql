USE MASTER --CHUYỂN CSDL MẶC ĐỊNH VỀ MASTER
GO --KẾT THÚC KHỐI LỆNH TRƯỚC
IF DB_ID('SHOESSHOPAG') IS NOT NULL --KIỂM TRA CSDL CẦN TẠO ĐÃ TỒN TẠI CHƯA
	DROP DATABASE SHOESSHOPAG --XÓA CSDL
GO
CREATE DATABASE SHOESSHOPAG;
GO
USE SHOESSHOPAG;
GO
CREATE TABLE hanggiays
(
	ma_hang INT IDENTITY(1,1) PRIMARY KEY,
	ten_hang NVARCHAR(50)
);

CREATE TABLE loaigiays
(
  ma_loai_giay INT IDENTITY(1,1) PRIMARY KEY,
  ten_loai NVARCHAR(20),
  gioi_tinh INT
);

CREATE TABLE giays
(
  ma_giay INT IDENTITY(1,1) PRIMARY KEY,
  ten_giay NVARCHAR(500),
  don_gia INT,
  giam_gia FLOAT,
  mo_ta NVARCHAR(MAX),
  hinh_anh VARCHAR(MAX),
  ma_loai_giay INT,
  ma_hang INT,  
  FOREIGN KEY (ma_loai_giay) REFERENCES loaigiays(ma_loai_giay),
  FOREIGN KEY (ma_hang) REFERENCES hanggiays(ma_hang)    
);

CREATE TABLE danhgias
(
	ma_danh_gia INT IDENTITY(1,1) PRIMARY KEY,
	email VARCHAR(100),
	ho_va_ten NVARCHAR(100),
	hinh VARCHAR(MAX),
	ngay_danh_gia VARCHAR(30),
	nhan_xet NVARCHAR(300),
	so_sao INT,
	ma_giay INT,
	FOREIGN KEY (ma_giay) REFERENCES giays(ma_giay)
);


CREATE TABLE quyens
(
	ma_quyen INT IDENTITY(1,1) PRIMARY KEY,
	ten_quyen NVARCHAR(100)
);

CREATE TABLE khachhangs
(
  tai_khoan VARCHAR(20),
  mat_khau VARCHAR(20),
  ten_khach_hang NVARCHAR(50),
  so_dien_thoai VARCHAR(20),
  dia_chi  NVARCHAR(MAX),
  ma_quyen INT,
  PRIMARY KEY (tai_khoan),
  FOREIGN KEY (ma_quyen) REFERENCES quyens(ma_quyen)
);

CREATE TABLE donhangs
(
  ma_don_hang INT IDENTITY(1,1) PRIMARY KEY,
  dia_chi NVARCHAR(300),
  ten_nguoi_nhan NVARCHAR(100),
  tong_tien INT,
  ghi_chu_khach_hang NVARCHAR(300),
  ghi_chu_admin NVARCHAR(300),
  ngay_dat_hang DateTime,
  trang_thai NVARCHAR(20),
  so_dien_thoai VARCHAR(15),
  tai_khoan VARCHAR(20),
  FOREIGN KEY (tai_khoan) REFERENCES khachhangs(tai_khoan)
);

CREATE TABLE chitietdonhangs
(
	ma_don_hang INT,
	ma_giay INT,
	so_luong INT,
	don_gia INT,
	PRIMARY KEY (ma_don_hang, ma_giay),
	FOREIGN KEY (ma_don_hang) REFERENCES donhangs(ma_don_hang),
	FOREIGN KEY (ma_giay) REFERENCES giays(ma_giay)
);

-- Thêm Hãng giày
INSERT INTO hanggiays(ten_hang)
VALUES ('Adidas'),
('Nike'),
('Vans'),
('Converse')

-- Thêm loại giày
INSERT INTO loaigiays(gioi_tinh,ten_loai)
VALUES (1,N'Nam'),
(2,N'Nữ'),
(3,N'Nam, Nữ')

-- Thêm Giày
INSERT INTO giays(ten_giay,don_gia,giam_gia,hinh_anh,
mo_ta,
ma_loai_giay,ma_hang)
VALUES (N'Giày Nike Air Force 1 Low GS Year of the Tiger DQ4502-171',4690000,0.2,'sp1_1.png',
N'Được thiết kế bởi Bruce Kilgore vào năm 1982 với ý tưởng đặt tên từ chiếc chuyên cơ chuyên chở tổng thống mỹ AIR FORCE ONE, AF1 đã nhanh chóng trở thành đôi giày mang tính cách mạng trong giới sneaker, sản phẩm được bán hết trong một thời gian kỷ lục. Cho dù đã gần 40 năm trôi qua NIKE AIR FORCE 1 vẫn đem lại hàng trăm triệu USD hàng năm cho NIKE.',
3,2),
(N'Giày nữ Nike Air Max 90 SE GS ‘Worldwide Pack – SEFA20’ CV7665-001',3690000,0.4,'sp2_1.png',
N'Được thiết kế lại cho các trang phục bình thường, Nike Air Max 90 NRG vẫn đúng với nguồn gốc hoạt động của những năm 90 với đế ngoài bằng cao su Waffle, các lớp phủ được khâu và các chi tiết TPU. Màu sắc mới táo bạo và các chi tiết tươi mới kết hợp với đệm Max Air cho phong cách và sự thoải mái hàng ngày.',
2,2),
(N'Giày Nike Air Jordan 1 Mid ‘Cream Grey’ DN4281-100',5590000,0.1,'sp3_1.png',
N'Nike Air Jordan 1 với lịch sử hơn 30 năm luôn được nhìn nhận như một trong những dòng sản phẩm thành công nhất của Nike. Nike Jordan 1 luôn bán hết một cách nhanh chóng ngay từ khi ra mắt đến nay, luôn là sản phẩm được các tín đồ thời trang chú ý hàng đầu. Air Jordan được đặt dựa theo ngôi sao bóng rổ lừng danh Michael Jordan – huyền thoại của NBA.',
1,2),
(N'Giày Adidas Ultraboost 21 ‘Blue Oxide’ FY3084',3290000,0.2,'sp4_1.png',
N'Hàng loạt bản mẫu. Hàng loạt cải tiến. Hàng loạt thử nghiệm. Đồng hành cùng chúng tôi trên hành trình tìm kiếm sự hòa hợp đỉnh cao giữa trọng lượng, sự êm ái và độ đàn hồi. Ultraboost 21. Đón chào nguồn năng lượng hoàn trả phi thường.',
1,1),
(N'Giày Adidas Originals 4D Fusio ‘Black Orange Pink’ FZ2414',4100000,0.2,'sp5_1.png',
N'Cam kết chính hãng 100% nhập từ ADIDAS US, UK, JP - Fake đền x10. GIÁ RẺ hơn các shop khác 15-20% - full box, tem, tag, giấy gói chính hãng.',
1,1),
(N'Giày Adidas UltraBoost 21 ‘White Glow Pink’ FY0396',4090000,0.2,'sp6_1.png',
N'Mua Giày Adidas Wmns UltraBoost 21 White Glow Pink FY0396 chính hãng 100%. Giao hàng miễn phí trong 1 ngày. Cam kết đền tiền X5 nếu phát hiện Fake. Đổi trả miễn phí size. FREE vệ sinh giày trọn đời. MUA NGAY!',
2,1),
(N'Giày Adidas NMD R1 V2 Brilliant ‘Basics White’ GV7557',3100000,0.1,'sp7_1.png',
N'Trong tiếng Anh, NOMAD có nghĩa là dân du cư, những người sống nay đây mai đó, ngao du thiên hạ. Từ đây chúng ta có thể hiểu rõ rằng Adidas NMD được sáng tạo nên từ tinh thần muốn trải nghiệm và khám phá cuộc sống thông qua những chuyến hành trình.',
3,1),
(N'Giày Vans Authentic Mule ‘Red’ VN0A54F7JV61',1590000,0.2,'sp8_1.png',
N'Nhiều người ấn tượng với cấu hình mỏng, trượt của Vans Old Skool Mule mang lại cho nó một lợi thế dễ mặc và cảm giác linh hoạt. Nó được ca ngợi vì sự thoải mái mà nó mang lại cho đôi chân, khiến nó trở thành một lựa chọn xứng đáng cho trang phục thường ngày. Số lượng đệm vừa đủ, dây đeo đàn hồi dưới lưỡi và phần trên có thể uốn cong giữ cho bàn chân được thoải mái giấu bên trong giày.',
3,3),
(N'Giày nữ Vans Comfycush Era ‘Strawberry Pink’ VN0A3WM9VNJ1',3000000,0.5,'sp9_1.jpg',
N'Với phối màu nhẹ nhàng, không quá chói chang - Vans Comfycush Era Strawberry Pink được Vans mang đến như một làn gió mới so với những sản phẩm trước đây từng được ra mắt. Vẫn giữ cho mình chất lượng tuyệt vời nhất, Vans Comfycush Era Strawberry Pink chắc chắn sẽ mang đến cho bạn một trải nghiệm vô cùng đặc biệt.',
2,3),
(N'Giày nam Vans Old Skool ‘White Flame’ VN0A4U3B2231',2900000,0.2,'sp10_1.png',
N'Ở thời điểm hiện, có lẽ cụm từ “Vans Off The Wall” đã không còn xa lạ gì với giới trẻ Việt Nam, khi chúng không chỉ là một slogan của một trong những thương hiệu thời trang hàng đầu đầu thế giới và được đặc biệt yêu thích tại Việt Nam, mà chúng còn là tượng trưng của một nền văn hóa đang ngày một phát triển và đi lên trong cộng đồng của các bạn trẻ yêu thích hip hop – văn hóa Streetwear (Trang phục đường phố), mẫu Vans #95 hay còn được gọi là Vans Era chính thức được ra mắt và nhanh chóng thành sự lựa chọn hàng đầu cho dân trượt ván thời điểm bấy giờ.',
1,3),
(N'Giày nữ Vans Slip-On ComfyCush ‘Checkerboard’ VN0A3WMDVO4',1900000,0.1,'sp11_1.jpg',
N'Có thể bạn không nhận ra được sự khác biệt của dòng giày ComfyCush so với các mẫu Classic nhà Vans đã xuất hiện cách đây hơn 50 năm. Bởi, các nhà thiết kế chỉ chú trọng việc tạo ra một sự thoải mái từ bên trong đôi giày và hoàn toàn giữ lại kiểu dáng kinh điển, truyền thống của 5 dòng giày: Vans Era, Authentic, Slip-On và Sk8-Hi. Ngoài ra, dòng giày hiện đại bậc nhất này còn có thêm các phiên bản mới bên cạnh phiên bản Classic với sự phối hợp về màu sắc, họa tiết khá lạ mắt và tươi trẻ.',
2,3),
(N'Giày Converse Natasha Cloud x Run Star Hike Inspired ‘Floral – Pink Quartz’ 571877C',2900000,0.1,'sp12_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
2,4),
(N'Giày Converse Chuck Taylor All Star Sunflower 670701C',1700000,0.1,'sp13_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
2,4),
(N'Giày Converse UNT1TL3D ‘Red-Grey-White’ 168636C',1400000,0.1,'sp14_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
1,4),
(N'Giày Converse Pro Leather High ‘Breaking Down Barries’ 170493C',2190000,0.1,'sp15_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
3,4),
(N'Giày Converse Chuck Taylor All Star High Top ‘Traveler’ 170851C',1700000,0.1,'sp16_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
3,4),
(N'Giày nam Converse Chuck 70 ‘Amarillo’ 170282C',4900000,0.4,'sp17_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
1,4),
(N'Giày nữ Converse Chuck Taylor All Star Platform Low 567855C',1400000,0.1,'sp18_1.png',
N'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
2,4),
(N'Giày Nike Air Jordan 1 Acclimate ‘Dusty Pink’ DC7723-500',5800000,0.1,'sp19_1.png',
N'Nike Air Jordan 1 với lịch sử hơn 30 năm luôn được nhìn nhận như một trong những dòng sản phẩm thành công nhất của Nike. Nike Jordan 1 luôn bán hết một cách nhanh chóng ngay từ khi ra mắt đến nay, luôn là sản phẩm được các tín đồ thời trang chú ý hàng đầu. Air Jordan được đặt dựa theo ngôi sao bóng rổ lừng danh Michael Jordan – huyền thoại của NBA.',
1,2),
(N'Giày Air Jordan Series.01 ‘Dear Larry’ CV8129-100',4900000,0.4,'sp20_1.png',
N'Với sự ra đời của mình, Jordan Series 01 đã tôn vinh hai người vĩ đại: bản thân MJ cũng như người anh trai Larry của huyền thoại. Điều này bắt đầu một xu hướng sẵn sàng chỉ tiếp tục, và hình ảnh sẽ chỉ làm điều đó với sự tôn kính sắp tới đối với Dean Smith.',
3,2),
(N'Giày bóng rổ nữ Jordan Why Not Zer0.4 PF GS ‘Upbringing’ DH0944-100',4000000,0.1,'sp21_1.png',
N'Why not Zer0.4 luôn mang đến một vẻ ngoài đầy sặc sỡ, với sự pha trộn táo bạo của nhiều phối màu, nhiều chất liệu cũng như các hoạ tiết độc đáo luôn thu hút được ánh nhìn và sự tò mò đến từ fan hâm mô giày bóng rổ.',
2,2),
(N'Giày Air Jordan 10 Retro ‘Seattle’ 2019 310805-137',7200000,0.5,'sp22_1.png',
N'Vào năm 1995, Nike đã bắt đầu release những đôi 10s vào mùa giải NBA 1994-1995, theo dòng chảy đó thì Nike cũng đã ra mắt series "City Pack" đầu tiên của mình. Và sau nhiều năm, thì mùa thu năm 2019, Nike đã phát hành đôi 10s "Seattle Supersonics" . Đôi giày đại diện cho thành phố Seattle và đôi Seattle Supersonics ( nay được biết đến là đội Oklahoma City Thunder).',
1,2),
(N'Giày Wmns Air Jordan MA2 ‘Light Bone Sunset Pulse’ CW5992-003',5900000,0.3,'sp23_1.jpg',
N'Wmns Air Jordan MA2 ‘Light Bone Sunset Pulse’ dành cho phụ nữ tạo thêm điểm nhấn sống động cho một đường màu trung tính khác của hình bóng phong cách sống. Phần trên kết hợp lưới màu ngà với lớp phủ da lộn tông màu và một vòng kéo màu hồng mờ dán ở cổ áo bên. Một màu hồng đậm hơn được áp dụng cho một tấm đá cao su có kết cấu ở gót chân, cho phép người mang giày đá bóng mà không cần dùng tay. Một điểm nhấn cuối cùng của màu sắc tương phản sẽ đến với đơn vị Max Air 200 dưới gót giày.',
2,2),
(N'Giày Wmns Jordan Delta Breathe ‘Purple Brilliant Green’ DJ5200-109',5600000,0.1,'sp24_1.png',
N'Ra mắt lần đầu vào năm ngoái, Jordan Delta Breathe đã trở thành một đôi giày phong cách sống thành công cho cả nam và nữ. Thêm vào dòng sản phẩm của mình, Jordan Brand tiết lộ một sản phẩm dành cho phụ nữ mới được trang bị các màu trắng, nhiều màu, bạc kim loại và đen. Làm nổi bật đôi giày là tông màu pastel Tím và Xanh lá đi kèm với hệ thống dây buộc bật tắt. Một đế đệm bọt React màu trắng hoàn thiện thiết kế.',
3,2)



INSERT INTO quyens
VALUES ('User'),
('Staff'),
('Admin')

INSERT INTO khachhangs
VALUES('thien','123456',N'Lê Công Thiên','0934868001',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',1),
('thien2','123456',N'Lê Công Thiên','0934868001',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',2),
('thien3','123456',N'Lê Công Thiên','0934868001',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',3),
('quoc','123456',N'Hồ Văn Quốc','0934868111',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',1),
('phuc','123456',N'Võ Hoàng Phúc','0934868122',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',1),
('phong','123456',N'Lê Viết Phong','0934868333',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',1),
('admin','123456',N'Admin','0393796446',N'137 Nguyễn Thị Thập, Liên Chiểu, Đà Nẵng',3)


INSERT INTO danhgias
VALUES ('thien@gmail.com',N'Lê Công Thiên','nam.jpg','03/08/2022',N'Sản phẩm rất đẹp',4,1),
('ngoc@gmail.com',N'Nguyễn Ngọc','nu.jpg','03/08/2022',N'Mình vừa mua 2 đôi rất ưng ý',5,1)

