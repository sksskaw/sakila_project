package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper; // DI, @AutoWired 없으면 --> NullPoiintException 발생...
	public Staff login(Staff staff) {
		log.debug("login() param staff :"+staff);
		return staffMapper.selectStaffByLogin(staff); // null or staff객체
	}
}