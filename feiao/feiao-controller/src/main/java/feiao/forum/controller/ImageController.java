package feiao.forum.controller;

import java.awt.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import feiao.forum.imageUtil.FileUtil;
import feiao.forum.imageUtil.ImageUtil;


@Controller
@RequestMapping("/image")
public class ImageController {
	
	@RequestMapping(value="/fileUpload.do")
	@ResponseBody
	public Map<String, Object> sureUpdateLabel(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "file", required = false) MultipartFile file,String fileFileContentType,String saveDir){
		String message = "你已成功上传文件";
		Map<String, Object> responseData = new HashMap<>();
		response.setContentType("text/html");
		try { 
			 System.out.println("进来了吗");
            FileUtil.createDirectory(request.getSession().getServletContext().getRealPath("/image")); 
            String pat = request.getSession().getServletContext().getRealPath("/image/"+saveDir);
            FileUtil.createDirectory(pat); 
            String path = pat;  
            //如果文件夹不存在则创建      
           
            String fileFileName = file.getOriginalFilename();
            FileUtil.createDirectory(path); 
            String fname = "/"+RandomStringUtils.randomNumeric(6)+fileFileName.substring(fileFileName.lastIndexOf("."));
             
            	CommonsMultipartFile cf= (CommonsMultipartFile)file; 
            	
            	DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
            	
            	File f = fi.getStoreLocation();
                if(fileFileName.endsWith(".exe")){  
                    message="对不起,你上传的文件格式不允许!!!";  
                    responseData.put("message",message);
                    responseData.put("trueOrFalse",0);
                    return responseData;
                }
                long   size =   f.length(); //   大小   bytes 
               
                if(size>4194304){
                	message="对不起,你上传的图片过大,不能超过4M!!!";
                	responseData.put("message",message);
                	responseData.put("trueOrFalse",0);
                	return responseData;
                }
                if(fileFileName.endsWith(".gif")){
                	if(size>524288){
                    	message="对不起,gif图过大,不能超过500k!!!";
                    	responseData.put("message",message);
                    	responseData.put("trueOrFalse",0);
                    	return responseData;
                    }
                	FileInputStream inputStream = new FileInputStream(f);
                	FileOutputStream outputStream = new FileOutputStream(new File(path +fname)); 
	                byte[] buf = new byte[1024];  
	                int length = 0;  
	                while ((length = inputStream.read(buf)) != -1) {  
	                    outputStream.write(buf, 0, length);  
	                }  
	                inputStream.close();  
	                outputStream.flush();
                }else{
                	Image srcFile = ImageIO.read(f);   
                    int w = srcFile.getWidth(null);    
                    int h = srcFile.getHeight(null);    
                    int q = 1;
                    if(h>400){
                    	if(w>400){
                    		q=2;
                    	}
                    }
                    if(w>0){    
                       
                        w = w/q;  
                        if(h>0){    
                            
                        	h = h/q;    
                        } 
                    }else{    
                        if(h>0){    
                              
                        	h = h/q;    
                        }    
                    }
                    ImageUtil.compress(f, path +fname, w, h);
                }
                
               
            //配置完成的URL例如：http://192.168.1.112:8083/ggg/ggg.jsp
            String url = "/image/"+saveDir+fname;
            responseData.put("message",message);
            responseData.put("fileFileName",url);
            responseData.put("trueOrFalse",1);
            return responseData;  
        	} catch (Exception e) {  
        		System.out.println("报错");
                e.printStackTrace();  
                message = "对不起,文件上传失败了!!!!";  
                responseData.put("message",message);
                responseData.put("trueOrFalse",0);
                return responseData;
            } 
	}
	
	
	@RequestMapping(value="/fileUploads.do")
	@ResponseBody
	public Map<String, Object> sureUpdateLabels(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "file", required = false) MultipartFile file,String fileFileContentType,String saveDir){
		String message = "你已成功上传文件";
		Map<String, Object> responseData = new HashMap<>();
		response.setContentType("text/html");
		try { 
            FileUtil.createDirectory(request.getSession().getServletContext().getRealPath("/image")); 
            String pat = request.getSession().getServletContext().getRealPath("/image/"+saveDir);
            FileUtil.createDirectory(pat); 
            String path = pat;  
            //如果文件夹不存在则创建      
           
            String fileFileName = file.getOriginalFilename();
            FileUtil.createDirectory(path); 
            String fname = "/"+RandomStringUtils.randomNumeric(6)+fileFileName.substring(fileFileName.lastIndexOf("."));

        	CommonsMultipartFile cf= (CommonsMultipartFile)file; 
        	
        	DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
        	
        	File f = fi.getStoreLocation();
            if(fileFileName.endsWith(".exe")){  
                message="对不起,你上传的文件格式不允许!!!";  
                responseData.put("message",message);
                responseData.put("trueOrFalse",0);
                return responseData;
            }
            long   size =   f.length(); //   大小   bytes 
           
            if(size>4194304){
            	message="对不起,你上传的图片过大,不能超过4M!!!";
            	responseData.put("message",message);
            	responseData.put("trueOrFalse",0);
            	return responseData;
            }
            FileInputStream inputStream = new FileInputStream(f);  
            
            FileOutputStream outputStream = new FileOutputStream(new File(path +fname)); 
            byte[] buf = new byte[1024];  
            int length = 0;  
            while ((length = inputStream.read(buf)) != -1) {  
                outputStream.write(buf, 0, length);  
            }  
            inputStream.close();  
            outputStream.flush();
               
                
                
                
               
            //配置完成的URL例如：http://192.168.1.112:8083/ggg/ggg.jsp
            String url = "/image/"+saveDir+fname;
            responseData.put("message",message);
            responseData.put("fileFileName",url);
            responseData.put("trueOrFalse",1);
            return responseData;  
        	} catch (Exception e) {  
        		System.out.println("报错");
                e.printStackTrace();  
                message = "对不起,文件上传失败了!!!!";  
                responseData.put("message",message);
                responseData.put("trueOrFalse",0);
                return responseData;
            } 
	}
}
