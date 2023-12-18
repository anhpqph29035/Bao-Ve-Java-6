package com.poly.service.impl;

import com.poly.repo.GiayRepo;
import com.poly.model.Giay;
import com.poly.service.GiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GiayServiceImpl implements GiayService {
    @Autowired
    GiayRepo giayRepo;

    @Override
    public List<Giay> findAll() {
        return giayRepo.findAll();
    }

    @Override
    public Page<Giay> findAll(Pageable pageable) {
        return giayRepo.findAll(pageable);
    }

    @Override
    public Giay findById(int id) {
        return giayRepo.findById(id).get();
    }

    @Override
    public List<Giay> findByName(String name) {
        return giayRepo.findByName(name);
    }
    @Override
    public boolean existsById(int id) {
        return giayRepo.existsById(id);
    }

    @Override
    public Giay save(Giay giay) {
        return giayRepo.save(giay);
    }

    @Override
    public void deleteById(int id) {
        giayRepo.deleteById(id);
    }
}
