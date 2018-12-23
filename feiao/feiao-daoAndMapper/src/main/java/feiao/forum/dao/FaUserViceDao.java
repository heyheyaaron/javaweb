package feiao.forum.dao;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaUserVice;

@Repository
public interface FaUserViceDao {
	//创建会员附属表
	void addMember(FaUserVice fuv);
	//删除会员
	void deleteMember(String[] ids);
	//更新每天凌晨的签到信息（删帖）
	void updateDeleteTime();
	//更新每天凌晨的签到信息（邮箱）
	void updateEmailTime();
	//更新每天凌晨的签到信息（加精）
	void updateJingTime();
	//更新每天凌晨的签到信息（登录签到）
	void updateLoginTime();
	//更新每天凌晨的签到信息（产品注册）
	void updateProTime();
	//更新每天凌晨的签到信息（发表回复）
	void updateRespeakTime();
	//更新每天凌晨的签到信息（发帖）
	void updateThemeTime();
	//更新每天凌晨的签到信息（头像）
	void updateTitleTime();
	//更新每天凌晨的签到信息（投票）
	void updateVoteTime();
	//更新每天凌晨的签到信息（签到）
	void updateSignTime();
	//根据id查询会员附属表
	FaUserVice get(String fa_id);
	// 改变信息（登录）
	void updateLoginMb(FaUserVice fuv);
	// 改变信息（签到）
	void updateSignMb(FaUserVice fuv);
	//设置头像加分
	void updateTitleMb(FaUserVice fuv);
	//注册产品
	void updateProMb(FaUserVice fuv);
	//发表回复
	void updateRespeakMb(FaUserVice fuv);
	//发帖
	void updateThemeMb(FaUserVice fuv);
	//帖子加精
	void updateJingMb(FaUserVice fuv);
	//参与投票
	void updateVoteMb(FaUserVice fuv);
	//删帖
	void updateDeleteMb(FaUserVice fuv);

}
