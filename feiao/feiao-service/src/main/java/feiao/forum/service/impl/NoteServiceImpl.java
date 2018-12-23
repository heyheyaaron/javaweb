package feiao.forum.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import feiao.forum.dao.FaCommentDao;
import feiao.forum.dao.FaConMsgDao;
import feiao.forum.dao.FaGroupsDao;
import feiao.forum.dao.FaInteDao;
import feiao.forum.dao.FaMyFriendDao;
import feiao.forum.dao.FaNoteDao;
import feiao.forum.dao.FaRankDao;
import feiao.forum.dao.FaSectionDao;
import feiao.forum.dao.FaSelfMoodDao;
import feiao.forum.dao.FaSentMessageDao;
import feiao.forum.dao.FaTorFDao;
import feiao.forum.dao.FaUserDao;
import feiao.forum.dao.FaUserViceDao;
import feiao.forum.pojo.FaComment;
import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaInte;
import feiao.forum.pojo.FaMyFriend;
import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaNoteActive;
import feiao.forum.pojo.FaNoteVote;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaSelfMood;
import feiao.forum.pojo.FaSentMessage;
import feiao.forum.pojo.FaTorF;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaUserVice;
import feiao.forum.pojo.FaUserVote;
import feiao.forum.service.Constant;
import feiao.forum.service.NoteService;
import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
import feiao.forum.util.RandomTools;
import feiao.forum.util.TimeUtil;
@Service
public class NoteServiceImpl implements NoteService {
	@Autowired
	private FaNoteDao noteDao;
	@Autowired
	private FaUserDao userDao;
	@Autowired
	private FaCommentDao fcDao;
	@Autowired
	private FaSelfMoodDao moodDao;
	@Autowired
	private FaUserDao fuDao;
	@Autowired
	private FaSentMessageDao sendmsgDao;
	@Autowired
	private FaSectionDao fsDao;
	@Autowired
	private FaMyFriendDao friendDao;
	@Autowired
	private FaConMsgDao fcmDao;
	@Autowired
	private FaUserViceDao fuvDao;
	//积分
	@Autowired
	private FaInteDao inteDao;
	@Autowired
	private FaSectionDao sectionDao;
	@Autowired
	private FaTorFDao tofDao;
	@Autowired
	private FaRankDao rankDao;
	//会员组
	@Autowired
	private FaGroupsDao groupsDao;
	//查询发帖数量
	@Override
	public Long selectMyNoteCount(String fa_id) {
		try {
			
			return noteDao.selectMyNoteCount(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("//查询发帖数量方法出现异常",e); 
		}
	}
	//查询收藏帖子数量
	@Override
	public Long selectCollectNoteCount(String fa_id) {
		try {
			
			return noteDao.selectCollectNoteCount(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("//查询发帖数量方法出现异常",e); 
		}
	}
	//分页查询会员发表的帖子
	@Override
	public List<Map<String, Object>> selectMemberNote(String id, Integer curpage, Integer pagesize) {
		try {
			List<Map<String, Object>> list = noteDao.selectMemberNote(id, curpage, pagesize);
			for (Map<String, Object> map : list) {
				Long c = fcDao.findCountByNoteId(map.get("id").toString());
				map.put("pinglun", c);
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("day")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("day")));
				}else{
					map.put("day", sdf.format((Date)map.get("day")));
				}
				
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询会员发表的帖子方法出现异常",e); 
		}
	}
	//分页查询会员收藏的帖子
	@Override
	public List<Map<String, Object>> selectCollectNote(String id, Integer curpage, Integer pagesize) {
		try {
			List<Map<String, Object>> list = noteDao.selectCollectNote(id, curpage, pagesize);
			for (Map<String, Object> map : list) {
				if(map.get("id")!=null && !map.get("id").equals("")){
					Long c = fcDao.findCountByNoteId(map.get("id").toString());
					map.put("pinglun", c);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = ((Date)map.get("day")).getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime((Date)map.get("day")));
					}else{
						map.put("day", sdf.format((Date)map.get("day")));
					}
				}else{
					map.put("name", "");
					map.put("id", "");
					map.put("readss", 0);
					map.put("day", "");
					map.put("model", "<font>该帖子已被删除</font>");
					map.put("pinglun", "0");
				}
				
				
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询会员收藏的帖子方法出现异常",e); 
		}
	}
	//分页查询会员回复的帖子
	@Override
	public List<Map<String, Object>> selectMemberReply(String id, Integer curpage, Integer pagesize) {
		try {
			List<Map<String, Object>> list = fcDao.selectMemberReply(id, curpage, pagesize);
			for (Map<String, Object> map : list) {
				Long c = fcDao.findCountByNoteId(map.get("pid").toString());
				map.put("pinglun", c);
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("day")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("day")));
				}else{
					map.put("day", sdf.format((Date)map.get("day")));
				}
				
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询会员回复的帖子方法出现异常",e); 
		}
	}
	//查询评论数量
	@Override
	public Long selectMymyAnswerCount(String fa_id) {
		try {
			
			return fcDao.selectMymyAnswerCount(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("//查询评论数量方法出现异常",e); 
		}
	}
	//分页查询会员回复的帖子的评论数
	@Override
	public Long selectMemberReply(String id) {
		try {
			
			return fcDao.selectMemberReplyCount(id);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询会员回复的帖子的评论数方法出现异常",e); 
		}
	}
	//分页查看用户的心情
	@Override
	public List<Map<String, Object>> selectMemberMood(String id, Integer curpage, Integer pagesize) {
		try {
			
			List<Map<String, Object>> list = moodDao.selectMemberMood(id, curpage, pagesize);
			for (Map<String, Object> map : list) {
				//如果是转播
				if(((Integer)map.get("isreturn"))>0){
					//转发的是帖子
					if(map.get("pid").toString().length()>20){
						FaNote fn = noteDao.getNoteById(map.get("pid").toString());
						if(fn!=null){
							map.put("pname", fn.getFa_title());
							map.put("pmsg", fn.getFa_desc());
						}else{
							map.put("pname", "");
							map.put("pmsg", "<font color='red'>该帖子已被删除</font>");
						}
						
					//心情	
					}else{
						
						FaSelfMood fsf = moodDao.getMoodById(map.get("pid").toString());
						if(fsf!=null){
							map.put("pname", "");
							map.put("pmsg", fsf.getFa_desc());
						}else{
							map.put("pname", "");
							map.put("pmsg", "<font color='red'>该动态已被删除</font>");
						}
					}
				}
				
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("day")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("day")));
				}else{
					map.put("day", sdf.format((Date)map.get("day")));
				}
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查看用户的心情方法出现异常",e); 
		}
	}
	//分页查看用户好友的心情
	@Override
	public Map<String, Object> selectFriendMood(String id, Integer curpage, Integer pagesize) {
		try {
			Map<String, Object> mapbb = new HashMap<>();
			//我没有屏蔽的好友id
			Set<String> friendids = new HashSet<>();
			//我屏蔽的好友id
			Set<String> ignoreids = new HashSet<>();
			List<Map<String, Object>> listz = friendDao.findFriendIgnoreStatus(id);
			for (Map<String, Object> map : listz) {
				if(map.get("ignorez")!=null){
					if((Integer.parseInt(map.get("ignorez").toString()))>0){
						ignoreids.add(map.get("id").toString());
					}else{
						friendids.add(map.get("id").toString());
					}
				}else{
					friendids.add(map.get("id").toString());
				}
				
			}
			//查询我关注的id
			Set<String> listg = friendDao.findmyFollowsId(id);
			Collection exists=new ArrayList<String>(listg);
			exists.removeAll(ignoreids);
			for (Object object : exists) {
				friendids.add(object.toString());
			}
			
			friendids.add(id);
			
			//查询我
			List<Map<String, Object>> list = moodDao.selectMineAndMemberMood(friendids, curpage, pagesize);
			for (Map<String, Object> map : list) {
				//如果是转播
				if(((Integer)map.get("isreturn"))>0){
					//转发的是帖子
					if(map.get("pid").toString().length()>20){
						FaNote fn = noteDao.getNoteById(map.get("pid").toString());
						if(fn!=null){
							map.put("pname", fn.getFa_title());
							map.put("pmsg", fn.getFa_desc());
						}else{
							map.put("pname", "");
							map.put("pmsg", "<font color='red'>该帖子已被删除</font>");
						}
						
						//心情	
					}else{
						
						FaSelfMood fsf = moodDao.getMoodById(map.get("pid").toString());
						if(fsf!=null){
							map.put("pname", "");
							map.put("pmsg", fsf.getFa_desc());
						}else{
							map.put("pname", "");
							map.put("pmsg", "<font color='red'>该动态已被删除</font>");
						}
					}
				}
				
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("day")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("day")));
				}else{
					map.put("day", sdf.format((Date)map.get("day")));
				}
				
			}
			mapbb.put("data", list);
			Long longz =moodDao.selectFriendMoodCount(friendids);
			mapbb.put("count", longz);
			return mapbb;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查看用户的心情方法出现异常",e); 
		}
	}
	//分页查看用户好友的一个心情
	@Override
	public Map<String, Object> selectFriendMoodByOne(String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			
			FaSelfMood fsf = moodDao.getMoodById(id);
			FaUser fuFaUser = fuDao.getMemberById(fsf.getFa_userid());
			map.put("isreturn", fsf.getFa_isreturn());
			map.put("id", fsf.getFa_id());
			map.put("uid", fsf.getFa_userid());
			map.put("uname", fuFaUser.getFa_username());
			map.put("day",fsf.getFa_time());
			map.put("msg",fsf.getFa_desc());
			map.put("pid", fsf.getFa_returnpid());
			//如果是转播
			if(((Integer)map.get("isreturn"))>0){
				//转发的是帖子
				if(map.get("pid").toString().length()>20){
					FaNote fn = noteDao.getNoteById(map.get("pid").toString());
					if(fn!=null){
						map.put("pname", fn.getFa_title());
						map.put("pmsg", fn.getFa_desc());
					}else{
						map.put("pname", "");
						map.put("pmsg", "<font color='red'>该帖子已被删除</font>");
					}
					
					//心情	
				}else{
					
					FaSelfMood fsfz = moodDao.getMoodById(map.get("pid").toString());
					if(fsfz!=null){
						map.put("pname", "");
						map.put("pmsg", fsfz.getFa_desc());
					}else{
						map.put("pname", "");
						map.put("pmsg", "<font color='red'>该动态已被删除</font>");
					}
				}
			}
			
			SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar   cal   =   Calendar.getInstance();
			cal.add(Calendar.DATE,   -1);
			String yesterday = sdfz.format(cal.getTime());
			long yestdaytime = sdfz.parse(yesterday).getTime();
			
			long nowtime = ((Date)map.get("day")).getTime();
			if(nowtime>=yestdaytime){
				map.put("day", TimeUtil.formatTime((Date)map.get("day")));
			}else{
				map.put("day", sdf.format((Date)map.get("day")));
			}
				
			
			
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查看用户的心情方法出现异常",e); 
		}
	}
	//分页查看帖子的所有内容
	@Override
	public List<Map<String, Object>> selectAllCommentByNote(Integer curpage, Integer pagesize) {
		try {
			
			List<Map<String, Object>> list = fcDao.selectAllCommentByNote(curpage, pagesize);
			for (Map<String, Object> map : list) {
				//如果是转播
				if((map.get("pid").toString().length())<=22){
					
					FaNote fn = noteDao.getNoteById(map.get("pid").toString());
					
					if(fn!=null){
						FaSection fs = fsDao.getModelById(fn.getFa_resource());
						map.put("pmodel", fs.getFa_name());
						map.put("pname", fn.getFa_title());
						map.put("pmsg", fn.getFa_desc());
					}else{
						map.put("pmodel", "");
						map.put("pname", "");
						map.put("pmsg", "<font color='red'>该帖子已被删除</font>");
					}
					
					
				}else{
				}
				
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("day")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("day")));
				}else{
					map.put("day", sdf.format((Date)map.get("day")));
				}
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询所有帖子回复的评论方法出现异常",e); 
		}
	}
	//分页查看我的帖子回复的所有内容
	@Override
	public List<Map<String, Object>> selectMyCommentByNote(String fu_id,Integer curpage, Integer pagesize) {
		try {
			
			List<Map<String, Object>> list = fcDao.selectMyCommentByNote(fu_id,curpage, pagesize);
			for (Map<String, Object> map : list) {
				//如果是转播
				
					
				FaNote fn = noteDao.getNoteById(map.get("pid").toString());
				
				if(fn!=null){
					FaSection fs = fsDao.getModelById(fn.getFa_resource());
					map.put("pmodel", fs.getFa_name());
					map.put("pname", fn.getFa_title());
					map.put("pmsg", fn.getFa_desc());
				}else{
					map.put("pmodel", "");
					map.put("pname", "");
					map.put("pmsg", "<font color='red'>该帖子已被删除</font>");
				}
					
				
				
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("day")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("day")));
				}else{
					map.put("day", sdf.format((Date)map.get("day")));
				}
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询所有帖子回复的评论方法出现异常",e); 
		}
	}
	//分页查看用户的心情数量
	
	//分页查看用户几朋友的心情数量
	@Override
	public Long selectMemberMoodCount(String id) {
		try {
			
			return moodDao.selectMemberMoodCount(id);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查看用户的心情数量方法出现异常",e); 
		}
	}
	//分页查询会员心情的回复
	@Override
	public List<Map<String, Object>> getMoreMoodMsg(String id, Integer curpage, Integer pagesize) {
		try {
			
			return fcDao.getMoreMoodMsgs(id,curpage,pagesize);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询会员心情的回复方法出现异常",e); 
		}
	}
	//分页查询会员心情的回复数量
	@Override
	public Long getMoreMoodMsgCount(String id) {
		try {
			
			return fcDao.getMoreMoodMsgCount(id);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询会员心情的回复数量方法出现异常",e); 
		}
	}
	//发送心情
	@Override
	public String sureSendMyGood(HttpServletRequest request, String fa_id, Integer iscode,  String desc,
			String vode) {
		try {
			if(iscode>0){
				if(vode==null || vode.equals("")){
					return "请输入验证码";
				}
				String svcode = request.getSession().getAttribute("verify_code").toString();
				if(!vode.equals(svcode)){
					return "验证码不正确";
				}
				request.getSession().removeAttribute("verify_code");
			}
			FaSelfMood fsf = new FaSelfMood();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String id = sdf.format(date)+RandomTools.getRandomString(6);
			fsf.setFa_id(id);
			fsf.setFa_desc(desc);
			fsf.setFa_isreturn(0);
			fsf.setFa_time(date);
			fsf.setFa_userid(fa_id);
			//保存转发的心情
			moodDao.saveMood(fsf);
			
			return "success";
			
			
		} catch (Exception e) {
			throw new  RuntimeException("//发送心情方法出现异常",e); 
		}
	}
	//确认转播
	@Override
	public String sureReturn(HttpServletRequest request, String fa_id, Integer iscode, String pid, String desc,
			String vode,String fid) {
		try {
			if(iscode>0){
				if(vode==null || vode.equals("")){
					return "请输入验证码";
				}
				String svcode = request.getSession().getAttribute("verify_code").toString();
				if(!vode.equals(svcode)){
					return "验证码不正确";
				}
				request.getSession().removeAttribute("verify_code");
			}
			FaSelfMood fsf = new FaSelfMood();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String id = sdf.format(date)+RandomTools.getRandomString(6);
			fsf.setFa_id(id);
			fsf.setFa_desc(desc);
			fsf.setFa_isreturn(1);
			fsf.setFa_returnpid(pid);
			fsf.setFa_time(date);
			fsf.setFa_userid(fa_id);
			//保存转发的心情
			moodDao.saveMood(fsf);
			
			return "success";
			
			
		} catch (Exception e) {
			throw new  RuntimeException("确认转播方法出现异常",e); 
		}
	}
	//确认评论
	@Override
	public Map<String, Object> sureReply(HttpServletRequest request, String fa_id, Integer iscode, String pid, String desc,
			String vode, String fid,String rid) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			if(iscode>0){
				if(vode==null || vode.equals("")){
					map.put("tip", "请输入验证码");
					return map;
				}
				String svcode = request.getSession().getAttribute("verify_code").toString();
				if(!vode.equals(svcode)){
					map.put("tip", "验证码不正确");
					return map;
				}
				request.getSession().removeAttribute("verify_code");
			}
			FaComment fc = new FaComment();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String id = sdf.format(date)+RandomTools.getRandomString(11);
			fc.setFa_id(id);
			fc.setFa_desc(desc);
			
			fc.setFa_pid(pid);
			if(pid.length()>20){
				FaUser fu = userDao.getMemberById(fa_id);
				FaNote fn = noteDao.getNoteById(rid);
				//查看有没有发帖权限
				Integer iw = 0;
				FaSection fs = fsDao.getModelById(fn.getFa_resource());
				if(fs.getFa_repliesr()==null || fs.getFa_repliesr().equals("")){
					if(fs.getFa_repliesg()==null ||fs.getFa_repliesg().equals("")){
						iw=1;
					}
				}
				if(fu==null || fu.getFa_id()==null){
					map.put("tip", "请先登录再回帖");
					return map;
				}else{
					
					if(fs!=null && fs.getFa_id()!=null){
						if(iw<=0){
							Integer ia = 0;
							if(fs.getFa_repliesr()!=null && !fs.getFa_repliesr().equals("")){
								String [] arr = fs.getFa_repliesr().split(",");
								for (String string : arr) {
									if(fu.getFa_rank().equals(Integer.parseInt(string))){
										ia = 1;
										break;
									}
								}
							}
							
							if(ia<=0){
								if(fs.getFa_repliesg()!=null &&!fs.getFa_repliesg().equals("")){
									List<Integer> gids = groupsDao.getGroupIdByUserId(fu.getFa_id());
									for (Integer gid : gids) {
										String [] arrg = fs.getFa_repliesg().split(",");
										for (String string : arrg) {
											if(gid.equals(Integer.parseInt(string))){
												ia = 1;
												break;
											}
										}
									}
								}
								
							}
							
							if(ia<=0){
								map.put("tip", "您没有权限回帖，请登录或者升级");
								return map;
							}else{
								iw=1;
							}
						}
						
					}else{
						map.put("tip", "该模块不存在");
						return map;
					}
				}
				if(iw>0){
					fc.setFa_moodornote(1);
					fc.setFa_source(rid);
					FaComment fct = fcDao.getFcById(pid);
					fc.setFa_ceng(fct.getFa_ceng());
				}else{
					map.put("tip", "您没有权限回帖，请登录或者升级");
					return map;
				}
				
			}else{
				fc.setFa_moodornote(0);
				if(rid!=null && !rid.equals("")){
					fc.setFa_source(rid);
				}else{
					fc.setFa_source(pid);
				}
				
				
			}
			fc.setFa_time(date);
			fc.setFa_userid(fa_id);
			//保存评论
			fcDao.saveComment(fc);
			//查询好友忽略的人
			String ignoreIds = fuDao.getIgonreIdSById(fid);
			boolean tof = true;
			if(ignoreIds!=null && ignoreIds.length()>0){
				String[] inid = ignoreIds.split(",");
				for (String str : inid) {
					if(fa_id.equals(str)){
						tof = false;
						break;
					}
				}
			}
			if(tof){
				if(pid.length()>20){
					FaSentMessage fsm = new FaSentMessage();
					String code = sdf.format(new Date())+RandomTools.getRandomString(6);
					fsm.setFa_id(code);
					fsm.setFa_userid(fid);
					fsm.setFa_friendid(fa_id);
					fsm.setFa_msg_type(5);
					fsm.setFa_time(date);
					fsm.setFa_pid(pid);
					sendmsgDao.saveFriendMsg(fsm);
				}else{
					FaSentMessage fsm = new FaSentMessage();
					String code = sdf.format(new Date())+RandomTools.getRandomString(6);
					fsm.setFa_id(code);
					fsm.setFa_userid(fid);
					fsm.setFa_friendid(fa_id);
					fsm.setFa_msg_type(6);
					fsm.setFa_time(date);
					fsm.setFa_pid(pid);
					sendmsgDao.saveFriendMsg(fsm);
				}
				
			}
			FaUser fu = fuDao.getMemberById(fa_id);
			respeakAddInteAndFeibiao(request,fu);
			map.put("tip", "success");
			map.put("id", pid);
			map.put("msg", desc);
			return map;
					
		} catch (Exception e) {
			throw new  RuntimeException("确认评论方法出现异常",e); 
		}
	}
	//删除我的心情
	@Override
	public Map<String, Object> deleteMyMood(String fa_id, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			moodDao.deleteMyMood(fa_id, id);
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("删除我的心情方法出现异常",e); 
		}
	}
	//删除我的帖子
	@Override
	public Map<String, Object> deleteMyNote(String fa_id, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			Integer count = noteDao.deleteMyNote(fa_id, id);
			if(count>0){
				fcDao.deleteComments(id);
			}
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("删除我的帖子方法出现异常",e); 
		}
	}
	//取消我收藏的帖子
	@Override
	public Map<String, Object> deleteMyCollect(String fa_id, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			noteDao.deleteMyCollect(fa_id, id);
			
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("取消我收藏的帖子方法出现异常",e); 
		}
	}
	//获取板块帖子的总数
	@Override
	public Long getNoteCountBySectionId(Integer id) {
		try {
			return noteDao.getNoteCountBySectionId(id);
			
		} catch (Exception e) {
			throw new  RuntimeException("获取板块帖子的总数方法出现异常",e); 
		}
	}
	//查询版主信息
	@Override
	public List<Map<String, Object>> getUserNameBySection(Integer id) {
		try {
			return noteDao.getUserNameBySection(id);
			
		} catch (Exception e) {
			throw new  RuntimeException("查询版主信息方法出现异常",e); 
		}
	}
	//查询有图帖子推荐
	@Override
	public List<FaConMsg> hasImageRead() {
		try {
			
			return fcmDao.findAllContentByPid(19);
			 
		} catch (Exception e) {
			throw new  RuntimeException("查询有图帖子推荐方法出现异常",e); 
		}
	}
	//查询无图帖子推荐
	@Override
	public List<FaConMsg> noImageRead() {
		try {
			return fcmDao.findAllContentByPid(20);
			
		} catch (Exception e) {
			throw new  RuntimeException("查询无图帖子推荐方法出现异常",e); 
		}
	}
	//分页查询模块中的帖子
	@Override
	public List<Map<String, Object>> selectAllNoteBySection(Integer curpage, Integer pagesize, Integer pid,
			Integer types, Integer sort) {
		try {
			List<Map<String, Object>> list = noteDao.selectAllNoteBySection(curpage,pagesize,pid,types,sort);
			for (Map<String, Object> map : list) {
				//查询该帖子的最新评论
				FaComment fc = fcDao.getNewComment(map.get("id").toString());
				Long zz = fcDao.findCountByNoteId(map.get("id").toString());
				
				map.put("pls",zz );
				if(fc!=null && fc.getFa_id()!=null){
					map.put("uid", fc.getFa_userid());
					map.put("huifu", fc.getFa_desc());
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = fc.getFa_time().getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime(fc.getFa_time()));
					}else{
						map.put("day", sdf.format(fc.getFa_time()));
					}
					map.put("uname", userDao.getNameByUserId(fc.getFa_userid()));
				}else{
					map.put("uid", map.get("puid"));
					map.put("huifu", "");
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = ((Date)map.get("times")).getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime((Date)map.get("times")));
					}else{
						map.put("day", sdf.format((Date)map.get("times")));
					}
					map.put("uname", map.get("uuname"));
				}
				
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询模块中的帖子方法出现异常",e); 
		}
	}
	//分页查询模块中的帖子数量
	@Override
	public Long selectAllNoteBySectionCount(Integer pid, Integer types, Integer sort) {
		try {
			return noteDao.selectAllNoteBySectionCount(pid,types,sort);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询模块中的帖子数量方法出现异常",e); 
		}
	}
	//判断是否签到
	public Integer loginAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getSignz().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_sign_type().equals(1)){
					//查看该周期的次数
					if(!rps.getSignt().equals(0)){
						
						if(rps.getSignt()<=fuv.getFa_sign_times()+1){
							fuv.setFa_sign_type(1);
							fuv.setFa_sign_times(fuv.getFa_sign_times()+1);
							i=1;
						}else{
							fuv.setFa_sign_times(fuv.getFa_sign_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_sign_times(0);
						i=1;
					}
				}
			//一次	
			}else if(rps.getSignz().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_sign_type().equals(1)){
					if(1<=fuv.getFa_sign_times()+1){
						fuv.setFa_sign_type(1);
						fuv.setFa_sign_times(fuv.getFa_sign_times()+1);
						i=1;
					}else{
						fuv.setFa_sign_times(fuv.getFa_sign_times()+1);
						i=1;
					}
				}
			//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_sign_type().equals(1)){
					//查看该周期的次数
					if(!rps.getSignt().equals(0)){
						
						if(rps.getSignt()<=fuv.getFa_sign_times()+1){
							fuv.setFa_sign_type(1);
							fuv.setFa_sign_times(fuv.getFa_sign_times()+1);
							i=1;
						}else{
							fuv.setFa_sign_times(fuv.getFa_sign_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_sign_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateSignMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "每天签到", rps.getSignInte(), 0, "每天签到",fu.getFa_jifen()+rps.getSignInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "每天签到", rps.getSignFb(), 1, "每天签到",fu.getFa_feibiao()+rps.getSignFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getSignInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getSignFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new RuntimeException("签到加积分方法出现错误",e);
		}
	}
	//判断是否签到
	public Integer signIsTrueOrFalse(HttpServletRequest request,FaUser fu){
		try {
			if(fu!=null && fu.getFa_id()!=null){
				//查看积分规则表
				InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
				//根据id查询会员附属表
				FaUserVice fuv = fuvDao.get(fu.getFa_id());
				//判断登录奖励的周期
				//无限
				int i = 0;
				if(rps.getSignz().equals(0)){
					//判断还能不能颁发奖励
					if(!fuv.getFa_sign_type().equals(1)){
						//查看该周期的次数
						if(!rps.getSignt().equals(0)){
							
							if(rps.getSignt()<=fuv.getFa_sign_times()+1){
								i=1;
							}else{
								i=1;
							}
						}else{
							i=1;
						}
					}
					//一次	
				}else if(rps.getSignz().equals(1)){
					//判断还能不能颁发奖励
					if(!fuv.getFa_sign_type().equals(1)){
						if(1<=fuv.getFa_sign_times()+1){
							i=1;
						}else{
							i=1;
						}
					}
					//一天	
				}else{
					//判断还能不能颁发奖励
					if(!fuv.getFa_sign_type().equals(1)){
						//查看该周期的次数
						if(!rps.getSignt().equals(0)){
							
							if(rps.getSignt()<=fuv.getFa_sign_times()+1){
								i=1;
							}else{
								i=1;
							}
						}else{
							i=1;
						}
					}
				}
				if(i>0){
					return 0;
				}else{
					return 1;
				}
			}else{
				return 0;
			}
			
			
			
		} catch (Exception e) {
			throw new RuntimeException("签到加积分方法出现错误",e);
		}
	}
	////签到
	@Override
	public String signIsTrue(FaUser fu, HttpServletRequest request) {
		try {
			if(fu!=null && fu.getFa_id()!=null){
				fu=userDao.getMemberById(fu.getFa_id());
				Integer i = loginAddInteAndFeibiao(request,fu);
				if(i>0){
					return "success";
				}else{
					return "您已经签到过了，请明天再签到";
				}
			}else{
				return "请登录后再操作";
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("签到方法出现异常",e); 
		}
	}
	//版主修改版块信息
	@Override
	public String updateSectionMsg(FaUser fu, Integer nid, String desc) {
		try {
			if(fu!=null){
				if(fu.getFa_ishost()>1 || fu.getFa_sectionid().equals(nid)){
					
					sectionDao.updateSectionMsg(desc,nid);
					return "success";
				}else{
					return "对不起，只有版主才能修改板块信息";
				}
			}else{
				return "对不起，您还未登陆";
			}
			
			
		} catch (Exception e) {
			throw new  RuntimeException("版主修改版块信息方法出现异常",e); 
		}
	}
	//保存主题帖子
	@Override
	public Map<String, Object> saveThemeNote(FaUser fu, FaNote fn, String vode,Integer iscode,HttpServletRequest request,String[] details) {
		try {
			Map<String, Object> map = new HashMap<>();
			if(fu==null){
				map.put("tip", "请登陆再发帖");
				return map;
			}
			if(iscode>0){
				if(vode==null || vode.equals("")){
					map.put("tip", "请输入验证码");
					return map;
				}
				String svcode = request.getSession().getAttribute("verify_code").toString();
				if(!vode.equals(svcode)){
					map.put("tip", "验证码不正确");
					return map;
				}
				request.getSession().removeAttribute("verify_code");
			}
			if(fn.getFa_title().length()>80||fn.getFa_title().length()<=0){
				map.put("tip", "标题不能为空，且长度少于80");
				return map;
			}
			if(fn.getFa_total_people()!=null){
				if(fn.getFa_total_people()>999 || fn.getFa_total_people()<=0){
					map.put("tip", "参与人数范围为1到999");
					return map;
				}
			}
			//查看有没有发帖权限
			Integer iw = 0;
			FaSection fs = fsDao.getModelById(fn.getFa_resource());
			if(fs.getFa_postr()==null || fs.getFa_postr().equals("")){
				if(fs.getFa_postg()==null || fs.getFa_postg().equals("")){
					iw=1;
				}
			}
			if(fu==null || fu.getFa_id()==null){
				map.put("tip", "请先登录再发帖");
				return map;
			}else{
				if(fs!=null && fs.getFa_id()!=null){
					if(iw<=0){
						Integer ia = 0;
						if(fs.getFa_postr()!=null && !fs.getFa_postr().equals("")){
							String [] arr = fs.getFa_postr().split(",");
							for (String string : arr) {
								if(fu.getFa_rank().equals(Integer.parseInt(string))){
									ia = 1;
									break;
								}
							}
						}
						
						if(ia<=0){
							if(fs.getFa_postg()!=null &&!fs.getFa_postg().equals("")){
								List<Integer> gids = groupsDao.getGroupIdByUserId(fu.getFa_id());
								for (Integer gid : gids) {
									String [] arrg = fs.getFa_postg().split(",");
									for (String string : arrg) {
										if(gid.equals(Integer.parseInt(string))){
											ia = 1;
											break;
										}
									}
								}
							}
							
						}
						if(ia<=0){
							map.put("tip", "您没有权限发帖，请登录或者升级");
							return map; 
						}else{
							iw=1;
						}
					}
					
				}else{
					map.put("tip", "该模块不存在");
					return map;
				}
			}
			if(iw>0){
				if(fs.getFa_id().equals(6)){
					if(fn.getFa_protype()==null){
						map.put("tip", "该板块只允许发反馈贴");
						return map;
					}
					if(fn.getFa_proversion()==null){
						map.put("tip", "该板块只允许发反馈贴");
						return map;
					}
					if(fn.getFa_version()==null){
						map.put("tip", "该板块只允许发反馈贴");
						return map;
					}
				}else{
					if(fn.getFa_protype()!=null){
						map.put("tip", "该板块不允许发反馈贴");
						return map;
					}
					if(fn.getFa_proversion()!=null){
						map.put("tip", "该板块不允许发反馈贴");
						return map;
					}
					if(fn.getFa_version()!=null){
						map.put("tip", "该板块不允许发反馈贴");
						return map;
					}
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				fn.setFa_id(sdf.format(new Date())+RandomStringUtils.randomNumeric(7));
				fn.setFa_userid(fu.getFa_id());
				fn.setFa_changetime(new Date());
				fn.setFa_start_time(new Date());
				fn.setFa_ceng(0);
				fn.setFa_finish_people(0);
				fn.setFa_gaoliang(0);
				fn.setFa_jingpin(0);
				fn.setFa_nohot(0);
				fn.setFa_order(0);
				fn.setFa_ping(0);
				fn.setFa_prodel(0);
				fn.setFa_readed(0);
				fn.setFa_reading(0);
				if(fn.getFa_protype()==null){
					fn.setFa_protype("");
				}
				if(fn.getFa_proversion()==null){
					fn.setFa_version("");
				}
				if(fn.getFa_version()==null){
					fn.setFa_version("");
				}
				if(fn.getFa_total_people()==null){
					fn.setFa_total_people(0);
				}
				
				fn.setFa_zhiding(0);
				if(fn.getFa_dod()==null){
					fn.setFa_dod(0);
				}
				if(fn.getFa_votetype()==null){
					fn.setFa_votetype(0);
				}
				if(fn.getFa_type().equals(2)){
					if(details==null ||details.length<=0){
						map.put("tip", "请填写投票的内容");
						return map;
					}
					String idr = sdf.format(new Date());
					List<Map<String, Object>> listz = new ArrayList<>();
					for (String str : details) {
						if(str==null||str.equals("")){
							break;
						}
						Map<String, Object> mp = new HashMap<>();
						mp.put("id", idr+RandomTools.getRandomString(6));
						mp.put("pid", fn.getFa_id());
						mp.put("descs", str);
						listz.add(mp);
						
					}
					if(listz.size()>30){
						map.put("tip", "最多选择30项");
						return map;
					}
					noteDao.saveVoteMsg(listz);
				}
				noteDao.saveNote(fn);
				fu = fuDao.getMemberById(fu.getFa_id());
				themeAddInteAndFeibiao(request,fu);
				map.put("tip", "success");
				map.put("id", fn.getFa_id());
			}
			
			return map;
		} catch (Exception e) {
			throw new  RuntimeException("保存主题帖子方法出现异常",e); 
		}
	}
	//保存主题帖子
	@Override
	public Map<String, Object> updateThemeNote(FaUser fu, FaNote fn, String vode,Integer iscode,HttpServletRequest request,String[] details,String [] delids) {
		try {
			Map<String, Object> map = new HashMap<>();
			if(fu==null){
				map.put("tip", "请登陆再发帖");
				return map;
			}
			if(iscode>0){
				if(vode==null || vode.equals("")){
					map.put("tip", "请输入验证码");
					return map;
				}
				String svcode = request.getSession().getAttribute("verify_code").toString();
				if(!vode.equals(svcode)){
					map.put("tip", "验证码不正确");
					return map;
				}
				request.getSession().removeAttribute("verify_code");
			}
			if(fn.getFa_title().length()>80||fn.getFa_title().length()<=0){
				map.put("tip", "标题不能为空，且长度少于80");
				return map;
			}
			if(fn.getFa_total_people()!=null){
				if(fn.getFa_total_people()>999 || fn.getFa_total_people()<=0){
					map.put("tip", "参与人数范围为1到999");
					return map;
				}
			}
			fn.setFa_changetime(new Date());
			if(fn.getFa_protype()==null){
				fn.setFa_protype("");
			}
			if(fn.getFa_proversion()==null){
				fn.setFa_version("");
			}
			if(fn.getFa_version()==null){
				fn.setFa_version("");
			}
			if(fn.getFa_total_people()==null){
				fn.setFa_total_people(0);
			}
			
			fn.setFa_zhiding(0);
			if(fn.getFa_dod()==null){
				fn.setFa_dod(0);
			}
			if(fn.getFa_votetype()==null){
				fn.setFa_votetype(0);
			}
			if(fn.getFa_type().equals(2)){
				if(details!=null && details.length>0){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String idr = sdf.format(new Date());
					List<Map<String, Object>> listz = new ArrayList<>();
					for (String str : details) {
						if(str==null||str.equals("")){
							break;
						}
						Map<String, Object> mp = new HashMap<>();
						mp.put("id", idr+RandomTools.getRandomString(6));
						mp.put("pid", fn.getFa_id());
						mp.put("descs", str);
						listz.add(mp);
						
					}
					noteDao.saveVoteMsg(listz);
				}
				
				if(delids!=null && delids.length>0){
					deleteNoteVote(delids);
				}
				
				
			}
			noteDao.updateNotes(fn);
			map.put("tip", "success");
			map.put("id", fn.getFa_id());
			return map;
		} catch (Exception e) {
			throw new  RuntimeException("保存主题帖子方法出现异常",e); 
		}
	}
	//查询帖子的评论数
	@Override
	public Long findCountByNoteId(String fa_id) {
		try {
			return fcDao.findCountByNoteId(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("查询帖子的评论数方法出现异常",e); 
		}
	}
	@Override
	public Long findCountByNoteIds(String fa_id) {
		try {
			return fcDao.findCountByNoteIds(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("查询帖子的评论数方法出现异常",e); 
		}
	}
	//分页查询该帖子的评论
	@Override
	public List<Map<String, Object>> selectNoteComment(String id, Integer curpage, Integer pagesize) {
		try {
			List<Map<String, Object>> list = noteDao.selectNoteComment(id, curpage,pagesize);
			for (Map<String, Object> map : list) {
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				
				long nowtime = ((Date)map.get("times")).getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime((Date)map.get("times")));
				}else{
					map.put("day", sdf.format((Date)map.get("times")));
				}
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询该帖子的评论方法出现异常",e); 
		}
	}
	//查询该楼层前面有多少条数据
	@Override
	public Long getCountByCeng(Integer floor, String id) {
		try {
			return fcDao.getCountByCeng(floor,id);
			
		} catch (Exception e) {
			throw new  RuntimeException("查询该楼层前面有多少条数据方法出现异常",e); 
		}
	}
	//发表回复
	@Override
	public String createCommentByNote(FaUser fu, FaComment fc, String vode, Integer iscode, HttpServletRequest request) {
		try {
			if(fu==null){
				return "请登陆再回复";
			}
			if(iscode>0){
				if(vode==null || vode.equals("")){
					return "请输入验证码";
				}
				String svcode = request.getSession().getAttribute("verify_code").toString();
				if(!vode.equals(svcode)){
					return "验证码不正确";
				}
				request.getSession().removeAttribute("verify_code");
			}
			if(fc.getFa_desc()==null || fc.getFa_desc().equals("")){
				return "请填写评论";
			}
			
			
			
			FaNote fn =noteDao.getNoteById(fc.getFa_pid());
			
			
			
			
			
			//查看有没有发帖权限
			Integer iw = 0;
			FaSection fs = fsDao.getModelById(fn.getFa_resource());
			if(fs.getFa_repliesr()==null || fs.getFa_repliesr().equals("")){
				if(fs.getFa_repliesg()==null ||fs.getFa_repliesg().equals("")){
					iw=1;
				}
			}
			if(fu==null || fu.getFa_id()==null){
				return "请先登录再回帖";
			}else{
				
				if(fs!=null && fs.getFa_id()!=null){
					if(iw<=0){
						Integer ia = 0;
						if(fs.getFa_repliesr()!=null && !fs.getFa_repliesr().equals("")){
							String [] arr = fs.getFa_repliesr().split(",");
							for (String string : arr) {
								if(fu.getFa_rank().equals(Integer.parseInt(string))){
									ia = 1;
									break;
								}
							}
						}
						
						if(ia<=0){
							if(fs.getFa_repliesg()!=null &&!fs.getFa_repliesg().equals("")){
								List<Integer> gids = groupsDao.getGroupIdByUserId(fu.getFa_id());
								for (Integer gid : gids) {
									String [] arrg = fs.getFa_repliesg().split(",");
									for (String string : arrg) {
										if(gid.equals(Integer.parseInt(string))){
											ia = 1;
											break;
										}
									}
								}
							}
							
						}
						
						if(ia<=0){
							return "您没有权限回帖，请登录或者升级"; 
						}else{
							iw=1;
						}
					}
					
				}else{
					return "该模块不存在";
				}
			}
			if(iw>0){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				Date date = new Date();
				fc.setFa_id(sdf.format(date)+RandomStringUtils.randomNumeric(11));
				fc.setFa_source(fc.getFa_pid());
				fc.setFa_userid(fu.getFa_id());
				fc.setFa_time(date);
				fc.setFa_ceng(fn.getFa_ceng()+1);
				fc.setFa_moodornote(1);
				
				fcDao.saveComment(fc);
				noteDao.updateFloor(fn.getFa_ceng()+1,fn.getFa_id(),date);
				fu = fuDao.getMemberById(fu.getFa_id());
				respeakAddInteAndFeibiao(request,fu);
			}
			
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//发表回复方法出现异常",e); 
		}
	}
	//今天发帖数
	@Override
	public Long getCountByToday() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Long count = noteDao.getCountByToday(sdf.format(new Date()));
			return count;
			
		} catch (Exception e) {
			throw new  RuntimeException("今天发帖数方法出现异常",e); 
		}
	}
	//查询热帖
	@Override
	public List<Map<String, Object>> getHotNote() {
		try {
			List<Map<String, Object>> list =noteDao.getHotNote();
			for (Map<String, Object> map : list) {
				Long count = fcDao.findCountByNoteId(map.get("id").toString());
				map.put("count", count);
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("查询热帖方法出现异常",e); 
		}
	}
	//查询推荐贴
	@Override
	public List<Map<String, Object>> getTjNote() {
		try {
			List<Map<String, Object>> list = new ArrayList<>();
			List<FaConMsg> fcms = fcmDao.findAllContentByPid(21);
			for (FaConMsg faConMsg : fcms) {
				Map<String, Object> map = new HashMap<>();
				if(true){
					String id = faConMsg.getFa_url().substring(faConMsg.getFa_url().indexOf("=")+1);
					FaNote fn = noteDao.getNoteById(id);
					
					if(fn!=null && fn.getFa_id()!=null){
						FaSection fs = fsDao.getModelById(fn.getFa_resource());
						if(fs==null || fs.getFa_id()==null){
							continue;
						}
						FaUser fu = fuDao.getMemberById(fn.getFa_userid());
						Long count = fcDao.findCountByNoteId(fn.getFa_id());
						map.put("count", count);
						map.put("id", fn.getFa_id());
						map.put("title", faConMsg.getFa_name());
						map.put("desc", faConMsg.getFa_desc());
						map.put("ping", fn.getFa_ping());
						SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
						map.put("day", sdf.format(fn.getFa_start_time()));
						map.put("image", faConMsg.getFa_image());
						map.put("uid", fu.getFa_id());
						map.put("name", fu.getFa_username());
						
						map.put("sname", fs.getFa_name());
						list.add(map);
					}
				}
				
				
				
			}
			
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("查询推荐贴方法出现异常",e); 
		}
	}
	//查询主页右侧最新活动
	@Override
	public List<Map<String, Object>> getHdNote(Integer id) {
		try {
			List<Map<String, Object>> list = new ArrayList<>();
			List<FaConMsg> fcms = fcmDao.findAllContentByPid(id);
			for (FaConMsg fm : fcms) {
				Map<String, Object> map = new HashMap<>();
				map.put("url",fm.getFa_url() );
				map.put("image", fm.getFa_image());
				map.put("name", fm.getFa_name());
				map.put("desc", fm.getFa_desc());
				list.add(map);
			}
			
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("查询最新活动方法出现异常",e); 
		}
	}
	
	//更新帖子的阅读数
	@Override
	public void updateReadCount(String id) {
		try {
			FaNote fn = noteDao.getNoteById(id);
			if(fn!=null && fn.getFa_id()!=null){
				if(fn.getFa_nohot()<1){
					fn.setFa_reading(fn.getFa_reading()+1);
				}
				noteDao.updateReadCount(fn.getFa_id(),fn.getFa_ping()+1,fn.getFa_reading());
			}
			
			
		} catch (Exception e) {
			throw new  RuntimeException("/更新帖子的阅读数方法出现异常",e); 
		}
		
	}
	//支持或者反对 0:支持  1：反对
	@Override
	public String trueOrFalseByNote(FaUser fu, String id, Integer tof, HttpServletRequest request) {
		try {
			if(fu==null){
				return "请登录后再进行操作！";
			}
			//根据回复id 与用户ID查询支持或反对表
			FaTorF ftf = tofDao.getFtfByUserIdAndNoteId(fu.getFa_id(),id);
			if(ftf!=null && ftf.getFa_id()!=null){
				if(tof.equals(ftf.getFa_tf())){
					if(tof>0){
						return "您已经反对过啦";
					}else{
						return "您已经支持过啦";
					}
				}else{
					ftf.setFa_tf(tof);
					tofDao.updateTft(ftf);
					if(tof>0){
						return "反对操作成功";
					}else{
						return "支持操作成功";
					}
				}
			}else{
				FaNote fn = noteDao.getNoteById(id);
				//查看有没有发帖权限
				Integer iw = 0;
				FaSection fs = fsDao.getModelById(fn.getFa_resource());
				if(fs.getFa_zanr()==null || fs.getFa_zanr().equals("")){
					if(fs.getFa_zang()==null|| fs.getFa_zang().equals("")){
						iw=1;
					}
				}
				if(fu==null || fu.getFa_id()==null){
					return "请先登录再发帖";
				}else{
					if(fs!=null && fs.getFa_id()!=null){
						if(iw<=0){
							Integer ia = 0;
							if(fs.getFa_zanr()!=null && !fs.getFa_zanr().equals("")){
								String [] arr = fs.getFa_zanr().split(",");
								for (String string : arr) {
									if(fu.getFa_rank().equals(Integer.parseInt(string))){
										ia = 1;
										break;
									}
								}
							}
							
							if(ia<=0){
								if(fs.getFa_zang()!=null &&!fs.getFa_zang().equals("")){
									List<Integer> gids = groupsDao.getGroupIdByUserId(fu.getFa_id());
									for (Integer gid : gids) {
										String [] arrg = fs.getFa_zang().split(",");
										for (String string : arrg) {
											if(gid.equals(Integer.parseInt(string))){
												ia = 1;
												break;
											}
										}
									}
								}
								
							}
							if(ia<=0){
								return "您没有权限支持或反对该帖，请登录或者升级"; 
							}else{
								iw=1;
							}
						}
						
					}else{
						return "该模块不存在";
					}
				}
				if(iw>0){
					ftf=new FaTorF();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					ftf.setFa_id(sdf.format(new Date())+RandomTools.getRandomString(11));
					ftf.setFa_msgid(id);
					ftf.setFa_userid(fu.getFa_id());
					ftf.setFa_tf(tof);
					tofDao.saveTft(ftf);
					
				}
				
				if(tof>0){
					return "反对操作成功";
				}else{
					return "支持操作成功";
				}
				
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("支持或者反对 0:支持  1：反对方法出现异常",e); 
		}
	}
	//支持 && 反对数量
	@Override
	public Long getCountTofById(String fa_id, Integer i) {
		try {
			return tofDao.getCountTofById(fa_id,i);
			
			
		} catch (Exception e) {
			throw new  RuntimeException("//支持 && 反对数量方法出现异常",e); 
		}
	}
	//高亮帖子
	@Override
	public void glNoteData(String ids, Integer types) {
		try {
			noteDao.changegl(ids,types);
			
		} catch (Exception e) {
			throw new  RuntimeException("//高亮帖子方法出现异常",e); 
		}
		
	}
	//热搜帖子
	@Override
	public void rsNoteData(String ids, Integer types) {
		try {
			noteDao.changers(ids,types);
			
		} catch (Exception e) {
			throw new  RuntimeException("//热搜帖子方法出现异常",e); 
		}
		
	}
	//置顶帖子
	@Override
	public void zdNoteData(String ids, Integer types) {
		try {
			noteDao.changezd(ids,types);
			
		} catch (Exception e) {
			throw new  RuntimeException("//置顶帖子方法出现异常",e); 
		}
		
	}
	//精华帖子
	@Override
	public void jhNoteData(String ids, Integer types, HttpServletRequest request) {
		try {
			FaNote fn = noteDao.getNoteById(ids);
			FaUser fu = fuDao.getMemberById(fn.getFa_userid());
			jingAddInteAndFeibiao(request,fu);
			noteDao.changejh(ids,types);
		} catch (Exception e) {
			throw new  RuntimeException("//精华帖子方法出现异常",e); 
		}
		
	}
	//移动帖子
	@Override
	public void moveNoteData(String ids, Integer typeid) {
		try {
			
			noteDao.moveNoteData(ids,typeid);
		} catch (Exception e) {
			throw new  RuntimeException("移动帖子方法出现异常",e); 
		}
		
	}
	//标签帖子
	@Override
	public void biaoqianNoteData(String ids, Integer typeid) {
		try {
			
			noteDao.biaoqianNoteData(ids,typeid);
		} catch (Exception e) {
			throw new  RuntimeException("	//标签帖子方法出现异常",e); 
		
		}
	}
	//升降帖子
	@Override
	public void udNoteData(String ids, Integer typeid) {
		try {
			FaNote fn = noteDao.getNoteById(ids);
			if(typeid<=0){
				fn.setFa_order(fn.getFa_order()+1);
			}else{
				fn.setFa_order(fn.getFa_order()-1);
			}
			noteDao.udNoteData(ids,fn.getFa_order());
		} catch (Exception e) {
			throw new  RuntimeException("	升降帖子方法出现异常",e); 
		
		}
		
	}
	//报名
	@Override
	public String myjoin(String nid, FaUser fu, Integer total) {
		try {
			//查询是否已经报名
			FaNoteActive fna = noteDao.findActiveByUserId(fu.getFa_id(),nid);
			if(fna!=null && fna.getFa_id()!=null){
				return "您已经报名啦";
			}
			//查询是否已经满人
			Long count = noteDao.findCountActiveByNoteId(nid);
			if(count>=total){
				return "报名人数已满";
			}
			SimpleDateFormat smf = new SimpleDateFormat("yyyyMMddHHmmss");
			fna = new FaNoteActive();
			fna.setFa_id(smf.format(new Date())+RandomTools.getRandomString(6));
			fna.setFa_name(fu.getFa_username());
			fna.setFa_noteid(nid);
			fna.setFa_tel(fu.getFa_telphone());
			fna.setFa_time(new Date());
			fna.setFa_userid(fu.getFa_id());
			noteDao.saveNoteActive(fna);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//报名方法出现异常",e); 
		
		}
	}
	//获取该板块的子版块信息
	@Override
	public List<Map<String, Object>> getSectionByPid(Integer fa_id) {
		try {
			return noteDao.getSectionByPid(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("获取该板块的子版块信息方法出现异常",e); 
		
		}
	}
	//查询我的投票记录
	@Override
	public List<FaUserVote> getUserVoteByNoteIdAndUserid(String fa_id, String fn_id) {
		try {
			return noteDao.getUserVoteByNoteIdAndUserid(fa_id,fn_id);
		} catch (Exception e) {
			throw new  RuntimeException("//查询我的投票记录方法出现异常",e); 
		
		}
	}
	//投票
	@Override
	public String tijiaovote(FaUser fu, String[] bbss, String nid, Integer dod, HttpServletRequest request) {
		try {
			if(bbss==null ||bbss.length<=0){
				return "请勾选要选择的选项";
			}
			if(dod<1 && bbss.length>1){
				return "该投票为单选";
			}
			List<FaUserVote> fnv = getUserVoteByNoteIdAndUserid(fu.getFa_id(), nid);
			if(fnv!=null && !fnv.isEmpty()){
				return "您已经投票过了";
				
			}
			FaNote fn = noteDao.getNoteById(nid);
			Date date = new Date();
			if(fn.getFa_votetime()!=null && !fn.getFa_votetime().equals("")){
				if(fn.getFa_votetime().getTime()<date.getTime()){
					SimpleDateFormat sdff = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					return "该投票已经截止了,截止时间为："+sdff.format(fn.getFa_votetime());
				}
			}
			
			//查看有没有发帖权限
			Integer iw = 0;
			FaSection fs = fsDao.getModelById(fn.getFa_resource());
			if(fs.getFa_voter()==null || fs.getFa_voter().equals("")){
				if(fs.getFa_voteg()==null || fs.getFa_voteg().equals("")){
					iw=1;
				}
			}
			if(fu==null || fu.getFa_id()==null){
				return "请先登录再发帖";
			}else{
				if(fs!=null && fs.getFa_id()!=null){
					if(iw<=0){
						Integer ia = 0;
						if(fs.getFa_voter()!=null && !fs.getFa_voter().equals("")){
							String [] arr = fs.getFa_voter().split(",");
							for (String string : arr) {
								if(fu.getFa_rank().equals(Integer.parseInt(string))){
									ia = 1;
									break;
								}
							}
						}
						
						if(ia<=0){
							if(fs.getFa_voteg()!=null &&!fs.getFa_voteg().equals("")){
								List<Integer> gids = groupsDao.getGroupIdByUserId(fu.getFa_id());
								for (Integer gid : gids) {
									String [] arrg = fs.getFa_voteg().split(",");
									for (String string : arrg) {
										if(gid.equals(Integer.parseInt(string))){
											ia = 1;
											break;
										}
									}
								}
							}
							
						}
						if(ia<=0){
							return "您没有权限投票，请登录或者升级"; 
						}else{
							iw=1;
						}
					}
					
				}else{
					return "该模块不存在";
				}
			}
			if(iw>0){
				for (String str : bbss) {
					FaNoteVote ff = noteDao.getVoteById(str);
					noteDao.updateCountByVote(ff.getFa_count()+1,ff.getFa_id());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					FaUserVote fuv = new FaUserVote();
					fuv.setFa_id(sdf.format(new Date())+RandomStringUtils.randomNumeric(6));
					fuv.setFa_noteid(nid);
					fuv.setFa_userid(fu.getFa_id());
					fuv.setFa_vid(ff.getFa_id());
					noteDao.insertUserVote(fuv);
				}
				fu = fuDao.getMemberById(fu.getFa_id());
				voteAddInteAndFeibiao(request,fu);
			}
			
			
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("投票记录方法出现异常",e); 
		
		}
	}
	//处理反馈帖子
	@Override
	public void updateNoteDealStatus(String id, Integer status) {
		try {
			noteDao.updateNoteDealStatus(id,status);
		} catch (Exception e) {
			throw new  RuntimeException("//处理反馈帖子方法出现异常",e); 
		
		}
		
	}
	//发表回复
	public void respeakAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getRespeakz().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_respeak_type().equals(1)){
					//查看该周期的次数
					if(!rps.getRespeakt().equals(0)){
						
						if(rps.getRespeakt()<=fuv.getFa_respeak_times()+1){
							fuv.setFa_respeak_type(1);
							fuv.setFa_respeak_times(fuv.getFa_respeak_times()+1);
							i=1;
						}else{
							fuv.setFa_respeak_times(fuv.getFa_respeak_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_respeak_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getRespeakz().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_respeak_type().equals(1)){
					if(1<=fuv.getFa_respeak_times()+1){
						fuv.setFa_respeak_type(1);
						fuv.setFa_respeak_times(fuv.getFa_respeak_times()+1);
						i=1;
					}else{
						fuv.setFa_respeak_times(fuv.getFa_respeak_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_respeak_type().equals(1)){
					//查看该周期的次数
					if(!rps.getRespeakt().equals(0)){
						
						if(rps.getRespeakt()<=fuv.getFa_respeak_times()+1){
							fuv.setFa_respeak_type(1);
							fuv.setFa_respeak_times(fuv.getFa_respeak_times()+1);
							i=1;
						}else{
							fuv.setFa_respeak_times(fuv.getFa_respeak_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_respeak_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateRespeakMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "发表回复", rps.getRespeakInte(), 0, "发表回复",fu.getFa_jifen()+rps.getRespeakInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "发表回复", rps.getRespeakFb(), 1, "发表回复",fu.getFa_feibiao()+rps.getRespeakFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getRespeakInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getRespeakFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("发表回复加积分方法出现错误",e);
		}
	}
	//发帖加分
	public void themeAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getThemez().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_theme_type().equals(1)){
					//查看该周期的次数
					if(!rps.getThemet().equals(0)){
						
						if(rps.getThemet()<=fuv.getFa_theme_times()+1){
							fuv.setFa_theme_type(1);
							fuv.setFa_theme_times(fuv.getFa_theme_times()+1);
							i=1;
						}else{
							fuv.setFa_theme_times(fuv.getFa_theme_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_theme_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getThemez().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_theme_type().equals(1)){
					if(1<=fuv.getFa_theme_times()+1){
						fuv.setFa_theme_type(1);
						fuv.setFa_theme_times(fuv.getFa_theme_times()+1);
						i=1;
					}else{
						fuv.setFa_theme_times(fuv.getFa_theme_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_theme_type().equals(1)){
					//查看该周期的次数
					if(!rps.getThemet().equals(0)){
						
						if(rps.getThemet()<=fuv.getFa_theme_times()+1){
							fuv.setFa_theme_type(1);
							fuv.setFa_theme_times(fuv.getFa_theme_times()+1);
							i=1;
						}else{
							fuv.setFa_theme_times(fuv.getFa_theme_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_theme_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateThemeMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "发帖", rps.getThemeInte(), 0, "发帖",fu.getFa_jifen()+rps.getThemeInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "发帖", rps.getThemeFb(), 1, "发帖",fu.getFa_feibiao()+rps.getThemeFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getThemeInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getThemeFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("发帖加积分方法出现错误",e);
		}
	}
	//帖子加精加分
	public void jingAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getJingz().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_jing_type().equals(1)){
					//查看该周期的次数
					if(!rps.getJingt().equals(0)){
						
						if(rps.getJingt()<=fuv.getFa_jing_times()+1){
							fuv.setFa_jing_type(1);
							fuv.setFa_jing_times(fuv.getFa_jing_times()+1);
							i=1;
						}else{
							fuv.setFa_jing_times(fuv.getFa_jing_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_jing_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getJingz().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_jing_type().equals(1)){
					if(1<=fuv.getFa_jing_times()+1){
						fuv.setFa_jing_type(1);
						fuv.setFa_jing_times(fuv.getFa_jing_times()+1);
						i=1;
					}else{
						fuv.setFa_jing_times(fuv.getFa_jing_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_jing_type().equals(1)){
					//查看该周期的次数
					if(!rps.getJingt().equals(0)){
						
						if(rps.getJingt()<=fuv.getFa_jing_times()+1){
							fuv.setFa_jing_type(1);
							fuv.setFa_jing_times(fuv.getFa_jing_times()+1);
							i=1;
						}else{
							fuv.setFa_jing_times(fuv.getFa_jing_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_jing_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateJingMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "帖子加精", rps.getJingInte(), 0, "帖子加精",fu.getFa_jifen()+rps.getJingInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "帖子加精", rps.getJingFb(), 1, "帖子加精",fu.getFa_feibiao()+rps.getJingFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getJingInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getJingFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("帖子加精加积分方法出现错误",e);
		}
	}
	//参与投票加分
	public void voteAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getVotez().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_vote_type().equals(1)){
					//查看该周期的次数
					if(!rps.getVotet().equals(0)){
						
						if(rps.getVotet()<=fuv.getFa_vote_times()+1){
							fuv.setFa_vote_type(1);
							fuv.setFa_vote_times(fuv.getFa_vote_times()+1);
							i=1;
						}else{
							fuv.setFa_vote_times(fuv.getFa_vote_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_vote_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getVotez().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_vote_type().equals(1)){
					if(1<=fuv.getFa_vote_times()+1){
						fuv.setFa_vote_type(1);
						fuv.setFa_vote_times(fuv.getFa_vote_times()+1);
						i=1;
					}else{
						fuv.setFa_vote_times(fuv.getFa_vote_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_vote_type().equals(1)){
					//查看该周期的次数
					if(!rps.getVotet().equals(0)){
						
						if(rps.getVotet()<=fuv.getFa_vote_times()+1){
							fuv.setFa_vote_type(1);
							fuv.setFa_vote_times(fuv.getFa_vote_times()+1);
							i=1;
						}else{
							fuv.setFa_vote_times(fuv.getFa_vote_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_vote_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateVoteMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "参与投票", rps.getVoteInte(), 0, "参与投票",fu.getFa_jifen()+rps.getVoteInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "参与投票", rps.getVoteFb(), 1, "参与投票",fu.getFa_feibiao()+rps.getVoteFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getVoteInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getVoteFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("参与投票加积分方法出现错误",e);
		}
	}
	//分页查询搜索中的帖子
	@Override
	public List<Map<String, Object>> searchNoteBySearchName(Integer curpage, Integer pagesize, String search) {
		try {
			List<Map<String, Object>> list = noteDao.searchNoteBySearchName(curpage,pagesize,search);
			for (Map<String, Object> map : list) {
				//查询该帖子的最新评论
				FaComment fc = fcDao.getNewComment(map.get("id").toString());
				Long zz = fcDao.findCountByNoteId(map.get("id").toString());
				
				map.put("huifu",zz );
				if(fc!=null && fc.getFa_id()!=null){
					map.put("nname", userDao.getNameByUserId(fc.getFa_userid()));
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = fc.getFa_time().getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime(fc.getFa_time()));
					}else{
						map.put("day", sdf.format(fc.getFa_time()));
					}
					
				}else{
					map.put("nname", "暂无人评论");
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = ((Date)map.get("ctimes")).getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime((Date)map.get("ctimes")));
					}else{
						map.put("day", sdf.format((Date)map.get("ctimes")));
					}
				}
				
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询搜索中的帖子方法出现异常",e); 
		}
	}
	//分页查询搜索中的帖子数量
	@Override
	public Long searchNoteBySearchNameCount(String search) {
		try {
			return noteDao.searchNoteBySearchNameCount(search);
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询搜索中的帖子数量方法出现异常",e); 
		}
	}
	//分页查询反馈模块中的帖子
	@Override
	public List<Map<String, Object>> selectFankuiNoteBySection(Integer curpage, Integer pagesize, Integer protype,
			Integer prostyle, Integer proquest, Integer handletype) {
		try {
			List<Map<String, Object>> list = noteDao.selectFankuiNoteBySection(curpage,pagesize,protype,prostyle,proquest,handletype);
			for (Map<String, Object> map : list) {
				Long zz = fcDao.findCountByNoteId(map.get("id").toString());
				map.put("huifu",zz );
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询反馈模块中的帖子方法出现异常",e); 
		}
	}
	//分页查询反馈模块中的帖子数量
	@Override
	public Long selectFankuiNoteBySectionCount(Integer protype, Integer prostyle, Integer proquest,
			Integer handletype) {
		try {
			return noteDao.selectFankuiNoteBySectionCount(protype,prostyle,proquest,handletype);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询反馈模块中的帖子数量方法出现异常",e); 
		}
	}
	//删除帖子投票选项
	public void deleteNoteVote(String [] ids) {
		try {
			noteDao.deleteNoteVote(ids);
		} catch (Exception e) {
			throw new  RuntimeException("删除帖子投票选项方法出现异常",e); 
		}
	}
	//查看投票人
	@Override
	public List<Map<String,Object>> getVoteMemberMsgByNoteId(String fa_id) {
		try {
			return noteDao.getVoteMemberMsgByNoteId(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("查看投票人方法出现异常",e); 
		}
	}
	@Override
	public List<Map<String, Object>> searchNoteByMany(Integer curpage, Integer pagesize, String sname,
			Integer tieOrUser, Integer types, Integer sorts, Integer section, Date parse, Date parse2) {
		try {
			List<Map<String, Object>> list = noteDao.searchNoteBySearchMany(curpage,pagesize,sname,tieOrUser,types,sorts,section,parse,parse2);
			for (Map<String, Object> map : list) {
				//查询该帖子的最新评论
				FaComment fc = fcDao.getNewComment(map.get("id").toString());
				Long zz = fcDao.findCountByNoteId(map.get("id").toString());
				
				map.put("huifu",zz );
				if(fc!=null && fc.getFa_id()!=null){
					map.put("nname", userDao.getNameByUserId(fc.getFa_userid()));
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = fc.getFa_time().getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime(fc.getFa_time()));
					}else{
						map.put("day", sdf.format(fc.getFa_time()));
					}
					
				}else{
					map.put("nname", "暂无人评论");
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = ((Date)map.get("ctimes")).getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime((Date)map.get("ctimes")));
					}else{
						map.put("day", sdf.format((Date)map.get("ctimes")));
					}
				}
				
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询搜索中的帖子方法出现异常",e); 
		}
	}
	@Override
	public Long searchNoteBySearchNameCounts(String sname, Integer tieOrUser, Integer types, Integer sorts,
			Integer section, Date st, Date et) {
		try {
			return noteDao.searchNoteBySearchNameCounts(sname,tieOrUser,types,sorts,section,st,et);
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询搜索中的帖子数量方法出现异常",e); 
		}
	}

}
