package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.pojo.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.NoticeService;
import com.service.OutinforService;
import com.service.UserService;

@Controller
public class NoticeController {
	@Autowired 
	private NoticeService ser;
	@Autowired 
	private UserService ser1;
	@Autowired 
	private OutinforService ser2;
	@RequestMapping("/insertNotice.action")
	public String insertNotice(Notice notice,UploadedFile file) throws ParseException, IllegalStateException, IOException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long now=new Date().getTime();
	    String d = format.format(now);
	    Date date=format.parse(d);
	    String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\notice\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        notice.setImg(("/images/notice/")+fileName);
	    notice.setCreatetime(date);
		ser.insertSelective(notice);
		return "forward:getAllNotices.action";
	}

	@RequestMapping("/personnelSum.action")
	@ResponseBody
	public String personnelSum() {
		int user=ser1.getAllUserSum();
		int admin=ser1.getAllAdminSum();
		int security=ser1.getAllSecuritySum();
		int notice=ser.getAllNoticeSum();
		String json="{'user': "+user+",'admin':"+admin+",'security':"+security+",'notice':"+notice+"}";
		System.out.println(json);
		return json;
	}
	
	@RequestMapping("/getAllNotices.action")
	public String getAllNotices(Model model,Integer currentPage) {
		Integer curPage=1;
		if(currentPage!=null) {
			curPage=currentPage;
		}
		PageUtil page=new PageUtil(5, ser.countByNotices(), curPage);
		PageUtil page1=new PageUtil(8, ser2.countByOutinfor(), curPage);
		List<Notice> notices=ser.getAllNotices(page);
		List<outinfor> outinfors=ser2.getAllOutinfor(page1);
		model.addAttribute("outinfors",outinfors);
		model.addAttribute("page1",page1);
		model.addAttribute("notices",notices);
		model.addAttribute("page",page);
		return "jsp/home";
	}
	
	@RequestMapping("/page.action")
	public String page(Model model,int noticeid) {
		Notice notice=ser.selectByPrimaryKey(noticeid);
		model.addAttribute("notice",notice);
		return "jsp/page";
	}
	@ResponseBody
	@RequestMapping("/editNotice.action")
	public String editNotice(@RequestBody String json) {
		ResultEntity resultEntity = new ResultEntity();
		JSONObject jsonObject = JSONObject.fromObject(json);
			Integer noticeId =(Integer) jsonObject.get("noticeId");
		   String noticeName=(String) jsonObject.get("noticeName");
		    Notice notice = new Notice();
		    notice.setNoticeid(noticeId);
		    notice.setNoticename(noticeName);
		    try{
		    	resultEntity.setData(ser.updateByPrimaryKeySelective(notice));
		    	resultEntity.setMsg("编辑成功");
		    	resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
			}catch (Exception e){
		    	resultEntity.setMsg("编辑失败");
		    	resultEntity.setStatus(ResultEnum.FAIL.getCode());
			}
		    JSONObject resultJson = JSONObject.fromObject(resultEntity);
		    return  resultJson.toString();
	}
	@RequestMapping("/delNotices.action")
	public String delNotices(@RequestBody String json) {
		ResultEntity resultEntity = new ResultEntity();
		JSONObject jsonObject = JSONObject.fromObject(json);
		Integer noticeId =(Integer) jsonObject.get("noticeId");
		Notice notice = new Notice();
		notice.setNoticeid(noticeId);
		try{
			resultEntity.setData(ser.deleteByPrimaryKey(noticeId));
			resultEntity.setMsg("删除成功");
			resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
		}catch (Exception e){
			resultEntity.setMsg("删除失败");
			resultEntity.setStatus(ResultEnum.FAIL.getCode());
		}
		JSONObject resultJson = JSONObject.fromObject(resultEntity);
		return resultJson.toString();
	}

	@RequestMapping("/searchNotices")
	public String searchNotice(Model model,Integer currentPage) {
		Integer curPage=1;
		if(currentPage!=null) {
			curPage=currentPage;
		}
		PageUtil page=new PageUtil(5, ser.countByNotices(), curPage);
		List<Notice> notices=ser.getAllNotices(page);
		model.addAttribute("notices",notices);
		return "jsp/noticeList";
	}
	
}
