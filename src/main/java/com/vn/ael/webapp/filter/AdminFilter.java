package com.vn.ael.webapp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminFilter implements Filter {
	@Override
	public void doFilter(ServletRequest rq, ServletResponse rs, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) rq;
		HttpServletResponse res = (HttpServletResponse) rs;
		String currentUser = "";
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					currentUser = cookie.getValue();
				}
			}
		}

		String requestURI = req.getRequestURI();
		if ("bgd01".equals(currentUser) && requestURI.contains("/admin/accounting/feeTables")) {
			String newURI = requestURI.replace("accounting/", "");
			res.sendRedirect(newURI);
		} else {
			chain.doFilter(req, res);
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
}