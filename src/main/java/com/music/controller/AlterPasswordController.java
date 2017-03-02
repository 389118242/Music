package com.music.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.UserBiz;
import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

@Controller
public class AlterPasswordController {

	@Autowired
	private UserBiz userBiz;

	@RequestMapping(value = "/alterPassword", method = RequestMethod.GET)
	public String showView(HttpSession session) {
		if (null == session.getAttribute("user"))
			return "404";
		return "alterPassword";
	}

	@RequestMapping(value = "/alterPassword", method = RequestMethod.POST)
	@ResponseBody
	public String alterPassword(String oldPassword, String newPassword, HttpSession session) {
		User u = (User) session.getAttribute("user");
		if (u == null)
			return "n";

		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(oldPassword.getBytes());
			String oldStr = new BigInteger(digest.digest()).toString(16);
			if (!oldStr.equals(u.getUserPassword()))
				return "f";
			digest.update(newPassword.getBytes());
			String newStr = new BigInteger(digest.digest()).toString(16);
			UserWithBLOBs nwb = new UserWithBLOBs();
			nwb.setUserId(u.getUserId());
			nwb.setUserPassword(newStr);
			if (userBiz.updateUser(nwb)) {
				session.removeAttribute("user");
				return "s";
			} else
				return "e";

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "alterPassword";
	}

}
