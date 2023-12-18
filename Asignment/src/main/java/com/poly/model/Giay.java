package com.poly.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Table(name="giays")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Giay implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maGiay;
	private String tenGiay;
	private int donGia;
	private double giamGia;
	private String moTa;
	private String hinhAnh;
	
	@JsonIgnore
	@OneToMany(mappedBy = "giay")
	private List<DanhGia> danhGias;

	@JsonIgnore
	@OneToMany(mappedBy = "giay")
	private List<ChiTietDonHang> chiTietDonHangs;
	// bi-directional many-to-one association to HangGiay
	
	@ManyToOne
	@JoinColumn(name = "maHang")
	private HangGiay hangGiay;

	// bi-directional many-to-one association to LoaiGiay
	
	@ManyToOne
	@JoinColumn(name = "maLoaiGiay")
	private LoaiGiay loaiGiay;	

}
