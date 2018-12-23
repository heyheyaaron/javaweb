package feiao.forum.barcode;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import feiao.forum.service.Constant;
 
/** 
 * @Description: 生成二维码 （QR格式）
 * @author lwei
 */
public class BarCode2DServlet extends HttpServlet {
 
    /**   
     * @Fields serialVersionUID : serialVersionUID 
     */
     
private static final long serialVersionUID = 1420531246182658867L;
	
	/** 定义二维码图片宽度 */
	private static final int WIDTH = 200;
	/** 定义二维码图片高度 */
	private static final int HEIGHT = 200;
	private static final String KEY = "noteid";
	private String url;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		/** 接收URL */
    	if(request.getParameter(KEY)!=null && !request.getParameter(KEY).equals("")){
    		String lead = request.getParameter(KEY).toString();
    		url = request.getParameter("url");
    		if (url == null || "".equals(url)){
    			url = Constant.WEB_FA+"/note/showNoteContent.do?id="+lead;
    			
    		}
    	}else{
    		
    		if(request.getParameter("codeurl")!=null && !request.getParameter("codeurl").equals("")){
    			
    			url =request.getParameter("codeurl").toString();
    		}else{
    			url = "";
    		}
    		
    	}
    	
		/** 告诉浏览器输出的内容是图片 */
		response.setContentType("images/png");
		
		/** 定义二维码需要的设置信息(用Map封装) */
		Map<EncodeHintType, Object> hints = new HashMap<>();
		/** 设置二维码图片中内容的编码 */
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		/** 设置二维码上下左右的边距 */
		hints.put(EncodeHintType.MARGIN, 1);
		
		/** 
		 * 创建二维码字节转换对象
		 * 第一个参数：二维码图片中的内容
		 * 第二个参数：二维码生成的格式器
		 * 第三个参数：二维码图片宽度
		 * 第四个参数：二维码图片高度
		 * 第五个参数：二维码需要设置信息
		 *  */
		BitMatrix matrix = null;
		try {
			matrix = new MultiFormatWriter()
				.encode(url, BarcodeFormat.QR_CODE, WIDTH, HEIGHT, hints);
		} catch (WriterException e) {
			e.printStackTrace();
		}
		/** 向浏览器输出二维码 */
		MatrixToImageWriter.writeToStream(matrix, "png", response.getOutputStream());
		
	}
    	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doGet(req, resp);
    }

	
    
     
}
