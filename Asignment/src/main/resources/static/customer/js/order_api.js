const host = "http://localhost:8080/rest";
const app = angular.module("OrderApp", []);
app.controller("OrderCtrl", function ($scope, $http) {
    //Checklogin  
    let sessionLogin = sessionStorage.getItem("User");
    if (sessionLogin != null) {
        $scope.username = sessionLogin;
        $scope.login = true;
    } else {
        $scope.login = false;
        location.replace("/index");
    }
    $scope.logout = () => {
        sessionStorage.clear();
        location.replace("/index");
    };
    const getSoLuongGioHang = () => {
        const gioHang = JSON.parse(localStorage.getItem(sessionLogin));
        console.log("gioHang", gioHang)
        let soLuongGioHang = 0;
        if (gioHang != null) {
            soLuongGioHang = gioHang.reduce((accum, item) => accum + item.soLuong, 0)
        }
        return soLuongGioHang;
    };
    if (getSoLuongGioHang() == 0) {
        location.replace("/index");
    }
    $scope.srcImage = `http://localhost:8080/rest/files/images`;
    $scope.soLuongGioHang = getSoLuongGioHang();
    $scope.loadAll = () => {
        const id = $scope.username;
        const url = `${host}/khachhang/${id}`;
        $http.get(url).then((resp) => {
            $scope.khachHang = resp.data;
        })
    };
    $scope.listDonHang = JSON.parse(localStorage.getItem(sessionLogin));
    $scope.getTongTien = () => {
        let tongTien = 0;
        $scope.listDonHang.forEach((item) => {
            tongTien += item.giay.donGia * item.soLuong;
        });
        return tongTien + 12000;
    };
    addDays = (date, days) => {
        var result = new Date(date);
        result.setDate(result.getDate() + days);
        return result;
    }
    $scope.ngayGiaoDuKien = addDays(new Date(), 5);
    $scope.datHang = () => {
        if (window.confirm("Bạn có chắc chắn muốn thanh toán đơn hàng ?")) {
        const hoaDon = {};
        hoaDon.diaChi = $scope.khachHang.diaChi;
        hoaDon.tenNguoiNhan = $scope.khachHang.tenKhachHang;
        hoaDon.tongTien = $scope.getTongTien();
        hoaDon.ghiChuKhachHang = $scope.ghiChuKhachHang;
        hoaDon.ngayDatHang = new Date();
        hoaDon.trangThai = "Chưa giao";
        hoaDon.soDienThoai = $scope.khachHang.soDienThoai;
        hoaDon.khachHang = $scope.khachHang;
        const url = `${host}/hoadon`;
        $http.post(url, hoaDon).then((resp) => {
            const donHang = resp.data;
            $scope.listDonHang.forEach(item => {
                const chiTietHoaDon = {};
                const chiTietHoaDonPK = {};
                chiTietHoaDonPK.maDonHang = donHang.maDonHang;
                chiTietHoaDonPK.maGiay = item.giay.maGiay;
                chiTietHoaDon.id = chiTietHoaDonPK;
                chiTietHoaDon.soLuong = item.soLuong;
                chiTietHoaDon.donGia = item.giay.donGia;
                const urlChiTietHoaDon = `${host}/chitiethoadon`;
                $http.post(urlChiTietHoaDon, chiTietHoaDon).then((respchitiet) => {
                    console.log("respchitiet", respchitiet)
                })
            });
            alert("Đặt hàng thành công! Bạn sẽ trở lại trang mua sắm");
            localStorage.clear();
            location.replace("/index");
        })
        }
    }
    $scope.loadAll();
});