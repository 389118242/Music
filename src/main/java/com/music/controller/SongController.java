package com.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.biz.SongBiz;
import com.music.entity.Album;
import com.music.entity.Song;

@Controller
public class SongController {

	@Autowired
	SongBiz sob;

	@RequestMapping("song")
	public String showView(int songId, Model model) {
		// �õ�����������Ϣ
		Song song = sob.getSongById(songId);
		// �õ���������
		int singerId = song.getSingerId();
		String singerName = sob.getSingerNameById(singerId);
		// �õ�ר�����ֺ�ͼƬ
		int albumId = song.getAlbumId();
		Album album = sob.getAlbumnameAndImg(albumId);
		System.out.println(album);
		// ҳ����ʾ���
		String lyr = song.getLyric();
		// System.out.println(lyr);
		String[] lyrs = lyr.split("\\[\\d\\d:\\d\\d\\.\\d\\d\\]");
		song.setLyric(null);
		model.addAttribute("song", song);
		model.addAttribute("lyrs", lyrs);
		model.addAttribute("singerName", singerName);
		model.addAttribute("album", album);
		return "songDetail";
	}

	//����
	@RequestMapping("count")
	public void count(Integer songId, Model model) {
		sob.addPlayNum(songId);
	}

}
