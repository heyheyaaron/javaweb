package feiao.forum.service.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;

import feiao.forum.dao.FaInteDao;
import feiao.forum.pojo.FaInte;

public final class FeiaoDataMsg {
	
	//会员积分变化表
	/**
	 * @param 用户id
	 * @param 用户操作
	 * @param 变化的数值
	 * @param 变化类型 0 :积分 1: 飞镖
	 * @param 详细
	 */
	public static FaInte saveInteData(String id,String nakes,Integer changeInte,Integer changeType,String detail,Integer sums){
		FaInte fid = new FaInte();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String ids = sdf.format(new Date())+RandomStringUtils.randomNumeric(11);
		fid.setFa_id(ids);
		fid.setFa_userid(id);
		fid.setFa_make(nakes);
		fid.setFa_change(changeInte);
		fid.setFa_changetype(changeType);
		fid.setFa_detail(detail);
		fid.setFa_changetime(new Date());
		fid.setFa_end(sums);
		return fid;
	}
	/**
	 * 获取积分变化表信息
	 * @param context
	 * @return
	 */
	public static InteRP findRP(ServletContext context){
		InteRP rp = new InteRP();
		try {
			
			Document doc = new SAXReader().read(new File(context.getRealPath("core.xml")));
			Element root = doc.getRootElement();
			//发表回复
			Element respeak = (Element) root.elements().get(0);
			Element rjval = (Element) respeak.elements().get(1);
			rp.setRespeakInte(Integer.parseInt(rjval.element("value").getText()));
			Element rfval = (Element) respeak.elements().get(2);
			rp.setRespeakFb(Integer.parseInt(rfval.element("value").getText()));
			Element rzval = (Element) respeak.elements().get(3);
			rp.setRespeakz(Integer.parseInt(rzval.element("value").getText()));
			Element rtval = (Element) respeak.elements().get(4);
			rp.setRespeakt(Integer.parseInt(rtval.element("value").getText()));
			//发表主题帖子
			Element theme = (Element) root.elements().get(1);
			Element tjval = (Element) theme.elements().get(1);
			Element tfval = (Element) theme.elements().get(2);
			Element tzval = (Element) theme.elements().get(3);
			Element ttval = (Element) theme.elements().get(4);
			rp.setThemeInte(Integer.parseInt(tjval.element("value").getText()));
			rp.setThemeFb(Integer.parseInt(tfval.element("value").getText()));
			rp.setThemez(Integer.parseInt(tzval.element("value").getText()));
			rp.setThemet(Integer.parseInt(ttval.element("value").getText()));
			//帖子加精
			Element jing = (Element) root.elements().get(2);
			Element jjval = (Element) jing.elements().get(1);
			Element jfval = (Element) jing.elements().get(2);
			Element jzval = (Element) jing.elements().get(3);
			Element jtval = (Element) jing.elements().get(4);
			rp.setJingInte(Integer.parseInt(jjval.element("value").getText()));
			rp.setJingFb(Integer.parseInt(jfval.element("value").getText()));
			rp.setJingz(Integer.parseInt(jzval.element("value").getText()));
			rp.setJingt(Integer.parseInt(jtval.element("value").getText()));
			//删帖
			Element del = (Element) root.elements().get(3);
			Element djval = (Element) del.elements().get(1);
			Element dfval = (Element) del.elements().get(2);
			Element dzval = (Element) del.elements().get(3);
			Element dtval = (Element) del.elements().get(4);
			rp.setDeleteInte(Integer.parseInt(djval.element("value").getText()));
			rp.setDeleteFb(Integer.parseInt(dfval.element("value").getText()));
			rp.setDeletez(Integer.parseInt(dzval.element("value").getText()));
			rp.setDeletet(Integer.parseInt(dtval.element("value").getText()));
			//登录
			Element login = (Element) root.elements().get(4);
			Element ljval = (Element) login.elements().get(1);
			Element lfval = (Element) login.elements().get(2);
			Element lzval = (Element) login.elements().get(3);
			Element ltval = (Element) login.elements().get(4);
			rp.setLoginInte(Integer.parseInt(ljval.element("value").getText()));
			rp.setLoginFb(Integer.parseInt(lfval.element("value").getText()));
			rp.setLoginz(Integer.parseInt(lzval.element("value").getText()));
			rp.setLogint(Integer.parseInt(ltval.element("value").getText()));
			//参与投票
			Element vote = (Element) root.elements().get(5);
			Element vjval = (Element) vote.elements().get(1);
			Element vfval = (Element) vote.elements().get(2);
			Element vzval = (Element) vote.elements().get(3);
			Element vtval = (Element) vote.elements().get(4);
			rp.setVoteInte(Integer.parseInt(vjval.element("value").getText()));
			rp.setVoteFb(Integer.parseInt(vfval.element("value").getText()));
			rp.setVotez(Integer.parseInt(vzval.element("value").getText()));
			rp.setVotet(Integer.parseInt(vtval.element("value").getText()));
			//设置头像
			Element title = (Element) root.elements().get(6);
			Element ijval = (Element) title.elements().get(1);
			Element ifval = (Element) title.elements().get(2);
			Element izval = (Element) title.elements().get(3);
			Element itval = (Element) title.elements().get(4);
			rp.setTitleInte(Integer.parseInt(ijval.element("value").getText()));
			rp.setTitleFb(Integer.parseInt(ifval.element("value").getText()));
			rp.setTitlez(Integer.parseInt(izval.element("value").getText()));
			rp.setTitlet(Integer.parseInt(itval.element("value").getText()));
			//邮箱认证
			Element email = (Element) root.elements().get(7);
			Element ejval = (Element) email.elements().get(1);
			Element efval = (Element) email.elements().get(2);
			Element ezval = (Element) email.elements().get(3);
			Element etval = (Element) email.elements().get(4);
			rp.setEmailInte(Integer.parseInt(ejval.element("value").getText()));
			rp.setEmailFb(Integer.parseInt(efval.element("value").getText()));
			rp.setEmailz(Integer.parseInt(ezval.element("value").getText()));
			rp.setEmailt(Integer.parseInt(etval.element("value").getText()));
			//产品注册
			Element pro = (Element) root.elements().get(8);
			Element pjval = (Element) pro.elements().get(1);
			Element pfval = (Element) pro.elements().get(2);
			Element pzval = (Element) pro.elements().get(3);
			Element ptval = (Element) pro.elements().get(4);
			rp.setProInte(Integer.parseInt(pjval.element("value").getText()));
			rp.setProFb(Integer.parseInt(pfval.element("value").getText()));
			rp.setProz(Integer.parseInt(pzval.element("value").getText()));
			rp.setProt(Integer.parseInt(ptval.element("value").getText()));
			//签到
			Element sno = (Element) root.elements().get(9);
			Element sjval = (Element) sno.elements().get(1);
			Element sfval = (Element) sno.elements().get(2);
			Element szval = (Element) sno.elements().get(3);
			Element stval = (Element) sno.elements().get(4);
			rp.setSignInte(Integer.parseInt(sjval.element("value").getText()));
			rp.setSignFb(Integer.parseInt(sfval.element("value").getText()));
			rp.setSignz(Integer.parseInt(szval.element("value").getText()));
			rp.setSignt(Integer.parseInt(stval.element("value").getText()));
			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rp;
		
	} 
}
