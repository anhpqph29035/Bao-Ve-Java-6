package com.poly.service;


import com.poly.model.Giay;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface GiayService {
    List<Giay> findAll();
    Page<Giay> findAll(Pageable pageable);
    Giay findById(int id);
    List<Giay> findByName(String name);
    boolean existsById(int id);
    Giay save(Giay giay);
    void deleteById(int id);
}
