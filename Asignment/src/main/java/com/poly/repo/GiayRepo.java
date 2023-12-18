package com.poly.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.model.Giay;

@Repository
public interface GiayRepo extends JpaRepository<Giay, Integer> {
	@Query("SELECT g FROM Giay g WHERE g.tenGiay like %?1%")
    List<Giay> findByName(String tenGiay);
}
