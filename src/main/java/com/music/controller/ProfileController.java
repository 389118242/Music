package com.music.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.biz.MessageBiz;
import com.music.biz.SongListBiz;
import com.music.biz.UserBiz;
import com.music.entity.Message;
import com.music.entity.SongList;
import com.music.entity.User;
import com.music.entity.UserWithBLOBs;

@Controller
public class ProfileController {

	@Autowired
	private SongListBiz slb;
	@Resource(name = "userBizImpl")
	private UserBiz ub;
	@Autowired
	private MessageBiz mb;

	// 展示profile页
	@RequestMapping("profile")
	public String showView(Integer userId, Model model, HttpSession session) {

		List<SongList> sll;
		// 根据用户ID从数据库中找出相对应的歌单(不含歌曲信息)
		sll = slb.selectSongListByUserIdWithoutSong(userId);
		List<SongList> sllc;
		// 根据用户ID从数据库中找出其收藏的歌单（不包含歌曲信息）
		sllc = slb.selectCollectionSongListByUserIdWithoutSong(userId);
		model.addAttribute("collectionList", sllc);
		model.addAttribute("songListList", sll);
		UserWithBLOBs uwb = ub.getUser(userId);
		if (null == uwb)
			return "404";
		model.addAttribute("user", uwb);

		User user = (User) session.getAttribute("user");
		if (null != user && userId.equals(user.getUserId())) {
			List<Message> comment = mb.messages(userId, "评论");
			int comNumOfNoRead = 0;
			for (Message i : comment) {
				if (i.getIsRead() == 0)
					comNumOfNoRead++;
			}
			List<Message> reply = mb.messages(userId, "回复");
			int replyNumOfNoRead = 0;
			for (Message i : reply) {
				if (i.getIsRead() == 0)
					replyNumOfNoRead++;
			}
			List<Message> privateLetter = mb.messages(userId, "私信");
			int plNumOfNoRead = 0;
			for (Message i : privateLetter) {
				if (i.getIsRead() == 0)
					plNumOfNoRead++;
			}
			model.addAttribute("messageNew", comNumOfNoRead);
			model.addAttribute("messagesList", comment);
			model.addAttribute("likesNew", replyNumOfNoRead);
			model.addAttribute("likesList", reply);
			model.addAttribute("lettersNew", plNumOfNoRead);
			model.addAttribute("lettersList", privateLetter);
		}
		return "profile";
	}

	// @RequestMapping("message")
	// public String message(Integer askUserId, HttpSession session, Model
	// model) {
	//
	// // ==========================测试数据========================
	// User user = new User();
	// user.setUserId(8);
	// user.setUserAccount("郝");
	// user.setUserName("郝哈哈哈");
	// session.setAttribute("user", user);
	// // ==========================测试数据========================
	// model.addAttribute("askUserId", askUserId);
	// // 判断是否为本人
	// User su = (User) session.getAttribute("user");
	// if (su.getUserId() == askUserId) {
	// // 获取评论，未读评论数
	// List<Message> messagesList = mb.messages(askUserId, "评论");
	// int messageNew = 0;
	// for (Message message : messagesList) {
	// if (message.getIsRead() == 0)
	// messageNew++;
	// }
	// model.addAttribute("messageNew", messageNew);// 未读评论数
	// model.addAttribute("messagesList", messagesList);// 返回评论
	// // 获取点赞，未读点赞数
	// List<Message> likesList = mb.messages(askUserId, "点赞");
	// int likesNew = 0;
	// for (Message message : likesList) {
	// if (message.getIsRead() == 0)
	// likesNew++;
	// }
	// model.addAttribute("likesNew", likesNew);// 未读点赞数
	// model.addAttribute("likesList", likesList);// 返回点赞
	// // 获取私信，未读私信数
	// List<Message> lettersList = mb.messages(askUserId, "私信");
	// int lettersNew = 0;
	// for (Message letters : lettersList) {
	// if (letters.getIsRead() == 0)
	// lettersNew++;
	// }
	// model.addAttribute("lettersNew", lettersNew);// 未读点赞数
	// model.addAttribute("lettersList", lettersList);// 返回点赞
	// return "profile";
	// }
	// return "profile";
	// }

	@RequestMapping("ajaxChange")
	@ResponseBody
	public void ajaxChange(Integer messId) {
		mb.updateByMessID(messId);
	}

}
