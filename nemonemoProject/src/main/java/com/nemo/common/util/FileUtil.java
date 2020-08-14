package com.nemo.common.util;

import java.io.File;
import java.net.URLEncoder;

import com.nemo.common.constrants.BrowserName;
import com.nemo.common.constrants.DirectoryName;

public class FileUtil {
	// 디렉토리 확인, 존재하지 않을 경우 생성
    public static void exsitDir(File file) throws Exception{
        if(file.exists() == false){
            file.mkdirs();
        }
    }
  
    // 해당 디렉토리 + 패스를 가져온다
    public static String getDirName(DirectoryName directoryName) {
    	return directoryName.toString();
    }
    // 해당 디렉토리 + 패스를 가져온다
    public static String getDirName(DirectoryName directoryName,  String path) {
    	return new StringBuffer(directoryName.toString()).append(path).toString();
    }
    
    
    public static File getFile(DirectoryName dirName, String fileName, String fileExt) {
    	StringBuffer realFile = new StringBuffer()
    			.append(dirName.getDirectoryName())
    			.append(fileName)
    			.append(".")
    			.append(fileExt);
    	return new File(realFile.toString());
    }
    
    // DB에 저장할 유일한 파일명으로 변경
    public static String getSaveFileNm(String orgFileName) throws Exception{
    	StringBuffer sb = new StringBuffer();
    	sb.append(DateUtil.getDate());
    	sb.append("_");
    	sb.append(orgFileName);
    	return sb.toString();
    }
    
    // DB에 저장할 유일한 파일명으로 변경
    public static String getSaveFileNm(String orgFileName, String orgFileExtension) throws Exception{
        StringBuffer sb = new StringBuffer();
        sb.append(DateUtil.getDate());
        sb.append("_");
        sb.append(orgFileName);
        sb.append(".");
        sb.append(orgFileExtension);
        return sb.toString();
    }
    
    // 디렉토리 + 파일이름 + 확장자명
    public static String getSaveFileDirNm(String dirName, String orgFileName, String orgFileExtension) throws Exception {
    	return new StringBuffer(dirName).append(getSaveFileNm(orgFileName, orgFileExtension)).toString();
    }
  
    // originalName에서 확장자를 제외한 이름만 가져오기
    public static String getOrgFileName(String orgFileName) {
    	return orgFileName.substring(0, orgFileName.lastIndexOf("."));
    }
    
    // originalName에서 확장자에 해당하는 이름만 가져오기
    public static String getExtension(String orgFileName) throws Exception {
    	return orgFileName.substring(orgFileName.lastIndexOf(".")+1);
    }
    
    // 파일 다운로드 시 Cilent의 브라우저에 따라 파일명의 인코딩 설정
    public static String getEncodedFileNameByBrowser(String filename, BrowserName browser) throws Exception {
        
           String encodedFilename = null;
           if (browser == BrowserName.MSIE) {
                encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
           } else if (browser == BrowserName.Firefox) {
                encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
           } else if (browser == BrowserName.Opera) {
                encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
           } else if (browser == BrowserName.Chrome) {
              StringBuffer sb = new StringBuffer();
              for (int i = 0; i < filename.length(); i++) {
                          char c = filename.charAt(i);
                          if (c > '~') {
                                     sb.append(URLEncoder.encode("" + c, "UTF-8"));
                          } else {
                                     sb.append(c);
                          }
              }
              encodedFilename = sb.toString();
           } else {
              throw new RuntimeException("Not supported browser");
           }
           return encodedFilename;
        }
    
    // 파일을 해당 디렉토리에서 삭제
    public static void deleteFile(String filePath) throws Exception{
        File file = new File(filePath);
        file.delete();
    }


}
