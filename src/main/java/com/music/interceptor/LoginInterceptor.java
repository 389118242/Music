package com.music.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.music.biz.UserBiz;
import com.music.entity.User;

public class LoginInterceptor implements HandlerInterceptor {

	private UserBiz userBiz;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (null != session.getAttribute("user"))
			return true;
		Cookie[] c = request.getCookies();
		if (null != c)
			for (Cookie i : c) {
				if ("musicUser".equals(i.getName())) {
					String[] uInfo = i.getValue().split(":");
					User u = new User();
					u.setUserAccount(uInfo[0]);
					u.setUserPassword(uInfo[1]);
					if (null == userBiz)
						initUserBiz(request.getServletContext());
					User ret = userBiz.login(u);
					if (null != ret) {
						session.setAttribute("user", ret);
					} else {
						i.setMaxAge(0);
						response.addCookie(i);
					}
					break;
				}
			}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	private void initUserBiz(ServletContext context) {
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
		this.userBiz = applicationContext.getBean(UserBiz.class);
	}

}
