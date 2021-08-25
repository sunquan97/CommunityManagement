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
		<form action="${pageContext.request.contextPath}/registe.action" method="post" id="formregiste">
			<input name="username" type="text" id="username"  value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}">
			<input name="password" type="password"   id="password" placeholder="密码"/>
			<input name="userRePassword" type="password"   id="userRePassword" placeholder="确认密码"/>
			<input id="xiao-submit-button" type="button" style="float: left;width: 49%" onclick="registeuser()" value="立即注册"/>
			<input class="back-button"   type="button" style="float: left;width: 49%;margin-left: 5px;"	onclick="javascript:history.go(-1)" value="返回">
<%--			<div class="xiao-container">--%>
<%--				<div class="xiao-register-box">--%>
<%--					<div class="xiao-title-box"><span>用户注册</span></div>--%>
<%--					<div class="xiao-username-box" id="userbox"><span class="xiao-require">*</span><label--%>
<%--							for="username">用户名</label>--%>
<%--						<div class="xiao-username-input"><input type="text" id="username" name="username"--%>
<%--																placeholder="由数字、字母和下划线组成"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-username-box" style="margin-left:400px;float:left;"><span--%>
<%--							class="xiao-require">*</span><label for="username">身份证号</label>--%>
<%--						<div class="xiao-username-input"><input type="text" id="idnumber" name="idnumber"--%>
<%--																placeholder="请输入18位身份证号"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-userPassword-box"><span class="xiao-require">*</span><label--%>
<%--							for="userPassword">密码</label>--%>
<%--						<div class="xiao-userPassword-input"><input type="password" id="password" name="password"--%>
<%--																	placeholder="请输入密码  6-12个字符"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-age-box" style="margin-left:400px;float:left;margin-top:180px;"><span--%>
<%--							class="xiao-require">*</span><label for="age">年龄</label>--%>
<%--						<div class="xiao-age-input"><input type="text" id="age" name="age" placeholder="请输入年龄"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-userRePassword-box"><span class="xiao-require">*</span><label for="userRePassword">确认密码</label>--%>
<%--						<div class="xiao-userRePassword-input"><input type="password" id="confirmpassword"--%>
<%--																	  name="confirmpassword" placeholder="请重复输入密码"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<div class="xiao-userPhone-box"><span class="xiao-require">*</span><label--%>
<%--							for="userPhone">手机号码</label>--%>
<%--						<div class="xiao-userPhone-input"><input type="text" id="phonenumber" name="phonenumber"--%>
<%--																 placeholder="请输入您的11位手机号码"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-userEmail-box"><span class="xiao-require">*</span><label--%>
<%--							for="userEmail">家庭地址</label>--%>
<%--						<div class="xiao-userEmail-input"><input type="text" id="address" name="address"--%>
<%--																 placeholder="请输入您的家庭地址"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-realname-box"><span class="xiao-require">*</span><label for="realname">真实姓名</label>--%>
<%--						<div class="xiao-realname-input"><input type="text" id="realname" name="realname"--%>
<%--																placeholder="请输入您的真实姓名"/></div>--%>
<%--					</div>--%>
<%--					<div class="xiao-photo-box"><span class="xiao-require">*</span><label for="userPhoto">头像--%>
<%--						(用于门禁系统人脸识别) <input class="login-button login-button:hover" type="button" onclick="registe()"--%>
<%--											value="拍照"></label></div>--%>
<%--					<div class="xiao-userGender-box"><span class="xiao-require">*</span><label--%>
<%--							for="userGender">性别</label>--%>
<%--						<div class="xiao-userGender-input"><input type="radio" id="gender" name="gender" value="0"--%>
<%--																  checked="checked"/>男   <input type="radio" id="gender"--%>
<%--																								name="gender"--%>
<%--																								value="1"/>女--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<div id="media" style="margin-top:470px;margin-left:100px;">--%>
<%--						<video id="video" width="250" height="250" autoplay></video>--%>
<%--						<canvas id="canvas" width="250" height="250"></canvas>--%>
<%--					</div>--%>
<%--					<input id="xiao-submit-button" type="button" onclick="registeuser()" style="margin-left:280px; "--%>
<%--						   value="立即注册"/><input class="back-button" style="margin-left:50px; " type="button"--%>
<%--												onclick="javascript:history.go(-1)" value="返回">--%>
<%--					<dt><input type="hidden" id="img" value=""/></dt>--%>
<%--					</dl></div>--%>
<%--			</div>--%>
		</form>
	</div>
</div>


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

</script>
</html>
