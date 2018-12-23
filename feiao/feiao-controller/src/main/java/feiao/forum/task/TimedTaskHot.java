package feiao.forum.task;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.TriggerContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import feiao.forum.service.BbsService;


@Component

public class TimedTaskHot implements SchedulingConfigurer{
	//热搜置顶计时器
	@Autowired
	private BbsService service;
	/*@Scheduled(cron = "0 0 0 * * ? ") 
    public void taskHot() {
		
    }*/
	//@Value("#{configProperties['taskhottime']}")
	
	public static String cron="0/5 * * * * ? ";  
	
    static{
    	Properties prop = new Properties();
    	try {

    		URL url = TimedTaskHot.class.getClassLoader().getResource("task.properties");
    		
			FileInputStream fis = new FileInputStream(url.getFile());
			prop.load(fis);
			cron=prop.getProperty("task.hot.time");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    }

	//int i=0;    
    
    @Override      
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {    
        taskRegistrar.addTriggerTask(new Runnable() {      
        @Override      
        public void run(){    
        //i++;    
        //删除上级时间段的热搜数据
    	service.removeHotedData();
    	//更新这个时间段的热搜数据
    	service.updateNewHotData();
        System.out.println(":热搜置顶计时器："+new Date());
            // 任务逻辑      
       // System.out.println("第"+(i)+"次开始执行操作... " +"时间：【" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(new Date()) + "】");    
                
        }    
    }, new Trigger(){    
        @Override    
        public Date nextExecutionTime(TriggerContext triggerContext) {    
            //任务触发，可修改任务的执行周期     
            CronTrigger trigger = new CronTrigger(cron);    
            Date nextExec = trigger.nextExecutionTime(triggerContext);    
            return nextExec;      
        }    
    });    
}    
    @Bean 
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() { 
	return new PropertySourcesPlaceholderConfigurer(); 
	} 
}
