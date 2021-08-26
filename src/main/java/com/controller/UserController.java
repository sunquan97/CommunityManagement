package com.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.service.LoginRecordService;
import com.service.UserService;
import com.pojo.LoginRecord;
import com.pojo.UploadedFile;

import com.util.FaceSpot;


@Controller
public class UserController {
	@Autowired
	private UserService ser;
	@Autowired
	private LoginRecordService ser1;
	//查询用户
	@RequestMapping("/searchUser.action")
	public String searchUser(Model model,String search,String addtime){
		List<User> users=ser.searchUser(search,addtime);
		model.addAttribute("users",users);
		model.addAttribute("search",search);
		model.addAttribute("addtime",addtime);
		return "jsp/user_list";
	}
	//获取所有用户
	@RequestMapping("/getAllUsers.action")
	public String getAllUsers(Model model){
		List<User> users=ser.allUsers();
		int size=users.size();
		model.addAttribute("size",size);
		model.addAttribute("users",users);
		return "jsp/user_list";
	}
	//根据ID查询用户
	@RequestMapping("/getUserById.action")
	@ResponseBody
	public User getUserById(String userid){
		User user=ser.selectByPrimaryKey(userid);
		return user;
	}
	//添加用户
	@RequestMapping(value="/addUser.action",method=RequestMethod.POST)
	public String addUser (User user,HttpServletRequest request, UploadedFile file,Model model)throws IllegalStateException, IOException {
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
		return "forward:getAllUsers.action";
	}
	//修改用户
	@RequestMapping(value="/updateUser.action",method=RequestMethod.POST)
	public String updateUser (User user,HttpServletRequest request, UploadedFile file,Model model)throws IllegalStateException, IOException {
		String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        user.setPhoto(("C:\\images\\")+fileName);
		ser.updateByPrimaryKeySelective(user);
		byte[] image = FileToByte(new File("C:\\images\\"+ fileName));
		FaceSpot.addUser(image, "BASE64", user.getUsername(), "face");
		return "forward:getAllUsers.action";
	}
	@RequestMapping("/stopUser.action")
	public String stopUser(Model model,String userid){
		//用户启用
		ser.updateStopFlag(userid);
		return "forward:getAllUsers.action";
	}
	
	@RequestMapping("/startUser.action")
	public String startUser(Model model,String userid){
		//用户停用
		ser.updateStartFlag(userid);
		return "forward:getAllUsers.action";
	}
	@RequestMapping("/delUser.action")
	public String delUser(Model model,String userid){
		//用户删除
		ser.deleteByPrimaryKey(userid);
		return "forward:getAllUsers.action";
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
	
	//查询用户个人信息
	@RequestMapping("/getInformationByUserName.action")
	public String getInformationByUserName(Model model,String username){
		User user=ser.getUserByUserName(username);
		List<LoginRecord> loginrecords=ser1.getInformationByUserName(username);
		model.addAttribute("loginrecords",loginrecords);
		model.addAttribute("user",user);
		return "jsp/UserInfo";
	}
	//修改密码
	@ResponseBody
	@RequestMapping(value="/selectPassword.action",produces = "text/plain;charset=UTF-8")
	public String selectPassword(String userid,String password,String newpassword){
		String result="";
		User user=ser.selectPassword(userid);
		if(user.getPassword().equals(password)){
			result="{'msg': '旧密码相同'}";
			user.setPassword(newpassword);
			user.setUserid(userid);
			ser.updateByPrimaryKeySelective(user);
		}else{
			result="{'msg': '旧密码不相同'}";
		}
		return result;
	}
	
}
