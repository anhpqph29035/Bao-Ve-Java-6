package com.poly.service;


import com.poly.model.LoaiGiay;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface LoaiGiayService {
    List<LoaiGiay> findAll();
    Page<LoaiGiay> findAll(Pageable pageable);
    LoaiGiay findById(int id);
    boolean existsById(int id);
    LoaiGiay save(LoaiGiay LoaiGiay);
    void deleteById(int id);
}
