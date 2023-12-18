package com.poly.service;


import com.poly.model.HangGiay;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface HangGiayService {
    List<HangGiay> findAll();
    Page<HangGiay> findAll(Pageable pageable);
    HangGiay findById(int id);
    boolean existsById(int id);
    HangGiay save(HangGiay HangGiay);
    void deleteById(int id);
}
