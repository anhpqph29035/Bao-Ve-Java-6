package com.poly.repo;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.model.DanhGia;

@Repository
public interface DanhGiaRepo extends JpaRepository<DanhGia, Integer> {
	@Query("SELECT dg FROM DanhGia dg WHERE dg.giay.maGiay=?1")
    List<DanhGia> findAllDanhGia(Integer maGiay);
	@Modifying
	@Query("DELETE FROM DanhGia dg WHERE dg.giay.maGiay=?1")
    void deleteByIdGiay(Integer maGiay);
	
	
}
