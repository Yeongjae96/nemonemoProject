package com.nemo.common.image.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nemo.common.constraints.DirectoryName;
import com.nemo.common.image.service.ProductFileService;
import com.nemo.common.util.ContextUtil;
import com.nemo.common.util.FileUtil;
import com.nemo.user.products.vo.UserBaseProductsImageVO;

import lombok.extern.slf4j.Slf4j;
import sun.nio.ch.IOUtil;

@Controller
@RequestMapping("/image/product")
public class ProductImageController {
	
	@Autowired
	private ProductFileService productFileService;
	
	@GetMapping("/{productImgNo}")
	public @ResponseBody void productImg(@PathVariable int productImgNo) {
		
		UserBaseProductsImageVO vo = productFileService.getFile(productImgNo);
		
		if(vo == null) return;
		
		String fileNm = vo.getProductImgFileName();
		String ext = vo.getProductImgType();
		
		BufferedOutputStream out = null;
		InputStream in = null;
		
		HttpServletResponse res = ContextUtil.getResponse();
		res.setCharacterEncoding("utf-8");
		try {
			res.setContentType("image/" + ext);
			res.setHeader("Content-Disposition", "inline;filename=" + fileNm+"."+ext.toLowerCase());
			File file = FileUtil.getFile(DirectoryName.PRODUCT, fileNm, ext);
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
			if(out != null){ try { out.flush(); out.close(); } catch (IOException e) { e.printStackTrace(); } }
			if(in != null){ try { in.close(); } catch (IOException e) { e.printStackTrace(); } }
		}
		
	}
	
	
}
