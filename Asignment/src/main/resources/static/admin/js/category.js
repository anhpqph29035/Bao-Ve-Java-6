const host = "http://localhost:8080/rest/loaigiay";
const app = angular.module("CategoryApp", []);
app.controller("CategoryCtrl", function ($scope, $http) {
    $scope.listDanhMuc = [];
    $scope.load_all = function () {
        const url = `${host}`;
        $http.get(url).then((resp) => {
            $scope.listDanhMuc = resp.data;
            console.log("Sucsess", resp.data);
            $scope.pageNumber = 1;
            $scope.limit = 8;
            $scope.totalPage = getTotalPage($scope.listDanhMuc, $scope.limit);
        })
    }
    $scope.setLimit = (soSanPham) => {
        $scope.pageNumber = 1;
        $scope.limit = soSanPham;
        $scope.totalPage = getTotalPage($scope.listDanhMuc, $scope.limit);
    };
    $scope.setPageNumber = (pageNumber) => {
        $scope.pageNumber = pageNumber;
    };
    const getTotalPage = (arr, soSanPham) => {
        return Math.ceil(arr.length / soSanPham);
    };
    $scope.load_all();
    $scope.detail = (id) => {
        location.replace("/admin/category/detail?idDanhMuc=" + id);
    }
    $scope.deleteDanhMuc = (id) => {
        if (window.confirm("Bạn có chắc chắn muốn xoá danh mục có ID là : "+id)) {
            const idDanhMuc = id;
            const urlXoa = `${host}/${idDanhMuc}`;
            $http.delete(urlXoa).then(resp => {
                alert("Xóa thành công!");
                location.replace("/admin/category")
            }).catch((resp) => {
                alert("Không thể xoá do tồn tại sản phẩm có danh mục này!");
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