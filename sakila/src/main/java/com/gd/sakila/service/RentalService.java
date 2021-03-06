package com.gd.sakila.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	@Autowired FilmMapper filmMapper;
	
	// 대여 목록 가져오기
	public List<Rental> getRentalList(Map<String, Object> map){
		return rentalMapper.selectRentalList(map);
	}
	
	// 대여 목록 lastPage
	public int getRentalListTotal(Map<String,Object> map) {
		return rentalMapper.selectRentalListTotal(map);
	}
	
	/* 대여처리
	 * 1. rental insert
	 * 2. 해당 inventoryId에 대한 amount(rental_rate) 가져오기
	 * 3. payment insert
	*/
	
	
	public void addRental(Map<String, Object> map) {
		// 1. rental insert
		rentalMapper.insertRental(map); // 실행 시 selectKey옵션으로 rentalId값이 map에 들어가게 된다.
		
		// 2. amount가져오기
		int inventoryId = (int) map.get("inventoryId");
		double amount = filmMapper.selectRentalRate(inventoryId);
		map.put("amount", amount);
		
		// 3. payment insert
		rentalMapper.insertPayment(map);
	}
	
	// 미반납 리스트
	public List<Rental> getReturnNullList(int beginRow, int rowperPage, Integer searchNum){
		return rentalMapper.selectReturnNullList(beginRow, rowperPage, searchNum);
	}
	
	// 리스트 total
	public int getReturnNullTotal(){
		return rentalMapper.selectReturnNullTotal();
	}
	
	/* 반납 처리
	 * 1. 미반납 리스트에서 체크된 데이터를 가져온다(returnArray) view -> controller
	 * 
	 * 2. 각각의 rental에 대한 연체료가 발생하는지 계산한다. 
	 *    DATEDIFF(NOW(), r.rental_date) - f.rental_duration
	 *    빌린날짜와 오늘날짜의 차이에서 해당 영화의 duration만큼 빼주게 되면 연체료를 구할 수 있다. 값이 1보다 작으면 연체료는 0원
	 *    
	 * 3. payment 테이블에서 rentalId를 이용하여 빌렸을 때 결제한 금액에 연체료를 더하여 amount를 최신화 해준다.
	 *    ex) 빌릴때 amount 2.99/ 2번에서 구한 연체료 10달러 발생 -> amount + 10 하여 12.99로 최신화
	 *    
	 * 4. rental 테이블의 rentalDate를 now() 설정해 준다.
	 * */
	
	public int returnTransaction(List<Integer> returnArray) { // 반납처리 1.
		
		List<Map<String, Object>> overdueFeeList = new LinkedList<>();
		
		// 반납처리 2.
		int overdueFee = 0; // 연체료 초기화
		
		for(Integer i : returnArray) { // i = rentalId
			overdueFee = rentalMapper.selectOverdueFeeByKey(i); // 해당 rentalId의 연체료 계산
			if (overdueFee < 0) { // 음수가 나오면 0으로 초기화, 음수가 나오면 안되니까
				overdueFee = 0;
			}
			
			// map에 rentalId, rentalId의 연체료를 담는다.
			Map<String, Object> map = new HashMap<>();
			map.put("rentalId", i);
			map.put("overdueFee", overdueFee);
			
			overdueFeeList.add(map); // 체크박스니까 여러개를 처리할 수 있도록
		}
		
		// 반납처리 3.
		if(overdueFee != 0) { // 연채료 발생시
			for(Map<String, Object> m : overdueFeeList) {
			rentalMapper.updateAmountByKey(m);			// 결제금액 수정
			rentalMapper.updatePaymentDateByKey(m);     // 결제날짜 수정
			}
		}
		
		
		// 반납처리 4.
		int cnt = 0;
		log.debug("RentalService - returnTransaction returnArray SIZE : " + returnArray.size());
		for(Integer i : returnArray) {
			rentalMapper.updateReturnDate(i);
			log.debug("rentalId : " + i +" return complete");
			cnt++;
		}
		
		return cnt;
	}
}