const host = "http://localhost:8080/rest/loaigiay";
const app = angular.module("DetailCategoryApp", []);
app.controller("DetailCategoryCtrl", function ($scope, $http) {
    $scope.checkInsert = false;
    //Lấy URL hiện tại
    const urlCurrent = new URL(location.href);
    // Lấy param
    const idDanhMuc = urlCurrent.searchParams.get("idDanhMuc");
    const url = `${host}/${idDanhMuc}`;
    $scope.load_all = function () {
        console.log("idDanhMuc", idDanhMuc);
        $http.get(url).then((resp) => {
            $scope.danhMuc = resp.data;
            console.log("Sucsess", resp.data);
        })
    }
    $scope.delete = function (filename) {
        $http.delete(url).then(resp => {
            console.log("Đã xóa", resp.data);
            alert("Tồn tại khoá ngoại không thể xoá!")
        }).catch(error => {
            alert("Tồn tại khoá ngoại không thể xoá!")
            console.log("Error", error);
        });
    }
    $scope.updateDanhMuc = (danhMuc) => {
        $http.put(url, danhMuc).then(resp => {
            alert("Sửa thành công!");
            console.log("sucesss", resp.data)
        })
    };
    $scope.insertDanhMuc = (danhMuc) => {
        $http.post(host, danhMuc).then(resp => {
            alert("Thêm mới thành công!");
            console.log("sucesss", resp.data)
        })
    }
    $scope.deleteDanhMuc = (id) => {
        $http.delete(url).then(resp => {
            alert("Xóa thành công!");
            location.replace("/admin/category")
        }).catch((resp)=>{
            alert("Không thể xoá do tồn tại sản phẩm có danh mục này!");
        });
    }
    $scope.reset = () => {
        $scope.danhMuc = null;
        $scope.checkInsert = true;
    }
    $scope.load_all();
});