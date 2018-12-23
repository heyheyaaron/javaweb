package feiao.forum.task;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import feiao.forum.service.MemberService;
import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
//用注解方式实现定时器
@Component
public class TimedTaskSign {
	
	@Autowired
	private MemberService service;
	
	//登录计时器，每到 凌晨运行一次
	@Scheduled(cron = "0 0 0 * * ? ") 
	//@Scheduled(cron = "0 0/1 * * * ?") 
    public void taskSign() {
		ServletContext context = ContextLoader.getCurrentWebApplicationContext().getServletContext();
		
		/*service.updateSignStatus();*/
		InteRP rp = FeiaoDataMsg.findRP(context);
		//删帖
		if(rp.getDeletez().equals(2)){
			service.updateDeleteTime();
		}
		//验证邮箱
		if(rp.getEmailz().equals(2)){
			service.updateEmailTime();
		}
		//加精
		if(rp.getJingz().equals(2)){
			service.updateJingTime();
		}
		//登录
		if(rp.getLoginz().equals(2)){
			service.updateLoginTime();
		}
		//签到
		if(rp.getSignz().equals(2)){
			service.updateSignTime();
		}
		//产品祖册
		if(rp.getProz().equals(2)){
			service.updateProTime();
		}
		//发表回复
		if(rp.getRespeakz().equals(2)){
			service.updateRespeakTime();
		}
		//发帖
		if(rp.getThemez().equals(2)){
			service.updateThemeTime();
		}
		//设置头像
		if(rp.getTitlez().equals(2)){
			service.updateTitleTime();
		}
		//投票
		if(rp.getVotez().equals(2)){
			service.updateVoteTime();
		}
		
        System.err.println("登录计时器："+new Date());
    }
}
