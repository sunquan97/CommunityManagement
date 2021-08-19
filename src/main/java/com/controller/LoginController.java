package com.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.Date;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.CheckInService;
import com.service.LoginRecordService;
import com.service.UserService;
import com.util.Access_token_car;
import com.util.Base64Util;
import com.util.FaceSpot;
import com.util.FileUtil;
import com.util.HttpUtil;
import com.pojo.LoginRecord;
import com.pojo.User;
import com.pojo.checkin;

import net.sf.json.JSONObject;
import sun.net.www.protocol.http.HttpURLConnection;

@Controller
public class LoginController {
	
	@Autowired
	private UserService ser;
	@Autowired
	private LoginRecordService ser1;
	@Autowired
	private CheckInService ser2;

	@RequestMapping("/registe.action")
	public String registe(Model model,String img,User user){
		//设置用户基本属性
		user.setFlag(0);
		Date date = new Date(); 
		user.setCreatetime(date);
		user.setUserroleid(0);
		//把图片路径保存到数据库
		String fileName = System.currentTimeMillis() + ".png";
		user.setPhoto("C:\\images\\"+ fileName);
		ser.insertSelective(user);
		return "jsp/login";
	}
	
	@RequestMapping(value="/login.action",produces = "text/plain;charset=UTF-8")
	public String login(Model model,String username,String password,HttpServletRequest request){
		String result="";
		HttpSession session=request.getSession();
		User user=ser.getUserByUserName(username);
		if(user==null){
			result="用户名或密码错误";
			model.addAttribute("result",result);
			return "jsp/login";
		}
		if(user.getPassword().equals(password)){
			LoginRecord loginrecord=new LoginRecord();
			session.setAttribute("user",user);
			String ip=getIP().getString("cip");
			String content="登录成功";
			Date date = new Date(); 
			loginrecord.setArea(getIP().getString("cname"));
			loginrecord.setIp(ip);
			loginrecord.setContent(content);
			loginrecord.setLogintime(date);
			loginrecord.setUsername(user.getUsername());
			loginrecord.setFlag(0);
			ser1.insertSelective(loginrecord);
			result="欢迎登录";
			model.addAttribute("result",result);
			return "jsp/index";
		}
		result="用户名或密码错误";
		model.addAttribute("result",result);
		return "jsp/login";
	}
	
	@RequestMapping("/faceLogin.action")
	public String faceLogin(String username,String password,HttpServletRequest request){
		HttpSession session=request.getSession();
		User user=ser.getUserByUserName(username);
		session.setAttribute("user", user);
		LoginRecord loginrecord=new LoginRecord();
		String ip=getIP().getString("cip");
		String content="登录成功";
		Date date = new Date(); 
		loginrecord.setArea(getIP().getString("cname"));
		loginrecord.setIp(ip);
		loginrecord.setContent(content);
		loginrecord.setLogintime(date);
		loginrecord.setUsername(user.getUsername());
		loginrecord.setFlag(0);
		ser1.insertSelective(loginrecord);
		return "jsp/index";
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public String searchFace(String img) throws IOException {
		String fileName = System.currentTimeMillis() + ".png";
        GenerateImage(img, "C:\\images\\"+ fileName);
        byte[] file = FileToByte(new File("C:\\images\\"+ fileName));
		String js = FaceSpot.search(file, "face");
		return js.toString();
	}
	
	
	
	@RequestMapping(value="/faceregiste.action",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String registe(String img, String username) throws IOException {
		//把拍摄的照片保存到本地
		String fileName = System.currentTimeMillis() + ".png";
        GenerateImage(img, "C:\\images\\"+ fileName);
        byte[] file = FileToByte(new File("C:\\images\\"+ fileName));
        String js = FaceSpot.search(file, "face");
		return js.toString();
	}
	
	@RequestMapping(value="/faceregiste1.action",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String registe1(String img, String username) throws IOException {
		//把拍摄的照片保存到本地
		String fileName = System.currentTimeMillis() + ".png";
        GenerateImage(img, "C:\\images\\"+ fileName);
        byte[] file = FileToByte(new File("C:\\images\\"+ fileName));
        String js = FaceSpot.addUser(file, "BASE64", username, "face");
        System.out.println(js.toString());
		return js.toString();
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
    public boolean GenerateImage(String imgStr, String imgFilePath) {
        if (imgStr == null) // 图像数据为空
            return false;
        Decoder decoder = Base64.getDecoder();
        try {
            // Base64解码
            byte[] bytes = decoder.decode(imgStr);
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
            // 生成jpeg图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(bytes);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	@ResponseBody
	@RequestMapping(value="/carlogin.action",produces = "text/plain;charset=UTF-8")
    public String carlogin(String img) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/ocr/v1/license_plate";
        try {
            // 本地文件路径
    		String fileName = System.currentTimeMillis() + ".png";
            GenerateImage(img, "C:\\images\\car\\"+ fileName);
            String filePath = "C:\\images\\car\\"+ fileName;
            byte[] imgData = FileUtil.readFileByBytes(filePath);
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");
            String param = "image=" + imgParam;
            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = Access_token_car.getAuth();
            String result = HttpUtil.post(url, accessToken, param);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	
	//退出登录
	@RequestMapping("/Logout.action")
	public String Logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		return "jsp/login";
	}
	
	//获取ip地址
    public JSONObject getIP() {
      String ip = "http://pv.sohu.com/cityjson?ie=utf-8";
      String inputLine = "";
      String read = "";
      try {
          URL url = new URL(ip);
          HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
          BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
          while ((read = in.readLine()) != null) {
              inputLine += read;
          }
      } catch (Exception e) {
          e.printStackTrace();
      	}
      inputLine = inputLine.substring(0,inputLine.length() - 1);
      JSONObject jsonobject = JSONObject.fromObject(inputLine.split("=")[1]);
      return jsonobject;
    }
    
    @ResponseBody
    @RequestMapping(value="/checkUserName.action",produces = "text/plain;charset=UTF-8")
    public String checkUserName(String username){
		String result="";
		User user=ser.getUserByUserName(username);
		if(user==null){
			return result="√";
		}
		return result="已注册";
	}

    @ResponseBody
    @RequestMapping(value="/getCheckIn.action",produces = "text/plain;charset=UTF-8")
    public String getCheckIn(int userid){
		String result="";
		checkin checkin=ser2.selectByPrimaryKey(userid);
		Date date=new Date();
		System.out.println(checkin);
		if(checkin==null) {
			checkin checkinnew=new checkin();
			checkinnew.setCheckin(1);
			checkinnew.setUserid(userid);
			checkinnew.setChecktime(date);
			ser2.insertSelective(checkinnew);
		}else if(checkin.getCheckin()>13) {
			if(date.getDate()>checkin.getChecktime().getDate()) {
				return result="{'result': '您已打卡满14天，可以正常出行','flag':'1'}";
			}else {
				return result="{'result': '您已打卡满14天，可以正常出行','flag':'0'}";
			}
		}else if(checkin.getCheckin()<14){
			if(date.getDate()>checkin.getChecktime().getDate()) {
				return result="{'result': '您打卡不足14天，请居家隔离并打卡14天','flag':'0'}";
			}else {
				return result="{'result': '您打卡不足14天，请居家隔离并打卡14天','flag':'1'}";
			}
		}
		return result;
	}
    
    @ResponseBody
    @RequestMapping(value="/addCheckIn.action",produces = "text/plain;charset=UTF-8")
    public String addCheckIn(int userid){
		String result="";
		checkin checkin = ser2.selectByPrimaryKey(userid);
		Date date=new Date();
		int checkin1=checkin.getCheckin();
		checkin.setCheckin(checkin1+1);
		checkin.setUserid(userid);
		Date date1=new Date();
		checkin.setChecktime(date1);
		ser2.updateByPrimaryKeySelective(checkin);
		return result="打卡成功";
	}
    
}
