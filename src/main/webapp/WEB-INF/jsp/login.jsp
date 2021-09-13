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
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">
<style type="text/css">

</style>
</head>

<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎登录智慧社区管理系统</span>    
    <ul>
    <li><a href="/carLogin">车辆通过</a></li>
    <li><a href="/userLogin">用户通过</a></li>
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
              <input name="username" type="text" id="username" placeholder="用户名" >
              <input name="password" type="password"   id="password" placeholder="密码"/>
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
	window.location.href="/faceLogin"
});
$('#registe_btn').on('click', function(){
	window.location.href="/registe"
});
$('#login_btn').on('click', function(){
	 var username =$("#username").val();
	 var password =$("#password").val();
	 if(username== "" || $("#username").val().length == 0){
		 layer.msg('请输入用户名');
	 // }else if (username1.test(username)){
     //  	alert("用户名不能含有有中文");
     }else if(username.length > 20){
		 layer.msg('用户名长度不能超过20位');
	 }else if(password== "" || $("#password").val().length == 0){
		 layer.msg('请输入密码');
	 }else if(password.length <6 || password.length > 12){
		 layer.msg('密码长度范围在6-12位之间');
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

</script>
</html>
