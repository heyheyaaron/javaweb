package feiao.forum.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.web.multipart.MultipartFile;


/**
 * 操作Excel的工具类
 *
 */
public final class ExcelTools {
	
	/**
	 * 数据导出Excel的方法
	 * @param sheetname 工作单的名称
	 * @param titles 标题行
	 * @param data 数据
	 * @param fileName 文件名
	 * @param response 响应对象
	 */
	public static void exportExcel(String sheetname, String[] titles, List<?> data, 
					String fileName, HttpServletResponse response, 
					HttpServletRequest request) throws Exception{
		/** 创建工作簿 */
		HSSFWorkbook workbook = new HSSFWorkbook();
		/** 创建工作单 */
		HSSFSheet sheet = workbook.createSheet(sheetname);
		
		/** 创建Excel中第一行(作为标题行) */
		HSSFRow row = sheet.createRow(0);
		/** 循环创建第一行中的Cell（单元格） */
		for (int i = 0; i < titles.length; i++){
			/** 创建Cell */
			HSSFCell cell = row.createCell(i);
			/** 设置单元格中的内容 */
			cell.setCellValue(titles[i]);
		}
		
		/**  循环创建下面行中的数据   */
		for (int i = 0; i < data.size(); i++){
			/** 循环创建行 */
			row = sheet.createRow(i + 1);
			/** 获取集合中元素 */
			Object obj = data.get(i);
			/**
			 * 把obj对象中数据作为Excel中的一行数据, 
			 * obj对象中的属性就是一行中的列 
			 * 利用反射获取所有的Field
			 * */
			Field[] fields = obj.getClass().getDeclaredFields();
			/** 迭代Field */
			for (int j = 0; j < fields.length; j++){
				/** 创建Cell */
				HSSFCell cell = row.createCell(j);
				/** 获取该字段名称 */
				String fieldName = fields[j].getName();
				/** 转化成get方法 */
				String getMethodName = "get" + StringUtils.capitalize(fieldName);
				/** 获取方法 */
				Method method = obj.getClass().getDeclaredMethod(getMethodName);
				/** 调用get方法该字段的值 */
				Object res = method.invoke(obj);
				/** 设置该Cell中的内容 */
				cell.setCellValue(res == null ? "" : res.toString());
			}
		}
		/** 获取当前浏览器 */
		String userAgent = request.getHeader("user-agent");
		/** 文件名是中文转码 */
		if (userAgent.toLowerCase().indexOf("msie") != -1){
			fileName = URLDecoder.decode(fileName, "gbk"); // utf-8 --> gbk
			fileName = new String(fileName.getBytes("gbk"), "iso8859-1"); // gbk --> iso8859-1
		}else{
			fileName = new String(fileName.getBytes("utf-8"), "iso8859-1"); // utf-8 --> iso8859-1
		}
		/** 告诉浏览器文件名 */
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
		/** 向浏览器输出Excel */
		workbook.write(response.getOutputStream());
		/** 关闭 */
		workbook.close();
	}
	
	/**
	 * 读取Excel数据方法
	 * @param excel 文件
	 * @return 集合
	 */
	public static List<Map<Integer, Object>> excelImport(MultipartFile excel) throws Exception{
		//获得文件名
        InputStream is = excel.getInputStream();
		/** 创建工作簿 */
		HSSFWorkbook workbook = new HSSFWorkbook(is);
		/** 获取第一个工作单 */
		HSSFSheet sheet = workbook.getSheetAt(0);
		/** 获取最后一行的编号 */
		int totalNum = sheet.getLastRowNum();
		/** 创建List集合封装Excel中的数据 */
		List<Map<Integer, Object>> lists = new ArrayList<>();
		/** 迭代读取Excel中一行数据 */
		for (int i = 1; i <= totalNum; i++){
			/** 获取该行列的迭代器 */
			Iterator<Cell> cells = sheet.getRow(i).cellIterator();
			/** 创建Map集合封装一行数据 */
			Map<Integer, Object> data = new HashMap<>();
			/** 迭代列 */
			while(cells.hasNext()){
				/** 获取列  */
				Cell cell = cells.next();
				/** 获取当前列的索引号 */
				int index = cell.getColumnIndex();
				/** 对列中的数据类型做判断 */
				if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
					if (DateUtil.isCellDateFormatted(cell)){
						Date date = cell.getDateCellValue();
						data.put(index, date);
					}else{
						data.put(index, cell.getNumericCellValue());
					}
				}else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){
					data.put(index, cell.getBooleanCellValue());
				}else{
					data.put(index, cell.getStringCellValue().trim());
				}
			}
			lists.add(data);
		}
		return lists;
	}
}