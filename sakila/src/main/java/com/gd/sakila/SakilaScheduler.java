package com.gd.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SakilaScheduler {
	
	@Autowired CustomerService customerService;
	
	@Scheduled(cron = "0 0 0 1 * *") // 매월 1일 자정에 실행할꺼임
	public void modifyCustomerActive() {
		customerService.modifyCustomerActiveByScheduler();
		log.debug("스케줄링 실행 휴먼계정 검사 후 active 변경완료");
	}
}