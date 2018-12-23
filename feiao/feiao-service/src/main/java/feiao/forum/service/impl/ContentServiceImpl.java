package feiao.forum.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import feiao.forum.dao.FaConMsgDao;
import feiao.forum.dao.FaConTypeDao;
import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaConType;
import feiao.forum.pojo.FaLabel;
import feiao.forum.service.ContentService;

@Service
public class ContentServiceImpl implements ContentService{
	@Autowired
	private FaConTypeDao fctDao;
	@Autowired
	private FaConMsgDao fcmDao;
	
	//根据id获取内容分类信息
	@Override
	public FaConType getConTypeById(Integer id) {
		try {
			
			return fctDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取内容分类信息方法出现异常",e);
		}
	}
	//增加内容分类
	@Override
	public String addConTypeData(FaConType fl) {
		try {
			if(fl.getFa_name()==null || fl.getFa_name().equals("")){
				return "内容分类名称不能为空";
			}
			if(fl.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fl.getFa_sort()<0 || fl.getFa_sort()>999){
				return "排序范围为0~999";
			}
			
			fctDao.addConType(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加内容分类方法出现异常",e);
		}
	}
	//修改内容分类
	@Override
	public String updateConTypeData(FaConType fl) {
		try {
			if(fl.getFa_name()==null || fl.getFa_name().equals("")){
				return "内容分类名称不能为空";
			}
			if(fl.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fl.getFa_sort()<0 || fl.getFa_sort()>999){
				return "排序范围为0~999";
			}
			if(fl.getFa_id().equals(fl.getFa_pid())){
				return "不能设置自身为上级";
			}
			fctDao.updateConType(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改内容分类方法出现异常",e);
		}
	}
	//删除内容分类
	@Override
	public Integer deleteConTypeData(Integer id) {
		try {
			Long count = fctDao.findCountByTypeCid(id);
			if(id<=33){
				return 4;
			}
			if(count.intValue()>0){
				return 2;
			}else{
				Long counts = fctDao.findCountByTypebid(id);
				if(counts.intValue()>0){
					return 3;
				}else{
					fctDao.deleteConType(id);
					return 1;
				}
				
				
			}
			
		} catch (Exception e) {
			throw new RuntimeException("删除内容分类方法出现异常",e);
		}
	}
	//异步加载所有内容分类信息
	@Override
	public List<FaConType> getAllConType() {
		try {
			return fctDao.getAllConType();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有内容分类信息方法出现异常",e);
		}
	}
	////异步加载内容分类的内容树
	@Override
	public List<Map<String, Object>> loadConmsgTree() {
		try {
			return fctDao.loadConmsgTree();
		} catch (Exception e) {
			throw new RuntimeException("//异步加载内容分类的内容树方法出现异常",e);
		}
	}
	//异步加载该分类下的内容
	@Override
	public List<Map<String, Object>> getConMsgByPage(Integer curpage, Integer pagesize, Integer id) {
		try {
			return fcmDao.getConMsgByPage(curpage,pagesize,id);
		} catch (Exception e) {
			throw new RuntimeException("//异步加载该分类下的内容方法出现异常",e);
		}
	}
	//异步加载该分类下的内容数量
	@Override
	public Long getCountByPid(Integer id) {
		try {
			return fcmDao.getCountByPid(id);
		} catch (Exception e) {
			throw new RuntimeException("//异步加载该分类下的内容数量方法出现异常",e);
		}
	}
	//根据id查询内容信息
	@Override
	public FaConMsg getFCMForId(String bid) {
		try {
			return fcmDao.getFCMForId(bid);
		} catch (Exception e) {
			throw new RuntimeException("//根据id查询内容信息方法出现异常",e);
		}
	}
	//增加内容
	@Override
	public String addConMsgData(FaConMsg fl) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String id = sdf.format(new Date())+RandomStringUtils.randomNumeric(9);
			fl.setFa_id(id);
			fcmDao.saveConMsg(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加内容方法出现异常",e);
		}
	}
	//修改内容
	@Override
	public String updateConMsgData(FaConMsg fl) {
		try {
			fcmDao.updateConMsg(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改内容方法出现异常",e);
		}
	}
	//删除内容
	@Override
	public Integer deleteConMsgData(String[] id) {
		try {
			fcmDao.deleteConMsg(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除内容方法出现异常",e);
		}
	}
	//异步加载内容分类的没有子元素的数据
	@Override
	public List<Map<String, Object>> selectAllMsgByCid() {
		try {
			List<Map<String, Object>> list = fcmDao.selectAllMsgByCid();
			List<Map<String, Object>> listm = new ArrayList<>();
			for (Map<String, Object> map : list) {
				map.put("status", 0);
			}
			for (Map<String, Object> map : list) {
				
				for (Map<String, Object> maps : list) {
					if(map.get("pid").toString().equals(maps.get("id").toString())){
						maps.put("status", 1);
					}
				}
			}
			for (Map<String, Object> map : list) {
				if((Integer.parseInt(map.get("status").toString()))<1){
					listm.add(map);
				}
			}
			return listm;
		} catch (Exception e) {
			throw new RuntimeException("异步加载内容分类的没有子元素的数据方法出现异常",e);
		}
	}
	//微博
	@Override
	public Map<String, Object>findIndexWB() {
		try {
			
			return fcmDao.findIndexWB();
		} catch (Exception e) {
			throw new RuntimeException("微博出现异常",e);
		}
	}
	//微信
	@Override
	public Map<String, Object> findIndexWX() {
		try {
			
			return fcmDao.findIndexWX();
		} catch (Exception e) {
			throw new RuntimeException("微信方法出现异常",e);
		}
	}
	//QQ
	@Override
	public Map<String, Object> findIndexQQ() {
		try {
			
			return fcmDao.findIndexQQ();
		} catch (Exception e) {
			throw new RuntimeException("QQ方法出现异常",e);
		}
	}
}
