package com.gd.sakila.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/admin/*")
public class LoginFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		log.debug("▶▶▶▶▶▶ LoginFilter 요청 전");
		
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
		}
		
		// 세션 정보 없을 시 로그인 페이지로
		if(session.getAttribute("loginStaff") == null) {
			if(response instanceof HttpServletResponse) {
				((HttpServletResponse)response).sendRedirect("/home");
			}
			return;
		}
		chain.doFilter(request, response);
		
		log.debug("▶▶▶▶▶▶ LoginFilter 요청 후");
	}
}