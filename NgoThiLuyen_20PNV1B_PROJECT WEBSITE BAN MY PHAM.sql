drop database Luyenngo;

create database Luyenngo;
use Luyenngo;
create table DanhmucSanPham(
MaDM varchar(10) primary key,
TenDM varchar(30));

insert into DanhmucSanPham
values
('DM1', 'Trang diem'),
('DM2', 'Duong da mat'),
('DM3', 'Thuc pham chuc nang'),
('DM4', 'Duong body'),
('DM5', 'Dung cu lam dep'),
('DM6', 'Nuoc hoa');


create table SanPham(
Masp varchar(10) primary key,
MaDM varchar(10),
Tensp varchar(80),
Mota varchar (80),
foreign key (MaDM) references DanhmucSanPham(MaDM)
);

insert into SanPham
values
('SP1', 'DM1', 'Phan mat','Bo 14 mau'),
('SP2', 'DM2', 'Tinh chat duong trang Olay','Duong trang da mat dung tich 30ml'),
('SP3', 'DM3', 'Vien uong trang da Vitamin C','Chua duong chat giup tre hoa lan da, hop 120 vien'),
('SP4', 'DM4', 'Kem duong trang body', 'Duoc lam tu thien nhien'),
('SP5', 'DM5', 'Bo trang diem mini','Gom bay loai co, mem min'),
('SP6', 'DM4', 'Tay te bao chet body', 'Lam tu ca phe'),
('SP7', 'DM3', 'Vien uong chong lao hoa ', 'Xuat khau tu nuoc ngoai'),
('SP8', 'DM2', 'Kem duong am cao cap ', 'Tinh chat duong tu lua mach '),
('SP9', 'DM1', 'Phan mat', 'Lam tu thien nhien'),
('SP10', 'DM5', 'Mut trang diem', 'Lam tu to tam');

create table NhaCungCap(
MaNCC varchar(10) primary key,
TenNCC varchar(30),
DiaChi varchar(100),
DienThoai varchar(15),
Email varchar(50)
);
insert into NhaCungCap
values
('NCC1', 'CTCP My Pham Quynh Anh','Da Nang','096345698', 'quynhanh23@gmail.com'),
('NCC2', 'CSSX Thuy Tien','Quang Binh','096345696', 'thuytien30@gmail.com'),
('NCC3', 'CTCP Olay','Da Nang','091125692', 'Olaymini@gmail.com'),
('NCC4', 'CTCP Krail','Quang Nam','096345695', 'Klail40@gmail.com');

create table NhanVien(
 MaNV varchar(10) primary key,
 TenNV varchar(30),
 UseName varchar(50),
 Password_NV varchar(50));

insert into NhanVien
values
('NV1', 'Ngo Thi Luyen','LuyenNgo','Luyenngo3121'),
('NV2', 'Nguyen Van Linh','Linhnguyen','Linhnguyen09345'),
('NV3', 'Ngo Thi Hoa','Hoango','Hoango12975'),
('NV4', 'Nguyen The Anh','Theanh','Theanh09345'),
('NV5', 'Ngo Thi Nhai','Nhaingo','Nhaingo12975');

 create table HoaDonNhap(
 MaHD varchar(10) primary key,
 Ngaynhap datetime,
 Masp varchar(10),
 MaNCC varchar(10),
 MaNV varchar(10),
 MaHDN varchar(10),
 Ghichu varchar(100),
foreign key (MaNCC) references NhaCungCap(MaNCC),
foreign key (MaNV) references NhanVien(MaNV),
foreign key (Masp) references SanPham(Masp),
foreign key (MaHDN) references ChiTietHDN(MaHDN)
);

insert into HoaDonNhap
values
('HN1', '2021-12-03','SP1', 'NCC1','NV1','HK1',' Nhap muon ngay'),
('HN2', '2020-09-04', 'SP2','NCC2','NV2','HK2',' Nhap hang moi '),
('HN3', '2020-07-10', 'SP3','NCC3','NV3','HK3',' Nhap hang ma 101'),
('HN4', '2021-02-20', 'SP4','NCC3','NV4','HK4',' Nhap hang tu cong ty'),
('HN5', '2021-11-03', 'SP2','NCC3','NV4','HK5',' Nhap dung ngay'),
('HN6', '2021-20-02', 'SP1','NCC2','NV4','HK1',' Nhap muon ngay'),
('HN7', '2021-09-07', 'SP6','NCC1','NV3','HK2',' Nhap dung ngay'),
('HN8', '2020-05-05', 'SP7','NCC1','NV2','HK4',' Nhap dung ngay');

create table ChiTietHDN(
MaHDN varchar(10) primary key,
Masp varchar(10),
Soluong int,
Gia decimal(10,2),
foreign key (Masp) references SanPham(Masp));
insert into ChiTietHDN
values
('HK1', 'SP1','50',' 200000'),
('HK2', 'SP2','20','300000'),
('HK3', 'SP3','30','400000'),
('HK4', 'SP2','40','350000'),
('HK5', 'SP4','22',' 500000');

create table HoaDonXuat(
MaHD varchar(10) primary key,
Ngayxuat Datetime,
MaKH varchar(10),
MaNV varchar(10),
MaHDX varchar(10),
Ghichu varchar(100),
foreign key (MaNV) references NhanVien(MaNV),
foreign key (MaKH) references KhachHang(MaKH),
foreign key (MaHDX) references ChiTietHDX(MaHDX)
);
insert into HoaDonXuat
values
('HX1', '2021-12-04', 'KH1','NV1','HT2','Xuat dung ngay'),
('HX2', '2020-09-03', 'KH2','NV2','HT2','Xuat dung ngay'),
('HX3', '2021-11-20', 'KH3','NV3','HT3','Xuat som hon 1 ngay'),
('HX4', '2020-06-18', 'KH4','NV4','HT4','Xuat muon do su co'),
('HX5', '2021-03-23', 'KH5','NV5','HT5','Xuat dung ngay');
Create table ChiTietHDX(
MaHDX varchar(10) primary key,
Masp varchar(10),
Soluong int,
Gia decimal(10,2),
foreign key (Masp) references SanPham(Masp)
);
insert into ChiTietHDX
values
('HT1', 'SP1','40',' 300000'),
('HT2', 'SP2','20','400000'),
('HT3', 'SP3','10','500000'),
('HT4', 'SP4','30',' 450000'),
('HT5', 'SP5','10',' 600000');
create table KhachHang(
MaKH varchar(10) primary key,
TenKH varchar(30),
UseName varchar(20),
Password_KH varchar(20));
insert into KhachHang
values 
('KH1', 'Le Thi Thuy', 'ThuyLe123','ThuyLe12321'),
('KH2', 'Tran Thi Tuyet', 'Tuyettran123','Tuyettran12386'),
('KH3', 'Le Thi Thanh Binh', 'Thanhbinh123','Thanhbinh12'),
('KH4', 'Bui Van Le', 'Vanle123','Vanle12387'),
('KH5', 'Ngo Ba Dat', 'Dat123','Dat12367');
select*from DanhmucSanPham;
select*from SanPham;
select*from NhaCungCap;
select*from NhanVien;
select*from HoaDonNhap;
select*from ChiTietHDN;
select*from HoaDonXuat;
select*from ChiTietHDX;
select *from  KhachHang;
-- TẠO VIEW --
-- 1. Cho biết sản phẩm có doanh số xuất lớn nhất-- 
create view Doanhso as
	select sanpham.masp, sanpham.tensp, sum(chitiethdx.soluong) as doanhso
	from chitiethdx 
		join sanpham on sanpham.Masp=chitiethdx.Masp
	group by sanpham.masp
	order by doanhthu desc;
select*from Doanhthu;

create view Max_doanhso as 
	select Masp, Tensp, doanhso
    from Doanhthu
    where doanhthu = (select max(doanhso) from Doanhso);
select*from Max_doanhthu;

-- 2. Tính doanh thu sản phẩm bán theo ngày --
create view Doanh_thu_ngay as
select Ngayxuat, sum(gia*soluong) as Doanh_thu_ngay
from  HoaDonXuat  join ChiTietHDX on HoaDonXuat.MaHDX=ChiTietHDX.MaHDX
group by Ngayxuat;
select*from Doanh_thu_ngay;

-- 3. Tổng Hợp Thông Tin Về Các Sản phẩm Đã Được Bán Trong Ngày 2021-12-04 --
create view Thongtin_sp as
select*from SanPham
where Masp in( select Masp
              from ChiTietHDX join HoaDonXuat on ChiTietHDX.MaHDX =  HoaDonXuat.MaHDX
               where day (Ngayxuat)='04'
                     and month(Ngayxuat)='12'
                     and year(Ngayxuat)='2021'
              );
select*from Thongtin_sp;

-- 4.Tạo View Tổng Hợp Thông Tin Về Các Khách Hàng Đã Mua Hàng Trong Ngày 2020-09-03  --
create view thongtin_KH as
select*from KhachHang
where MaKH in ( select MaKH
               from HoaDonXuat join ChiTietHDX on HoaDonXuat.MaHDX=ChiTietHDX.MaHDX
              where day(Ngayxuat)='03'
                     and month(Ngayxuat)='09'
                     and year(Ngayxuat)='2020' );
 select*from thongtin_KH; 
 
 -- 5. Đếm số lần mua của khách hàng--
 create view solanmua_KH as
 select HoaDonXuat.MaKH AS MaKH,count(HoaDonXuat.MaKH) AS so_lan_mua 
 from HoaDonXuat
 group by HoaDonXuat.MaKH;
 select *from solanmua_KH;
 
-- 6. Hiển thị khách hàng mua nhiều nhất  --
create view solanmua_NN as
select hoadonxuat.MaKH AS MaKH,count(hoadonxuat.MaKH) AS so_lan_mua_nhieu_nhat
from hoadonxuat 
group by hoadonxuat.MaKH 
order by count(hoadonxuat.MaKH) desc limit 1;
select*from solanmua_NN;

-- 7. Cho biết thông tin nhà cung cấp chưa nhập hàng bao giờ.
create view Kiemtra_NCC as 
select nhacungcap.MaNCC, nhacungcap.TenNCC, nhacungcap.DiaChi from nhacungcap
where nhacungcap.MaNCC not in (select MaNCC from hoadonnhap);
select*from Kiemtra_NCC;

-- 8. Cho biết thông tin nhân viên chưa nhập hàng bao giờ 
create view Kiemtra_NV as 
select  nhanvien.MaNV, nhanvien.TenNV from NhanVien 
where  nhanvien.MaNV not in (select MaNV from hoadonnhap);
select*from Kiemtra_NV;


-- TẠO PROCEDURE --
-- 1. Thêm Khách hàng --
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert _khachhang`(IN `MKH` VARCHAR(10), IN `TKH` VARCHAR(30), IN `UName` VARCHAR(20), IN `P_KH` VARCHAR(20))
insert into khachhang (MaKH,TenKH, UseName, Password_KH )
values (MKH,TKH, UName, P_KH)$$
DELIMITER ;
-- 2. Xóa khách hàng ---
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Xoa_KhachHang`(IN `Nhap` VARCHAR(6))
bEGIN
	set FOREIGN_key_checks =0;
	DELETE from khachhang WHERE MaKH=Nhap;
    set FOREIGN_key_checks =1;
    SELECT*FROM khachhang;
END$$
DELIMITER ;

-- 2. Tính doanh thu từng tháng----
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `doanhthu_thangg`(IN `thang` INT)
select month(hoadonxuat.Ngayxuat) as thang,sum(chitiethdx.Gia*chitiethdx.Soluong) as Doanhthuthang
    from hoadonxuat join chitiethdx on chitiethdx.MaHDX=hoadonxuat.MaHDX
    where month(hoadonxuat.Ngayxuat)= thang
    group by thang$$
DELIMITER ;
-- 3. Tạo procedure nhập vào tháng tính doanh thu sản phẩm bán chạy nhất -- 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Doanhthu_MAX`(IN `thang` INT)
select sanpham.Masp, sanpham.Tensp, sum(chitiethdx.Gia*chitiethdx.soluong) as DTSPLN
    from hoadonxuat join chitiethdx on chitiethdx.MaHDX=hoadonxuat.MaHDX
    where month(hoadonxuat.Ngayxuat)= thang
    group by thang, sanpham.Masp$$
DELIMITER ;
-- 4. Tạo produce nhập vào tháng, năm tính số lượng sản phẩm bán chạy nhất(doanh số bán của sản phẩm đó)--
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Doanhso_MAX`(IN `thang` INT, IN `nam` INT)
select year(hoadonxuat.Ngayxuat) as nam ,month(hoadonxuat.Ngayxuat) as thang, chitiethdx.Masp,sum(chitiethdx.soluong) as Doanhso
    from hoadonxuat join chitiethdx on chitiethdx.MaHDX=hoadonxuat.MaHDX
    where month(hoadonxuat.Ngayxuat)= thang and year(hoadonxuat.Ngayxuat)=nam 
    group by nam, thang, Masp$$
DELIMITER ;

-- 5. Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một mặt hàng có mã bất kỳ --
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Tong_sp`(IN `n` VARCHAR(30))
SELECT SanPham.Masp,Tensp,
       SUM(ChiTietHDX.Soluong) AS 'Tong so luong'
       FROM SanPham LEFT JOIN ChiTietHDX
       ON SanPham.Masp=ChiTietHDX.Masp WHERE SanPham.Masp= n
       GROUP BY SanPham.Masp,Tensp$$
DELIMITER ;

-- 6.  Tìm kiếm sản phẩm theo id được truyền vào --
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Timkiem_sptm`(IN `msp` VARCHAR(30))
begin
set @kq = (select tensp from sanpham
              where Masp = msp);
if @kq is null then 
	signal SQLSTATE '45000'
    set MESSAGE_TEXT = 'Sản phẩm không tồn tại!';
else 
	select @kq as Ketqua;
end if;
end$$
DELIMITER ;
-- TẠO INDEXT CHO CÂU 6--
CREATE INDEX idx_msp
ON sanpham (masp);

-- TẠO TRiGGER-- 
-- 1. Kiểm tra ngày nhập nếu lớn hơn ngày hiện tạo thì báo lỗi --
CREATE TRIGGER `check_date` BEFORE INSERT ON `hoadonnhap`
 FOR EACH ROW if new.Ngaynhap>now() then 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NHAP NGAY QUA VOI NGAY HIEN TAI'
end IF
-- 2. Kiểm tra MaDM nhập vào nếu không tồn tại trong bảng danh mục thì báo lỗi --
CREATE TRIGGER `Check_MaDM` BEFORE INSERT ON `sanpham`
 FOR EACH ROW if new.MaDM not in (SELECT MaDM from danhmucsanpham)
    THEN SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT='MA DM NAY KHONG TON TAI'; 
    END IF
-- 3. Kiểm tra ngày xuất nếu lớn hơn ngày hiện tại thì báo lỗi ---
CREATE TRIGGER `Check_day` BEFORE INSERT ON `hoadonxuat`
 FOR EACH ROW if new.Ngayxuat>now() then 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NHAP NGAY QUA VOI NGAY HIEN TAI';
end IF
-- TẠO FUNCTION --
-- 1.Tinh hang ton kho ---
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `TonKho`(`Nhap` VARCHAR(10)) RETURNS int(11)
BEGIN
DECLARE ton int (11);
set ton=(select chitiethdn.Soluong- chitiethdx.Soluong
       from chitiethdn, chitiethdx
       where chitiethdn.MaSP=chitiethdx.MaSP and chitiethdn.MaSP= nhap);
return ton;
END$$
DELIMITER ;
-- 2 Đếm số lần mua của khách hàng---
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `hien_so_lan_mua_KH`(`KH_id` VARCHAR(10)) RETURNS int(11)
begin 
return (SELECT count(hoadonxuat.MaKH) from hoadonxuat
        where hoadonxuat.MaKH=KH_id
        Group By hoadonxuat.MaKH);
 end$$
DELIMITER ;

---3. Đếm số lần cung cấp của nhà cung cấp --
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `hien_so_lan_cungcap_NCC`(`NCC_id` VARCHAR(10)) RETURNS int(11)
begin 
return (SELECT count(hoadonnhap.MaNCC) from hoadonnhap
        where hoadonnhap.MaNCC=NCC_id
        Group By hoadonnhap.MaNCC);
 end$$
DELIMITER ;
