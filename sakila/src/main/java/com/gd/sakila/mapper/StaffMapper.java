package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	Staff selectStaffByLogin(Staff staff);
}
