package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Address {
	private int addressId;
	private String address;
	private String address2;
	private String district;
	private int cityId;
	private String postalCode;
	private String phone;
	private String lastUpdate;
}