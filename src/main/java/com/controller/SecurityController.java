package com.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.service.UserService;
import com.pojo.UploadedFile;
import com.pojo.User;
import com.util.FaceSpot;


@Controller
public class SecurityController {
	@Autowired
	private UserService ser;
	
	@RequestMapping("/getAllSecuritys.action")
	public String getAllSecuritys(Model model){
		List<User> securitys=ser.AllSecuritys();
		int size=securitys.size();
		model.addAttribute("size",size);
		model.addAttribute("securitys",securitys);
		return "jsp/security";
	}
	
	@RequestMapping("/getSecurityById.action")
	@ResponseBody
	public User getSecurityById(int userid){
		User user=ser.selectByPrimaryKey(userid);
		return user;
	}
	
	@RequestMapping("/searchSecurity.action")
	public String searchSecurity(Model model,String search,String addtime){
		List<User> securitys=ser.searchSecurity(search,addtime);
		model.addAttribute("securitys",securitys);
		model.addAttribute("search",search);
		model.addAttribute("addtime",addtime);
		return "jsp/security";
	}
	
	@RequestMapping(value="/addSecurity.action",method=RequestMethod.POST)
	public String addSecurity (User user,HttpServletRequest request, UploadedFile file,Model model)throws IllegalStateException, IOException {
		Date date = new Date(); 
		user.setCreatetime(date);
		String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        user.setPhoto(("C:\\images\\")+fileName);
		ser.insertSelective(user);
		byte[] image = FileToByte(new File("C:\\images\\"+ fileName));
		FaceSpot.addUser(image, "BASE64", user.getUsername(), "face");
		return "forward:getAllSecuritys.action";
	}
	
	@RequestMapping(value="/updateSecurity.action",method=RequestMethod.POST)
	public String updateSecurity (User user,HttpServletRequest request, UploadedFile file,Model model)throws IllegalStateException, IOException {
		String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        user.setPhoto(("C:\\images\\")+fileName);
		ser.updateByPrimaryKeySelective(user);
		byte[] image = FileToByte(new File("C:\\images\\"+ fileName));
		FaceSpot.addUser(image, "BASE64", user.getUsername(), "face");
		return "forward:getAllSecuritys.action";
	}
	
	@RequestMapping("/stopSecurity.action")
	public String stopSecurity(Model model,int userid){
		//用户启用
		ser.updateStopFlag(userid);
		return "forward:getAllSecuritys.action";
	}
	
	@RequestMapping("/startSecurity.action")
	public String startSecurity(Model model,int userid){
		//用户停用
		ser.updateStartFlag(userid);
		return "forward:getAllSecuritys.action";
	}
	@RequestMapping("/delSecurity.action")
	public String delSecurity(Model model,int userid){
		//用户删除
		ser.deleteByPrimaryKey(userid);
		return "forward:getAllSecuritys.action";
	}
	
	public static byte[] FileToByte(File file) throws IOException {
		// 将数据转为流
		@SuppressWarnings("resource")
		InputStream content = new FileInputStream(file);
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		byte[] buff = new byte[100];
		int rc = 0;
		while ((rc = content.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		// 获得二进制数组
		return swapStream.toByteArray();
	}
}
