package com.poly.controller.api;

import java.util.List;

import com.poly.model.Giay;
import com.poly.service.LoaiGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.poly.model.LoaiGiay;


@CrossOrigin("*")
@RestController
public class LoaiGiayController {
	@Autowired
	private LoaiGiayService loaGiayDAO;

	@GetMapping("/rest/loaigiay")
	public ResponseEntity<List<LoaiGiay>> getAll(Model model) {
		return ResponseEntity.ok(loaGiayDAO.findAll());
	}

	@GetMapping("/rest/loaigiay/{id}")
	public ResponseEntity<LoaiGiay> getOne(@PathVariable("id") Integer id) {
		if (!loaGiayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(loaGiayDAO.findById(id));
	}
	// Insert
	@PostMapping("/rest/loaigiay")
	public ResponseEntity<LoaiGiay> post(@RequestBody LoaiGiay loaiGiay) {
		if (loaGiayDAO.existsById(loaiGiay.getMaLoaiGiay())) {
			return ResponseEntity.badRequest().build();
		}
		loaGiayDAO.save(loaiGiay);
		return ResponseEntity.ok(loaiGiay);
	}

	// Update
	@PutMapping("/rest/loaigiay/{id}")
	public ResponseEntity<LoaiGiay> put(@PathVariable("id") Integer id, @RequestBody LoaiGiay loaiGiay) {
		if (!loaGiayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		loaGiayDAO.save(loaiGiay);
		return ResponseEntity.ok(loaiGiay);
	}

	@DeleteMapping("/rest/loaigiay/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") Integer id) {
		if (!loaGiayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		loaGiayDAO.deleteById(id);
		return ResponseEntity.ok().build();
	}
}
