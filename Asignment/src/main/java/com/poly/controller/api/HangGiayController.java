package com.poly.controller.api;

import java.util.List;

import com.poly.service.HangGiayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.poly.model.HangGiay;


@CrossOrigin("*")
@RestController
public class HangGiayController {
	@Autowired
	private HangGiayService hangGiayDAO;

	@GetMapping("/rest/hanggiay")
	public ResponseEntity<List<HangGiay>> getAll(Model model) {
		return ResponseEntity.ok(hangGiayDAO.findAll());
	}

	@GetMapping("/rest/hanggiay/{id}")
	public ResponseEntity<HangGiay> getOne(@PathVariable("id") Integer id) {
		if (!hangGiayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(hangGiayDAO.findById(id));
	}
}
