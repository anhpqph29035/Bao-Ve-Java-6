const host = "http://localhost:8080/rest";
const app = angular.module("DetailApp", []);
app.controller("DetailCtrl", function ($scope, $http) {
    const urlImage = `http://localhost:8080/rest/files/images`;
    $scope.checkInsert = false;
    $scope.srcImage = urlImage;
    $scope.load_all = function () {
        //Lấy URL hiện tại
        const urlCurrent = new URL(location.href);
        // Lấy param
        const idGiay = urlCurrent.searchParams.get("idGiay");
        console.log("idGiay", idGiay);
        const url = `${host}/giay/${idGiay}`;
        $http.get(url).then((resp) => {
            $scope.giay = resp.data;
            $scope.tenHinhAnh = $scope.giay.hinhAnh;
            console.log("Sucsess", resp.data);
        })
        const urlLoaiGiay = `${host}/loaigiay`;
        $http.get(urlLoaiGiay).then((resp) => {
            $scope.listLoaiGiay = resp.data;
        })
        const urlHangGiay = `${host}/hanggiay`;
        $http.get(urlHangGiay).then((resp) => {
            $scope.listHangGiay = resp.data;
        })
    }
    $scope.upload = (files) => {
        const form = new FormData();
        for (let i = 0; i < files.length; i++) {
            form.append("files", files[i]);
        }
        $http.post(urlImage, form, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.tenHinhAnh = resp.data[0];
            console.log("sucesss", resp.data[0])
        }).catch(error => {
            console.log("Error", error);
        });
    }
    $scope.delete = function (filename) {
        $http.delete(`${urlImage}/${filename}`).then(resp => {
            console.log("Đã xóa", resp.data);
        }).catch(error => {
            console.log("Error", error);
        });
    }
    $scope.updateGiay = (giay) => {
        giay.hinhAnh = $scope.tenHinhAnh;
        giay.giamGia = document.getElementById("giamGia").value / 100;
        const viTriLoaiGiay = document.getElementById("loaiGiaySelected").value.slice(7, 8);
        giay.loaiGiay = $scope.listLoaiGiay[viTriLoaiGiay - 1];
        const viTriHangGiay = document.getElementById("hangGiaySelected").value.slice(7, 8);
        giay.hangGiay = $scope.listHangGiay[viTriHangGiay - 1];
        //Lấy URL hiện tại
        const urlCurrent = new URL(location.href);
        // Lấy param
        const idGiay = urlCurrent.searchParams.get("idGiay");
        console.log("idGiay", idGiay);
        const url = `${host}/giay/${idGiay}`;
        $http.put(url, giay).then(resp => {
            alert("Sửa thành công!");
            console.log("sucesss", resp.data)
        })
    };
    $scope.insertGiay = (giay) => {
        if (window.confirm("Bạn có chắc chắn muốn thêm giày mới không ?")){
        giay.hinhAnh = $scope.tenHinhAnh;
        giay.giamGia = document.getElementById("giamGia").value / 100;
        const viTriLoaiGiay = document.getElementById("loaiGiaySelected").value.slice(7, 8);
        giay.loaiGiay = $scope.listLoaiGiay[viTriLoaiGiay - 1];
        const viTriHangGiay = document.getElementById("hangGiaySelected").value.slice(7, 8);
        giay.hangGiay = $scope.listHangGiay[viTriHangGiay - 1];
        const url = `${host}/giay`;
        $http.post(url, giay).then(resp => {
            alert("Thêm mới thành công!");
            location.replace("/admin/index")
            console.log("sucesss", resp.data)
        })
        }
    }
    $scope.deleteGiay = (id) => {
        if (window.confirm("Bạn có chắc chắn muốn xoá giày có ID là : "+id)){
        const urlGiay = `${host}/giay/${id}`;
        $http.delete(urlGiay).then(resp => {
            alert("Xóa thành công!");
            location.replace("/admin/index")
        })
        }
    }
    $scope.reset = () => {
        $scope.giay = null;
        document.getElementById('inputImgGiay').value = "";
        $scope.checkInsert = true;
    }
    $scope.load_all();
});