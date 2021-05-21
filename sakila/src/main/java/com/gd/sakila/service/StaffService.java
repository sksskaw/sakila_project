package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.StaffListViewMapper;
import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.PageParam;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffListView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper; // DI, @AutoWired 없으면 --> NullPoiintException 발생...
	@Autowired StaffListViewMapper staffListViewMapper;
	
	public Staff login(Staff staff) {
		log.debug("login() param staff :"+staff);
		return staffMapper.selectStaffByLogin(staff); // null or staff객체
	}

	public List<StaffListView> getStaffList(int currentPage, int rowPerPage, String searchWord){
		
		PageParam page = new PageParam();
		page.setBeginRow((currentPage-1)*rowPerPage); // 시작페이지
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		
		return staffListViewMapper.selectStaffList(page);
	}
}