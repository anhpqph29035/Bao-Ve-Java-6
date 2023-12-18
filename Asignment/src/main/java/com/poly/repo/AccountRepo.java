package com.poly.repo;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.model.KhachHang;

import java.util.List;


@Repository
public interface AccountRepo extends JpaRepository<KhachHang, String>  {
   List<KhachHang> findKhachHangsByQuyenMaQuyen(int quyen);
   Page<KhachHang> findKhachHangsByQuyenMaQuyen(Pageable pa,int quyen);
}
