package com.poly.service.impl;

import com.poly.model.LoaiGiay;
import com.poly.repo.LoaiGiayRepo;
import com.poly.service.LoaiGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoaiGiayServiceImpl implements LoaiGiayService {
    @Autowired
    LoaiGiayRepo LoaiGiayRepo;

    @Override
    public List<LoaiGiay> findAll() {
        return LoaiGiayRepo.findAll();
    }

    @Override
    public Page<LoaiGiay> findAll(Pageable pageable) {
        return LoaiGiayRepo.findAll(pageable);
    }

    @Override
    public LoaiGiay findById(int id) {
        return LoaiGiayRepo.findById(id).get();
    }

    @Override
    public boolean existsById(int id) {
        return LoaiGiayRepo.existsById(id);
    }

    @Override
    public LoaiGiay save(LoaiGiay LoaiGiay) {
        return LoaiGiayRepo.save(LoaiGiay);
    }

    @Override
    public void deleteById(int id) {
        LoaiGiayRepo.deleteById(id);
    }
}
