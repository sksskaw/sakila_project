package com.gd.sakila.vo;

import lombok.Data;

@Data
public class City {
	private int cityId;
	private String city;
	private int countryId;
	private String lastUpdate;
}
