<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title></title>
<link href="static/css/login1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="static/assets/css/ace.min.css" />
<script src="static/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
  #footer {
      height: 40px;
      line-height: 40px;
      position: fixed;
      bottom: 0;
      width: 100%;
      text-align: center;
      background: #333;
      color: #fff;
      font-family: Arial;
      font-size: 13px;
      letter-spacing: 1px;
  }
</style>
</head>

<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎登录智慧社区管理系统</span>    
    <ul>
    <li><a href="/carlogin">车辆通过</a></li>
    <li><a href="/userlogin">用户通过</a></li>
    <li><a href="/">返回首页</a></li>
    </ul>    
    </div>
<div class="login_box">
      <div class="login_l_img"><img src="${pageContext.request.contextPath}/static/images/login-img.png" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="${pageContext.request.contextPath}/static/images/login_logo.png" /></a></div>
          <div class="login_name">
               <p>智慧社区管理系统</p>
          </div>
          <form method="post" action="${pageContext.request.contextPath}/login.action" id="login">
              <input name="username" type="text" id="username"  value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}">
             </label><input name="password" type="password"   id="password" placeholder="密码"/>
              <input value="密码登录" style="width:45%;" type="button" id="login_btn">
              <input value="注册" id="registe_btn" style="width:45%;margin-left:24px;" type="button">
              <input value="人脸识别登录" id="facelogin_btn" style="width:100%;margin-top:5px;" type="button">
          </form>
      </div>
</div>
<input type="hidden" value="${result} " id="result">

</body>
<script>
$('#facelogin_btn').on('click', function(){
	window.location.href="/facelogin"
});
$('#registe_btn').on('click', function(){
	window.location.href="/registe"
});
$('#login_btn').on('click', function(){
	 var username =$("#username").val();
	 var password =$("#password").val();
	 var username1 = new RegExp("[\\u4E00-\\u9FFF]+","g");
	 if(username== "" || $.trim($("#username").val()).length == 0){
		 alert("请输入用户名！");
	 }else if (username1.test(username)){
      	alert("用户名不能含有有中文");
     }else if(username.length > 20){
		 alert("用户名长度不能超过20位");
	 }else if(password== "" || $.trim($("#password").val()).length == 0){
		 alert("请输入密码！");
	 }else if(password.length <6 || password.length > 12){
		 alert("密码长度范围在6-12位之间");
	 }else{
		  $('#login').submit(); 
	 }
});
var result =$("#result").val()
if(result!=" " || $.trim($("#result").val()).length != 0){
	if(result=="欢迎登录"){
		alert(result);
	}else{
		alert(result);
	}
}
$(function(){
	$.ajax({
		type:"post",
		url:"https://api.tianapi.com/txapi/ncov/index?key=7dcef006b46a8fc296af6b3266cf6a10",
		success:function(data){
			$.each(data.newslist,function(i,pro){
				$.each(pro.news,function(i,json){
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath }/addOutinfor.action",
						data : {
							id : json.id,
							title: json.title,
							summary: json.summary,
							infosource: json.infoSource,
							sourceurl: json.sourceUrl
						},
						success:function(data){
						},
						error:function(xmlHttpRequest){
							alert(xmlHttpRequest.status);
						}
					});
				}); 
			}); 
		},
		error:function(xmlHttpRequest){
			alert(xmlHttpRequest.status);
		}
	});
});
</script>
</html>