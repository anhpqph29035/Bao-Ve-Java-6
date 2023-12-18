const app = angular.module("MyApp", ["firebase"]);
app.config(() => {
  const config = {
    apiKey: "AIzaSyCD3j_xkSo_avJ4vPsj5rbqkd4jWUlcRkA",
    authDomain: "shoesshop-13e5b.firebaseapp.com",
    databaseURL: "https://shoesshop-e6064-default-rtdb.firebaseio.com",
    storageBucket: "shoesshop-13e5b.appspot.com",
    projectId: "shoesshop-13e5b",
  };
  firebase.initializeApp(config);
});
app.controller("MyCtrl", [
  "$scope",
  "$firebaseArray",
  ($scope, $firebaseArray) => {
    //Checklogin
    let sessionLogin = sessionStorage.getItem("User");
    if (sessionLogin != null) {
      $scope.username = sessionLogin;
      $scope.login = true;
    } else {
      $scope.login = false;
    }
    $scope.logout = () => {
      sessionStorage.clear();
      location.replace("../categories.html");
    };
    const getViTriGioHang = (idGioHang, array) => {
      const index = array.findIndex((item) => item.id === idGioHang);
      return index;
    };
    const getSoLuongGioHang = async (idKhachHang) => {
      const refGH = firebase.database().ref("GioHang/" + idKhachHang);
      const cartList = $firebaseArray(refGH) || [];
      const resultCartList = await cartList.$loaded();
      let soLuongGiohang = 0;
      resultCartList.forEach((item) => {
        soLuongGiohang += item.soLuong;
      });
      return soLuongGiohang;
    };
    //Loaddata từ firebase
    const refGiay = firebase.database().ref("Giay");
    const Giays = $firebaseArray(refGiay);
    //Chạy đồng bộ, đỢi Giays load xong rồi mới chạy
    Giays.$loaded().then(async () => {
      $scope.listGiay = Giays;
      if (sessionLogin == null) {
        $scope.soLuongGioHang = 0;
      } else {
        const sssGioHang = await getSoLuongGioHang(sessionLogin);
        $scope.soLuongGioHang = 4;
        console.log("scope soluong", $scope.soLuongGioHang);
      }
    });

    $scope.addToCart = (giay) => {
      const noLogin = true;
      if (sessionLogin == null) {
        location.replace("../login.html?noLogin=" + noLogin);
      }
      const idKhachHang = sessionLogin;
      const refGH = firebase.database().ref("GioHang/" + idKhachHang);
      const cartList = $firebaseArray(refGH) || [];
      //Loaddata từ firebase
      cartList
        .$loaded()
        .then(() => {
          const gioHangObj = {};
          gioHangObj.id = giay.$id;
          gioHangObj.TenGiay = giay.TenGiay;
          gioHangObj.DonGia = giay.DonGia;
          gioHangObj.HinhAnh = giay.HinhAnh;
          const viTriGioHang = getViTriGioHang(giay.$id, cartList);
          if (viTriGioHang > -1) {
            cartList[viTriGioHang].soLuong++;
            cartList.$save(viTriGioHang).then((ref) => {
              ref.key === cartList[viTriGioHang].$id; // true
            });
            // $scope.soLuongGioHang = await getSoLuongGioHang(sessionLogin);
          } else {
            gioHangObj.soLuong = 1;
            // Thêm vô firebase
            cartList.$add(gioHangObj).then((refGH) => {
              //Tạo id ngẫu nhiên
              const id = refGH.key;
              cartList.$indexFor(id); // returns location in the array
            });
            // $scope.soLuongGioHang = await getSoLuongGioHang(sessionLogin);
          }
        })
        .catch(function (error) {
          console.log("Error:", error);
        });
    };
  },
]);
