const host = "http://localhost:8080/rest/khachhang";
const app = angular.module("OrderApp", []);
app.controller("OrderCtrl", function ($scope, $http) {
    $scope.srcImage = `http://localhost:8080/rest/files/images`;
    $scope.listKhachHang = [];
    $scope.load_all = function () {
        const url = `${host}`;
        $http.get(url).then((resp) => {
            $scope.listKhachHang = resp.data;
            console.log("Sucsess", resp.data);
            $scope.pageNumber = 1;
            $scope.limit = 8;
            $scope.totalPage = getTotalPage($scope.listKhachHang, $scope.limit);
        })
    }
    $scope.setLimit = (soSanPham) => {
        $scope.pageNumber = 1;
        $scope.limit = soSanPham;
        $scope.totalPage = getTotalPage($scope.listKhachHang, $scope.limit);
    };
    $scope.setPageNumber = (pageNumber) => {
        $scope.pageNumber = pageNumber;
    };
    const getTotalPage = (arr, soSanPham) => {
        return Math.ceil(arr.length / soSanPham);
    };
    $scope.load_all();
    $scope.detail = (id) => {
        // location.replace("./orderdetail.html?idHoaDon=" + id);
    };
    $scope.deleteKhachHang = (id) => {
        if (window.confirm("Bạn có chắc chắn muốn xoá khách hàng có tài khoản là : "+id)){
            const idKhachHang = id;
            const urlXoa = `${host}/${idKhachHang}`;
            $http.delete(urlXoa).then(resp => {
                alert("Xóa thành công!");
                location.replace("/admin/customer")
            }).catch((resp)=>{
                alert("Không thể xoá !");
            });
        }
    }
});
app.filter('range', function () {
    return function (input, total) {
        total = parseInt(total);

        for (var i = 0; i < total; i++) {
            input.push(i);
        }

        return input;
    };
});