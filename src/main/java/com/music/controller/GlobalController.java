package com.music.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mchange.io.FileUtils;
import com.music.biz.AlbumBiz;
import com.music.biz.CommentBiz;
import com.music.biz.SongBiz;
import com.music.biz.SongListBiz;
import com.music.entity.Comment;
import com.music.entity.Song;
import com.music.entity.SongList;
import com.music.entity.User;

@Controller
public class GlobalController {

	@Autowired
	private SongListBiz slb;
	@Autowired
	private SongBiz songBiz;
	@Autowired
	private CommentBiz commentBiz;
	@Resource(name = "albumBizImpl")
	private AlbumBiz albumBiz;

	// 根据用户id取歌单相关数据
	@RequestMapping("getSongList")
	@ResponseBody
	public List<SongList> getSongList(HttpSession session) {
		int userId = ((User) session.getAttribute("user")).getUserId();
		List<SongList> sll;
		sll = slb.selectSongListByUserId(userId);
		return sll;
	}

	@RequestMapping("addSongTosongList")
	@ResponseBody
	public void addSongTosongList(String listName, String songId, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return;
		int userId = user.getUserId();
		SongList songList = new SongList();
		songList.setListName(listName);
		songList.setUserId(userId);
		if (slb.addSongList(songList)) {
			int slId = songList.getListId();
			slb.addSongToSongList(slId, Integer.parseInt(songId));
		}

	}

	@RequestMapping(value = "/getSongInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSongInfo(Integer songId) {
		Map<String, Object> ret = new HashMap<>();
		Song song = songBiz.getSongById(songId);
		ret.put("songId", song.getSongId());
		ret.put("title", song.getSongName());
		ret.put("artist", song.getSinger().getSingerName());
		ret.put("mp3", "musics/" + song.getSongId() + ".mp3");
		ret.put("poster", "");
		ret.put("lyric", song.getLyric());
		return ret;
	}

	@RequestMapping(value = "/getSongListSongInfo", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getSongListInfo(Integer listId) {
		List<Integer> list = slb.getSongIdOfSongListByListId(listId);
		List<Map<String, Object>> ret = new ArrayList<>();
		for (Integer i : list) {
			ret.add(this.getSongInfo(i));
		}
		return ret;
	}

	@RequestMapping(value = "/getSongListSongId", method = RequestMethod.POST)
	@ResponseBody
	public List<Integer> getSongListSongId(Integer listId) {
		List<Integer> ret = slb.getSongIdOfSongListByListId(listId);
		return ret;
	}

	@RequestMapping(value = "/getAlbumSongs", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getAlbumSongs(Integer albumId) {
		List<Integer> list = albumBiz.getSongIdByAlbumId(albumId);
		List<Map<String, Object>> ret = new ArrayList<>();
		for (Integer i : list) {
			ret.add(this.getSongInfo(i));
		}
		return ret;
	}

	@RequestMapping(value = "/getAlbumSongId", method = RequestMethod.POST)
	@ResponseBody
	public List<Integer> getAlbumSongId(Integer albumId) {
		return albumBiz.getSongIdByAlbumId(albumId);
	}

	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	@ResponseBody
	public int addComment(@RequestBody Map<String, Object> param, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null == user) {
			return -1;
		} else if (user.getUserState() == 0) {
			return -2;
		} else {
			Integer userId = user.getUserId();
			String type = param.get("type").toString();
			String comContent = param.get("comContent").toString();
			Integer id = Integer.parseInt(param.get("id").toString());
			Integer parentId = (Integer) param.get("parentId");
			Comment com = new Comment();
			com.setParentId(parentId);
			com.setUserId(userId);
			com.setComContent(comContent);
			int ret = 0;
			if ("song".equals(type)) {
				ret = commentBiz.addSongComment(id, com) ? 1 : 0;
			} else if ("songList".equals(type)) {
				ret = commentBiz.addSongListComment(id, com) ? 1 : 0;
			} else if ("album".equals(type)) {
				ret = commentBiz.addAlbumComment(id, com) ? 1 : 0;
			}
			return ret;
		}
	}

	@RequestMapping("/getComment")
	@ResponseBody
	public Map<String, Object> getComment(String type, Integer id, Integer page) {
		Map<String, Object> ret = new HashMap<>();
		int pageSize = 9;
		List<Comment> comList = null;
		int total = 0;
		if ("song".equals(type)) {
			comList = commentBiz.getSongComment(id, page, pageSize);
			total = commentBiz.getSongCommentCount(id);
		} else if ("songList".equals(type)) {
			comList = commentBiz.getSongListComment(id, page, pageSize);
			total = commentBiz.getSongListCommentCount(id);
		} else if ("album".equals(type)) {
			comList = commentBiz.getAlbumComment(id, page, pageSize);
			total = commentBiz.getAlbumCommentCount(id);
		}
		int totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		int beginPage = page - 2 > 1 ? page - 2 : 1;
		int endPage = beginPage + 5 > totalPage ? totalPage : beginPage + 5;
		beginPage = endPage - 5 > 1 ? endPage - 5 : 1;
		ret.put("comList", comList);
		ret.put("bp", beginPage);
		ret.put("ep", endPage);
		ret.put("page", page);
		ret.put("tp", totalPage);
		return ret;
	}

	@RequestMapping("/userLogout")
	public String exit(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		Cookie[] cookies = req.getCookies();
		if (null != cookies) {
			Cookie temp = null;
			for (Cookie i : cookies) {
				if (i.getName().equals("musicUser")) {
					temp = i;
					break;
				}
			}
			if (null != temp) {
				temp.setMaxAge(0);
				resp.addCookie(temp);
			}
		}
		session.removeAttribute("user");
		return "index";
	}

	@RequestMapping(value = "download", method = RequestMethod.GET)
	public ResponseEntity<byte[]> downloadMusic(Integer songId, HttpServletRequest req) throws Exception {
		Song s = songBiz.getSongById(songId);
		File file = new File(req.getServletContext().getRealPath("/musics"), songId + ".mp3");
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", new String(
				(s.getSinger().getSingerName() + " - " + s.getSongName() + ".mp3").getBytes("UTF-8"), "ISO-8859-1"));
		return new ResponseEntity<byte[]>(FileUtils.getBytes(file), headers, HttpStatus.CREATED);
	}

}
