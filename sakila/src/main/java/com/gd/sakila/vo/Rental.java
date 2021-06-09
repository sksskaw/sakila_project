package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private int rentalId;
	private String rentalDate;
	private int inventoryId;
	private int customerId;
	private String returnDate;
	private int staffId;
	private String lastUpdate;
}
