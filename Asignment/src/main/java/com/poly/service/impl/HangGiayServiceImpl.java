package com.poly.service.impl;

import com.poly.model.HangGiay;
import com.poly.repo.HangGiayRepo;
import com.poly.service.HangGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HangGiayServiceImpl implements HangGiayService {
    @Autowired
    HangGiayRepo HangGiayRepo;

    @Override
    public List<HangGiay> findAll() {
        return HangGiayRepo.findAll();
    }

    @Override
    public Page<HangGiay> findAll(Pageable pageable) {
        return HangGiayRepo.findAll(pageable);
    }

    @Override
    public HangGiay findById(int id) {
        return HangGiayRepo.findById(id).get();
    }

    @Override
    public boolean existsById(int id) {
        return HangGiayRepo.existsById(id);
    }

    @Override
    public HangGiay save(HangGiay HangGiay) {
        return HangGiayRepo.save(HangGiay);
    }

    @Override
    public void deleteById(int id) {
        HangGiayRepo.deleteById(id);
    }
}
