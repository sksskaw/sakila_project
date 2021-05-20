package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Staff {
	private int staffId;
	private String firstName;
	private String lastName;
	
	private int addressId;
	private String picture;
	private String email;
	
	private int storeId;
	private int active;
	
	private String username;
	private String password;
	private String lastUpdate;
}