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

	// չʾprofileҳ
	@RequestMapping("profile")
	public String showView(Integer userId, Model model, HttpSession session) {

		List<SongList> sll;
		// �����û�ID�����ݿ����ҳ����Ӧ�ĸ赥(����������Ϣ)
		sll = slb.selectSongListByUserIdWithoutSong(userId);
		List<SongList> sllc;
		// �����û�ID�����ݿ����ҳ����ղصĸ赥��������������Ϣ��
		sllc = slb.selectCollectionSongListByUserIdWithoutSong(userId);
		model.addAttribute("collectionList", sllc);
		model.addAttribute("songListList", sll);
		UserWithBLOBs uwb = ub.getUser(userId);
		if (null == uwb)
			return "404";
		model.addAttribute("user", uwb);

		User user = (User) session.getAttribute("user");
		if (null != user && userId.equals(user.getUserId())) {
			List<Message> comment = mb.messages(userId, "����");
			int comNumOfNoRead = 0;
			for (Message i : comment) {
				if (i.getIsRead() == 0)
					comNumOfNoRead++;
			}
			List<Message> reply = mb.messages(userId, "�ظ�");
			int replyNumOfNoRead = 0;
			for (Message i : reply) {
				if (i.getIsRead() == 0)
					replyNumOfNoRead++;
			}
			List<Message> privateLetter = mb.messages(userId, "˽��");
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
	// // ==========================��������========================
	// User user = new User();
	// user.setUserId(8);
	// user.setUserAccount("��");
	// user.setUserName("�¹�����");
	// session.setAttribute("user", user);
	// // ==========================��������========================
	// model.addAttribute("askUserId", askUserId);
	// // �ж��Ƿ�Ϊ����
	// User su = (User) session.getAttribute("user");
	// if (su.getUserId() == askUserId) {
	// // ��ȡ���ۣ�δ��������
	// List<Message> messagesList = mb.messages(askUserId, "����");
	// int messageNew = 0;
	// for (Message message : messagesList) {
	// if (message.getIsRead() == 0)
	// messageNew++;
	// }
	// model.addAttribute("messageNew", messageNew);// δ��������
	// model.addAttribute("messagesList", messagesList);// ��������
	// // ��ȡ���ޣ�δ��������
	// List<Message> likesList = mb.messages(askUserId, "����");
	// int likesNew = 0;
	// for (Message message : likesList) {
	// if (message.getIsRead() == 0)
	// likesNew++;
	// }
	// model.addAttribute("likesNew", likesNew);// δ��������
	// model.addAttribute("likesList", likesList);// ���ص���
	// // ��ȡ˽�ţ�δ��˽����
	// List<Message> lettersList = mb.messages(askUserId, "˽��");
	// int lettersNew = 0;
	// for (Message letters : lettersList) {
	// if (letters.getIsRead() == 0)
	// lettersNew++;
	// }
	// model.addAttribute("lettersNew", lettersNew);// δ��������
	// model.addAttribute("lettersList", lettersList);// ���ص���
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
