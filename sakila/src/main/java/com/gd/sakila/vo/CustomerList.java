package com.gd.sakila.vo;

import lombok.Data;

@Data
public class CustomerList {
   private int ID;
   private String name;
   private String address;
   private String zipCode;
   private String phone;
   private String city;
   private String country;
   private String notes;
   private int SID;
}