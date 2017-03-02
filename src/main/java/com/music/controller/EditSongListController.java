package com.music.controller;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.music.biz.ListKindBiz;
import com.music.biz.SongListBiz;
import com.music.entity.ListKind;
import com.music.entity.SongList;
import com.music.entity.User;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@SuppressWarnings("restriction")
@Controller
public class EditSongListController {

	@Autowired
	SongListBiz slb;
	@Autowired
	private ListKindBiz lb;

	@RequestMapping("editSongList")
	public String showView(String songListId, Model model, HttpSession session) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			return "404";
		}
		try {
			Integer.parseInt(songListId);
		} catch (Exception e) {
			e.printStackTrace();
			return "404";
		}
		int uId = u.getUserId();
		List<SongList> sll;
		sll = slb.selectSongListByUserId(uId);
		SongList sl = slb.selectSongListWithoutSong(Integer.parseInt(songListId));
		model.addAttribute("songList", sl);
		model.addAttribute("listKind", slb.getSongListKindByListId(Integer.parseInt(songListId)));
		model.addAttribute("songListList", sll);
		return "editSongList";
	}

	@RequestMapping("addNewList")
	@ResponseBody
	public boolean addNewList(String listName, HttpSession session) {
		User u = (User) session.getAttribute("user");
		int userId;
		userId = u.getUserId();
		SongList songList = new SongList();
		songList.setListName(listName);
		songList.setUserId(userId);
		if (slb.addSongList(songList)) {
			return true;
		} else
			return false;

	}

	@RequestMapping("showSongList")
	@ResponseBody
	public SongList showSongList(String listId, HttpServletResponse response) {
		SongList sl = slb.selectSongListWithoutSong(Integer.parseInt(listId));
		return sl;
	}

	@RequestMapping("deleteSongList")
	@ResponseBody
	public boolean deleteSongList(String songListId, HttpServletRequest req) {
		if (slb.removeSongList(Integer.parseInt(songListId))) {
			File listImg = new File(req.getServletContext().getRealPath("/slImg") + "/" + songListId + ".png");
			listImg.deleteOnExit();
			return true;
		} else
			return false;
	}

	@RequestMapping(value = "editList", method = RequestMethod.POST)
	@ResponseBody
	public String editList(@RequestBody Map<String, Object> param, HttpServletRequest req) throws Exception {
		// boolean res = slb.updateSongList(songList);
		// System.out.println(res);
		@SuppressWarnings("unchecked")
		Map<String, Object> imgData = (Map<String, Object>) param.get("imgData");
		if (null != imgData) {
			String imgPath = (String) param.get("imgPath");
			Iterator<ImageReader> iterator = ImageIO.getImageReadersByFormatName("jpg");
			ImageReader reader = (ImageReader) iterator.next();
			File f = new File(req.getServletContext().getRealPath("/") + "/" + imgPath);
			InputStream in = new FileInputStream(f);
			ImageInputStream iis = ImageIO.createImageInputStream(in);
			reader.setInput(iis, true);
			ImageReadParam ppp = reader.getDefaultReadParam();
			Rectangle rect = new Rectangle(Integer.parseInt(imgData.get("x").toString()),
					Integer.parseInt(imgData.get("y").toString()), Integer.parseInt(imgData.get("width").toString()),
					Integer.parseInt(imgData.get("height").toString()));
			ppp.setSourceRegion(rect);
			BufferedImage bi = reader.read(0, ppp);
			ImageIO.write(bi, "png", new File(req.getServletContext().getRealPath("/slImg") + "/"
					+ Integer.parseInt(param.get("listId").toString()) + ".jpg"));
		}
		return slb.updateSongList(param) ? "s" : "f";
	}

	@RequestMapping(value = "getListKind", method = RequestMethod.POST)
	@ResponseBody
	public List<ListKind> getAllListKind() {
		return lb.getAllListKind();
	}

	@RequestMapping(value = "uploadListImg")
	@ResponseBody
	public String uploadListImg(MultipartFile file, Integer songListId, HttpServletRequest req) {
		if (!file.getContentType().startsWith("image")) {
			return "type";
		}
		String ssName = file.getOriginalFilename();
		String[] ss = ssName.split("\\.");
		String fileName = songListId + "." + ss[ss.length - 1];
		File f = new File(req.getServletContext().getRealPath("/slImg"), fileName);
		try {
			file.transferTo(f);
			BufferedImage bi = ImageIO.read(new FileInputStream(f));
			FileOutputStream os = new FileOutputStream(
					req.getServletContext().getRealPath("/slImg") + "/" + songListId + ".jpg");
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
			encoder.encode(bi); // JPEG����
			os.close();
			return "slImg/" + songListId + ".jpg";
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}
}
