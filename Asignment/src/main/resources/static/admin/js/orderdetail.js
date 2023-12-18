const host = "http://localhost:8080/rest";
const app = angular.module("OrderDetailApp", []);
app.controller("OrderDetailCtrl", function ($scope, $http) {
    $scope.srcImage = `http://localhost:8080/rest/files/images`;
     //Lấy URL hiện tại
     const urlCurrent = new URL(location.href);
     // Lấy param
     const idHoaDon = urlCurrent.searchParams.get("idHoaDon");
    $scope.load_all = function () {
        const urlHoaDon = `${host}/hoadon/${idHoaDon}`;
        $http.get(urlHoaDon).then((resp) => {
            $scope.donHang=resp.data;
            console.log("Sucsess", resp.data);
        });
        const urlHoaDonChiTiet = `${host}/chitiethoadon/${idHoaDon}`;
        $http.get(urlHoaDonChiTiet).then((resp) => {
            $scope.listChiTietHoaDon=resp.data;
            console.log("Sucsess", resp.data);
        });

    }

    $scope.saveOrderDetail = function (donHang) {
       const idHoaDon = urlCurrent.searchParams.get("idHoaDon");
       const url = `${host}/hoadon/${idHoaDon}`;
       $http.put(url, donHang).then(resp => {
           alert("Sửa thành công!");
           console.log("sucesss", resp.data)
       })
    }
    $scope.load_all();
    
});