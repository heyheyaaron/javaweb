package feiao.forum.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.fabric.xmlrpc.base.Data;

import feiao.forum.dao.FaCommentDao;
import feiao.forum.dao.FaInteDao;
import feiao.forum.dao.FaNoteDao;
import feiao.forum.dao.FaNoteProDao;
import feiao.forum.dao.FaRankDao;
import feiao.forum.dao.FaSectionDao;
import feiao.forum.dao.FaSectionTypeDao;
import feiao.forum.dao.FaUserDao;
import feiao.forum.dao.FaUserViceDao;
import feiao.forum.pojo.FaInte;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaNoteVote;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaSectionType;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaUserVice;
import feiao.forum.service.BbsService;
import feiao.forum.service.Constant;
import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
import feiao.forum.util.RandomTools;

@Service
public class BbsServiceImpl implements BbsService{
	//版块
	@Autowired
	private FaSectionDao sectionDao;
	//会员
	@Autowired
	private FaUserDao userDao;
	//帖子
	@Autowired
	private FaNoteDao noteDao;
	//会员附属信息
	@Autowired
	private FaUserViceDao fuvDao;
	//积分
	@Autowired
	private FaInteDao inteDao;
	//版块中的分类
	@Autowired
	private FaSectionTypeDao fstDao;
	//反馈帖
	@Autowired
	private FaNoteProDao fnpDao;
	@Autowired
	private FaRankDao rankDao;
	@Autowired
	private FaCommentDao fcDao;
	
	//异步加载所有版块信息
	@Override
	public List<Map<String, Object>> selectAllModel() {
		try {
			
			return sectionDao.selectAllModel();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有版块信息方法出现异常",e);
		}
	}
	//根据id 查询版块信息
	@Override
	public FaSection getModelById(Integer id) {
		try {
			
			return sectionDao.getModelById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id 查询版块信息方法出现异常",e);
		}
	}
	//增加版块
	@Override
	public String addModelData(FaSection fs) {
		try {
			if(fs.getFa_name()==null||fs.getFa_name().equals("")){
				return "名称不能为空";
			}
			
			sectionDao.saveModel(fs);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加版块方法出现异常",e);
		}
	}
	//修改版块
	@Override
	public String updateModelData(FaSection fs) {
		try {
			if(fs.getFa_name()==null||fs.getFa_name().equals("")){
				return "名称不能为空";
			}
			if(fs.getFa_id().equals(fs.getFa_pid())){
				return "上级版块不能是自己本身";
			}
			sectionDao.updateModel(fs);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改版块方法出现异常",e);
		}
	}
	//删除版块
	@Override
	public String deleteModelData(Integer id) {
		try {
			//查询该版块下的子版块个数
			Long count = sectionDao.getModelCidCount(id);
			if(count>0){
				return "该版块下还存有子版块，请清除该版块下的子版块";
			}
			if(id<=8){
				return "该板块不能删除";
			}
			sectionDao.deleteModel(id);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("删除版块方法出现异常",e);
		}
	}
	//分页展示版主信息
	@Override
	public List<Map<String, Object>> getModeratorByPage(Integer curpage, String search, Integer pagesize,
			Integer isMo,Integer oneMo) {
		try {
			return userDao.getModeratorByPage((curpage-1)*pagesize, search, pagesize,isMo,oneMo);
		} catch (Exception e) {
			throw new RuntimeException("分页展示版主信息方法出现异常",e);
		}
	}
	//查询版主数量
	@Override
	public Long getTotalByModerator(String search, Integer isMo,Integer oneMo) {
		try {
			return userDao.getTotalByModerator(search,isMo,oneMo);
		} catch (Exception e) {
			throw new RuntimeException("查询版主数量方法出现异常",e);
		}
	}
	//根据手机和邮箱验证会员是否存在
	@Override
	public Integer selectUserByTelOrEmail(String userId) {
		try {
			Long count = userDao.selectUserByTelOrEmail(userId);
			int i = count.intValue();
			if(i==1){
				return 1;
			}else{
				return 0;
			}
			
		} catch (Exception e) {
			throw new RuntimeException("根据手机和邮箱验证会员是否存在方法出现异常",e);
		}
	}
	//增加版主
	@Override
	public String addModeratorData(String userId, Integer typeMo, Integer oneMo) {
		try {
			Map<String, Object> map = userDao.findUserIdAndMoByUsername(userId);
			
			if(map==null ||map.get("id")==null){
				return "该会员不存在";
			}
			Integer i = Integer.parseInt(map.get("ishost").toString());
			if(!i.equals(0)){
				return "添加失败，该会员已经是版主";
			}
			if(!typeMo.equals(1)&&!typeMo.equals(2)){
				return "请选择版主类别";
			}
			if(typeMo.equals(2)){
				oneMo=0;
			}
			if(typeMo.equals(1)){
				if(oneMo.equals(0)){
					return "请选择需要管理的版块";
				}
			}
			userDao.addModerator(map.get("id").toString(),typeMo,oneMo);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加版主方法出现异常",e);
		}
	}
	//修改版主
	@Override
	public String updateModeratorData(String id, Integer typeMo, Integer oneMo) {
		try {
			
			if(!typeMo.equals(1)&&!typeMo.equals(2)){
				return "请选择版主类别";
			}
			if(typeMo.equals(2)){
				oneMo=0;
			}
			if(typeMo.equals(1)){
				if(oneMo.equals(0)){
					return "请选择需要管理的版块";
				}
			}
			userDao.addModerator(id,typeMo,oneMo);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改版主方法出现异常",e);
		}
	}
	//删除版主
	@Override
	public Integer deleteModeratorData(String[] ids) {
		try {
			return userDao.deleteModerator(ids);
		} catch (Exception e) {
			throw new RuntimeException("删除版主方法出现异常",e);
		}
	}
	//分页展示帖子信息
	@Override
	public List<Map<String, Object>> getNoteByPage(Integer curpage, String search, Integer pagesize, Integer noteTpye,
			Integer modelid) {
		try {
			return noteDao.getNoteByPage((curpage-1)*pagesize,search,pagesize,noteTpye,modelid);
		} catch (Exception e) {
			throw new RuntimeException("分页展示帖子信息方法出现异常",e);
		}
	}
	//查询帖子总数
	@Override
	public Long getTotalByNote(String search, Integer noteTpye, Integer modelid) {
		try {
			return noteDao.getTotalByNote(search,noteTpye,modelid);
		} catch (Exception e) {
			throw new RuntimeException("查询帖子总数方法出现异常",e);
		}
	}
	//删除帖子
	@Override
	public Integer deleteNoteData(String[] ids,HttpServletRequest request) {
		try {
			for (String str : ids) {
				FaNote fn = noteDao.getNoteById(str);
				FaUser fu = userDao.getMemberById(fn.getFa_userid());
				delAddInteAndFeibiao(request,fu);
			}
			noteDao.deleteNoteData(ids);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("//删除帖子方法出现异常",e);
		}
	}
	//删帖
	public void delAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getDeletez().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_del_type().equals(1)){
					//查看该周期的次数
					if(!rps.getDeletet().equals(0)){
						
						if(rps.getDeletet()<=fuv.getFa_del_times()+1){
							fuv.setFa_del_type(1);
							fuv.setFa_del_times(fuv.getFa_del_times()+1);
							i=1;
						}else{
							fuv.setFa_del_times(fuv.getFa_del_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_del_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getDeletez().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_del_type().equals(1)){
					if(1<=fuv.getFa_del_times()+1){
						fuv.setFa_del_type(1);
						fuv.setFa_del_times(fuv.getFa_del_times()+1);
						i=1;
					}else{
						fuv.setFa_del_times(fuv.getFa_del_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_del_type().equals(1)){
					//查看该周期的次数
					if(!rps.getDeletet().equals(0)){
						
						if(rps.getDeletet()<=fuv.getFa_del_times()+1){
							fuv.setFa_del_type(1);
							fuv.setFa_del_times(fuv.getFa_del_times()+1);
							i=1;
						}else{
							fuv.setFa_del_times(fuv.getFa_del_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_del_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateDeleteMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "删帖", rps.getDeleteInte(), 0, "删帖",fu.getFa_jifen()+rps.getDeleteInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "删帖", rps.getDeleteFb(), 1, "删帖",fu.getFa_feibiao()+rps.getDeleteFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getDeleteInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getDeleteFb());
				userDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						userDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException("删帖加积分方法出现错误",e);
		}
	}
	//置顶帖子
	@Override
	public Integer zdNoteData(String[] ids) {
		try {
			noteDao.zdNoteData(ids);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("//置顶帖子方法出现异常",e);
		}
	}
	//精华帖子
	@Override
	public Integer jhNoteData(String[] ids) {
		try {
			noteDao.jhNoteData(ids);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("//精华帖子方法出现异常",e);
		}
	}
	//高亮帖子
	@Override
	public Integer glNoteData(String[] ids) {
		try {
			noteDao.glNoteData(ids);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("//高亮帖子方法出现异常",e);
		}
	}
	//根据id 查询帖子信息
	@Override
	public FaNote getNoteById(String id) {
		try {
			
			return noteDao.getNoteById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id 查询帖子信息方法出现异常",e);
		}
	}
	//根据id 查询会员昵称
	@Override
	public String getNameByUserId(String id) {
		try {
			
			return userDao.getNameByUserId(id);
		} catch (Exception e) {
			throw new RuntimeException("//根据id 查询会员昵称方法出现异常",e);
		}
	}
	//异步加载该版块下的分类信息
	@Override
	public List<Map<String, Object>> selectAllReType(Integer id) {
		try {
			
			return fstDao.selectAllReType(id);
		} catch (Exception e) {
			throw new RuntimeException("异步加载该版块下的分类信息方法出现异常",e);
		}
	}
	//分页展示某版块分类信息
	@Override
	public List<Map<String, Object>> getMlTypeByPage(Integer curpage, Integer pagesize,Integer id) {
		try {
			
			return fstDao.getMlTypeByPage((curpage-1)*pagesize,pagesize,id);
		} catch (Exception e) {
			throw new RuntimeException("分页展示某版块分类信息方法出现异常",e);
		}
	}
////分页展示版块分类信息的总数
	@Override
	public Long getTotalByMlType(Integer id) {
		try {
			
			return fstDao.getTotalByMlType(id);
		} catch (Exception e) {
			throw new RuntimeException("分页展示版块分类信息的总数方法出现异常",e);
		}
	}
	//根据di 查询版块分类信息
	@Override
	public FaSectionType getMlTypeById(String id) {
		try {
			
			return fstDao.getMlTypeById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据di 查询版块分类信息方法出现异常",e);
		}
	}
	//增加版块分类
	@Override
	public String addMlTypeData(FaSectionType fst) {
		try {
			if(fst.getFa_name()==null || fst.getFa_name().equals("")){
				return "分类名称不能为空";
			}
			SimpleDateFormat sdf =new SimpleDateFormat("yyMMddHHmm");
			Date date =new Date();
			String ids = sdf.format(date)+RandomStringUtils.randomNumeric(8)+RandomTools.getRandomString(2);
			fst.setFa_id(ids);
			fstDao.addMlType(fst);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("//增加版块分类分类信息方法出现异常",e);
		}
	}
	//修改版块分类
	@Override
	public String updateMlTypeData(FaSectionType fst) {
		try {
			if(fst.getFa_name()==null || fst.getFa_name().equals("")){
				return "分类名称不能为空";
			}
			fstDao.updateMlType(fst);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("//修改版块分类方法出现异常",e);
		}
	}
	//删除版块分类
	@Override
	public Integer deleteMlTypeData(String id) {
		try {
			
			fstDao.deleteMlType(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("//删除版块分类方法出现异常",e);
		}
	}
	//修改帖子信息（后台）
	@Override
	public String updateNote(FaNote fn) {
		try {
			System.out.println("这这这？？？？"+fn.getFa_prodel());
			if(fn.getFa_prodel()==null || fn.getFa_prodel().equals("")){
				fn.setFa_prodel(0);
			}
			noteDao.updateNote(fn);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改帖子信息（后台）方法出现异常",e);
		}
	}
	//根据投票调查贴id信息查询调查和投票的数据
	@Override
	public List<Map<String, Object>> getVoteMsgByNoteId(String id) {
		try {
			
			List<FaNoteVote> list =noteDao.getVoteMsgByNoteId(id);
			
			List<Map<String, Object>> blist = new ArrayList<>();
			Integer sum = 0;
			for (FaNoteVote fnv : list) {
				sum=sum+fnv.getFa_count();
			}
			for (FaNoteVote fnv : list) {
				Map<String, Object> bmap = new HashMap<>();
				bmap.put("id", fnv.getFa_id());
				bmap.put("sum", sum);
				bmap.put("answer", fnv.getFa_aandq());
				bmap.put("count", fnv.getFa_count());
				if(sum<=0){
					bmap.put("percent", 0);
				}else{
					double dou = fnv.getFa_count().doubleValue()/sum*100;
					BigDecimal   b   =   new   BigDecimal(dou);  
					double   f1   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
					bmap.put("percent", f1+"%");
				}
				
				
				blist.add(bmap);
				
			}
			return blist;
		} catch (Exception e) {
			throw new RuntimeException("根据投票调查贴id信息查询调查和投票的数据方法出现异常",e);
		}
	}
	//异步加载活动帖的参与者信息
	@Override
	public List<Map<String, Object>> findAllPreMsgByNoteId(String id) {
		try {
			
			return noteDao.findAllPreMsgByNoteId(id);
		} catch (Exception e) {
			throw new RuntimeException("异步加载活动帖的参与者信息方法出现异常",e);
		}
	}
	//删除上级时间段的热搜数据
	@Override
	public void removeHotedData() {
		try {
			
			noteDao.removeHotedData();
		} catch (Exception e) {
			throw new RuntimeException("//删除上级时间段的热搜数据方法出现异常",e);
		}
		
	}
	//更新这个时间段的热搜数据
	@Override
	public void updateNewHotData() {
		try {
			
			noteDao.updateNewHotData();
		} catch (Exception e) {
			throw new RuntimeException("//更新这个时间段的热搜数据方法出现异常",e);
		}
		
	}
	//根据帖子id查询绑定的标签
	@Override
	public List<String> getTypeNameById(String fa_id) {
		try {
			
			return noteDao.getTypeNameById(fa_id);
		} catch (Exception e) {
			throw new RuntimeException("根据帖子id查询绑定的标签方法出现异常",e);
		}
	}
	
	
	
	//分页展示产品类别信息
	@Override
	public List<Map<String, Object>> getTypeByPage() {
		try {
			
			return fnpDao.getTypeByPage();
		} catch (Exception e) {
			throw new RuntimeException("分页展示产品类别方法出现异常",e);
		}
	}
	//根据id获取产品类别信息
	@Override
	public Map<String, Object> getTypeById(Integer id) {
		try {
			
			return fnpDao.getType(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取产品类别方法出现异常",e);
		}
	}
	//增加产品类别
	@Override
	public String addTypeData(String name,Integer sort) {
		try {
			if(name==null || name.equals("")){
				return "产品类别不能为空";
			}
			if(sort==null){
				return "排序不能为空";
			}
			if(sort<0 || sort>999){
				return "排序范围为0~999";
			}
			fnpDao.addType(name,sort);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加产品类别方法出现异常",e);
		}
	}
	//修改产品类别
	@Override
	public String updateTypeData(Integer id,String name,Integer sort) {
		try {
			if(name==null || name.equals("")){
				return "产品类别不能为空";
			}
			if(sort==null){
				return "排序不能为空";
			}
			if(sort<0 || sort>999){
				return "排序范围为0~999";
			}
			fnpDao.updateType(id,name,sort);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改产品类别方法出现异常",e);
		}
	}
	//删除产品类别
	@Override
	public Integer deleteTypeData(Integer id) {
		try {
			fnpDao.deleteType(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除产品类别方法出现异常",e);
		}
	}
	
	
	
	//分页展示产品型号信息
	@Override
	public List<Map<String, Object>> getStyleByPage() {
		try {
			
			return fnpDao.getStyleByPage();
		} catch (Exception e) {
			throw new RuntimeException("分页展示产品型号方法出现异常",e);
		}
	}
	//根据id获取产品型号信息
	@Override
	public Map<String, Object> getStyleById(Integer id) {
		try {
			
			return fnpDao.getStyle(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取产品型号方法出现异常",e);
		}
	}
	//增加产品型号
	@Override
	public String addStyleData(String name,Integer sort,Integer parentId) {
		try {
			if(name==null || name.equals("")){
				return "产品型号不能为空";
			}
			if(sort==null){
				return "排序不能为空";
			}
			if(sort<0 || sort>999){
				return "排序范围为0~999";
			}
			fnpDao.addStyle(name,sort,parentId);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加产品型号方法出现异常",e);
		}
	}
	//修改产品型号
	@Override
	public String updateStyleData(Integer id,String name,Integer sort, Integer parentId) {
		try {
			if(name==null || name.equals("")){
				return "产品型号不能为空";
			}
			if(sort==null){
				return "排序不能为空";
			}
			if(sort<0 || sort>999){
				return "排序范围为0~999";
			}
			fnpDao.updateStyle(id,name,sort, parentId);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改产品型号方法出现异常",e);
		}
	}
	//删除产品型号
	@Override
	public Integer deleteStyleData(Integer id) {
		try {
			fnpDao.deleteStyle(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除产品型号方法出现异常",e);
		}
	}
	

	
	
	//分页展示产品问题信息
	@Override
	public List<Map<String, Object>> getQuestByPage() {
		try {
			
			return fnpDao.getQuestByPage();
		} catch (Exception e) {
			throw new RuntimeException("分页展示产品问题方法出现异常",e);
		}
	}
	//根据id获取产品问题信息
	@Override
	public Map<String, Object> getQuestById(Integer id) {
		try {
			
			return fnpDao.getQuest(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取产品问题方法出现异常",e);
		}
	}
	//增加产品问题
	@Override
	public String addQuestData(String name,Integer sort) {
		try {
			if(name==null || name.equals("")){
				return "产品问题不能为空";
			}
			if(sort==null){
				return "排序不能为空";
			}
			if(sort<0 || sort>999){
				return "排序范围为0~999";
			}
			fnpDao.addQuest(name,sort);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加产品问题方法出现异常",e);
		}
	}
	//修改产品问题号
	@Override
	public String updateQuestData(Integer id,String name,Integer sort) {
		try {
			if(name==null || name.equals("")){
				return "产品问题不能为空";
			}
			if(sort==null){
				return "排序不能为空";
			}
			if(sort<0 || sort>999){
				return "排序范围为0~999";
			}
			fnpDao.updateQuest(id,name,sort);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改产品问题方法出现异常",e);
		}
	}
	//删除产品问题
	@Override
	public Integer deleteQuestData(Integer id) {
		try {
			fnpDao.deleteQuest(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除产品问题方法出现异常",e);
		}
	}
	@Override
	public List<Map<String, Object>> getStyleByPageByPid(Integer pid) {
		try {
			
			return fnpDao.getStyleByPageByPid(pid);
		} catch (Exception e) {
			throw new RuntimeException("分页展示产品型号方法出现异常",e);
		}
	}
	@Override
	public Integer deleteNoteData(String id, HttpServletRequest request, String nid) {
		try {
			
			noteDao.deleteCommentData(id,nid);
			noteDao.deleteCommentCidData(id,nid);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("//删除评论方法出现异常",e);
		}
	}
	//查询该帖子的数据
	@Override
	public List<Map<String, Object>> getCommentByPage(Integer curpage, Integer pagesize, String id) {
		try {
			
			return fcDao.getCommentByPage(curpage, pagesize, id);
		} catch (Exception e) {
			throw new RuntimeException("//查询该帖子的数据方法出现异常",e);
		}
	}
	//查询该帖子的数据数量
	@Override
	public Long getTotalByComment(String id) {
		try {
			
			return fcDao.getMoreMoodMsgCount(id);
		} catch (Exception e) {
			throw new RuntimeException("//查询该帖子的数据数量出现异常",e);
		}
	}

}
