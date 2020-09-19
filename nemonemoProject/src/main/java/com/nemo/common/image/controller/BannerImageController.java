package com.nemo.common.image.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nemo.admin.sites.banner.vo.BannerImageVO;
import com.nemo.common.constraints.DirectoryName;
import com.nemo.common.image.service.BannerFileService;
import com.nemo.common.util.ContextUtil;
import com.nemo.common.util.FileUtil;

@Controller
@RequestMapping("/image/banner")
public class BannerImageController {
	
	@Autowired
	private BannerFileService bannerFileService;
	
	@GetMapping("/{bannerImgNo}")
	public @ResponseBody void bannerImg(@PathVariable int bannerImgNo) {
		
		BannerImageVO vo = bannerFileService.getFile(bannerImgNo);
		
		if(vo == null) return;
		
		String fileNm = vo.getBannerImgFileName();
		String ext = vo.getBannerImgType();
		
		BufferedOutputStream out = null;
		InputStream in = null;
		
		HttpServletResponse res = ContextUtil.getResponse();
		res.setCharacterEncoding("utf-8");
		try {
			res.setContentType("image/" + ext);
			res.setHeader("Content-Disposition", "inline;filename=" + fileNm+"."+ext.toLowerCase());
			File file = FileUtil.getFile(DirectoryName.BANNER, fileNm, ext);
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(res.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(out != null){ try { out.flush(); } catch (IOException e) { e.printStackTrace(); } }
			if(out != null){ try { out.close(); } catch (IOException e) { e.printStackTrace(); } }
			if(in != null){ try { in.close(); } catch (IOException e) { e.printStackTrace(); } }
		}
		
	}
	
	
}
