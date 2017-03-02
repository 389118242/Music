package com.music.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.UserBiz;
import com.music.entity.User;

@Controller
public class LoginController {

	@Autowired
	private UserBiz userBiz;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showView() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public boolean login(User user, boolean isAutoLogin, HttpServletResponse resp, HttpSession session) {
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(user.getUserPassword().getBytes());
			user.setUserPassword(new BigInteger(digest.digest()).toString(16));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		User u = userBiz.login(user);
		session.setAttribute("user", u);
		if (isAutoLogin && null != u) {
			Cookie c = new Cookie("musicUser", user.getUserAccount() + ":" + user.getUserPassword());
			resp.addCookie(c);
		}
		return u != null;
	}

}
