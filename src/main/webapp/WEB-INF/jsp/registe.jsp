<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="css/style.css"/>
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="${pageContext.request.contextPath}/jsp/js/jquery-3.2.1.min.js"></script>        
        <script src="assets/layer/layer.js" type="text/javascript"></script>
<title>注册</title>
</head>

	<style type="text/css">
	body,input{
		margin: 0;
		padding: 0;
		background: pink;
	}
	input{
		display: inline-block;
		background: #fff;
	}
	.xiao-container{
		width: 100%;
	}
	.xiao-register-box{
		position: relative;
		height: 800px;
		width: 800px;
		top: 50px;
		margin: 0 auto;
		z-index: 99999;
		background:#ffffff;
		border: 7px solid #ccc;
	}
	.xiao-title-box{
		position: absolute;
		width: 300px;
		height: 50px;
		margin-left: 250px;
		margin-top: 5px;
		text-align: center;
		font-size: 28px;
		font-weight: 800;
		color: #ff5000;
		line-height: 50px;
	}
	.xiao-username-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:100px;
		margin-left:80px;
		font-weight: 700;
	}
		.xiao-realname-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:420px;
		margin-left:400px;
		font-weight: 700;
	}
		.xiao-realname-input{
		display: inline-block;
		margin-left: 10px;
		/*background: green;*/
	}
	#realname{
		height: 35px;
		width: 200px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	.xiao-photo-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:420px;
		margin-left:80px;
		font-weight: 700;
	}
	.xiao-username-input{
		display: inline-block;
		margin-left: 5px;
		/*background: green;*/
	}
	.xiao-age-input{
		display: inline-block;
		margin-left: 5px;
		/*background: green;*/
	}
	#username{
		height: 35px;
		width: 200px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	#userPhoto{
		height: 35px;
		width: 200px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	#idnumber{
		height: 35px;
		width: 200px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	#age{
		height: 35px;
		width: 200px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	.xiao-userPassword-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:180px;
		margin-left:80px;
		font-weight: 700;
	}
	.xiao-userPassword-input{
		display: inline-block;
		margin-left: 20px;
	}
	#userPassword{
		height: 35px;
		width: 200px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	.xiao-userRePassword-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:260px;
		margin-left:80px;
		font-weight: 700;
	}
	.xiao-userRePassword-input{
		display: inline-block;
		margin-left: 10px;
	}
	#userRePassword{
		height: 35px;
		width: 180px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
		.xiao-age-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:260px;
		margin-left:80px;
		font-weight: 700;
	}
	.xiao-age-input{
		display: inline-block;
		margin-left: 30px;
	}
	#age{
		height: 35px;
		width: 205px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	.xiao-userPhone-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:340px;
		margin-left:80px;
		font-weight: 700;
	}
	.xiao-userPhone-input{
		display: inline-block;
		margin-left: 10px;
	}
	#userPhone{
		height: 35px;
		width: 180px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	.xiao-userEmail-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:340px;
		margin-left:400px;
		font-weight: 700;
	}
	.xiao-userEmail-input{
		display: inline-block;
		margin-left: 10px;
	}
	#userEmail{
		height: 35px;
		width: 290px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
 
	.xiao-userGender-box{
		position: absolute;
		width: 420px;
		height: 40px;
		line-height: 40px;
		margin-top:260px;
		margin-left:400px;
		font-weight: 700;
	}
	.xiao-userGender-input{
		display: inline-block;
		margin-left: 62px;
	}
	.xiao-require{
		color: red;
	}
	.xiao-submit-box{
		position:absolute;
		width: 80px;
		height: 40px;
		line-height: 40px;
		margin-top: 680px;
		margin-left:320px;
		border-radius: 5px;
		background: grey;
	}
	#xiao-submit-button{
		display: inline-block;
		width: 80px;
		height: 40px;
		border-radius: 5px;
		background: red;

	}
		#xiao-back-button{
		display: inline-block;
		width: 80px;
		height: 40px;
		border-radius: 5px;
		background: blue;
	}

.login-button { /* 按钮美化 */
	width: 60px; /* 宽度 */
	height: 40px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #1E90FF; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 17px; /* 字体大小 */
	margin-left:10px;
}
.back-button { /* 按钮美化 */
	width: 60px; /* 宽度 */
	height: 40px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #1E90FF; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 17px; /* 字体大小 */
}
.login-button:hover { /* 鼠标移入按钮范围时改变颜色 */
	background: #5599FF;
}
 
	</style>
<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎注册社区管理系统</span>    
    <ul>
    <li><a href="#">返回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
	    <form action="${pageContext.request.contextPath}/registe.action" method="post" id="formregiste">
	    <div class="xiao-container">
		<div class="xiao-register-box">
			<div class="xiao-title-box">
				<span>用户注册</span>
			</div>
				<div class="xiao-username-box" id="userbox">
					<span class="xiao-require">*</span>
					<label for="username">用户名</label>
					<div class="xiao-username-input">
						<input type="text" id="username" name="username" placeholder="由数字、字母和下划线组成" />
					</div>
				</div>
 				
 				<div class="xiao-username-box" style="margin-left:400px;float:left;">
					<span class="xiao-require">*</span>
					<label for="username">身份证号</label>
					<div class="xiao-username-input">
						<input type="text" id="idnumber" name="idnumber" placeholder="请输入18位身份证号" />
					</div>
				</div>
 				
				<div class="xiao-userPassword-box">
					<span class="xiao-require">*</span>
					<label for="userPassword">密码</label>
					<div class="xiao-userPassword-input">
						<input type="password" id="password" name="password" placeholder="请输入密码  6-12个字符" />
					</div>
				</div>
				
				<div class="xiao-age-box" style="margin-left:400px;float:left;margin-top:180px;">
					<span class="xiao-require">*</span>
					<label for="age">年龄</label>
					<div class="xiao-age-input">
						<input type="text" id="age" name="age" placeholder="请输入年龄" />
					</div>
				</div>
 
				<div class="xiao-userRePassword-box">
				<span class="xiao-require">*</span>
						<label for="userRePassword">确认密码</label>
					<div class="xiao-userRePassword-input">
						<input type="password" id="confirmpassword" name="confirmpassword" placeholder="请重复输入密码" />
					</div>
				</div>
 
				<div class="xiao-userPhone-box">
					<span class="xiao-require">*</span>
					<label for="userPhone">手机号码</label>
					<div class="xiao-userPhone-input">
						<input type="text" id="phonenumber" name="phonenumber" placeholder="请输入您的11位手机号码" />
					</div>
				</div>
				
				<div class="xiao-userEmail-box">
					<span class="xiao-require">*</span>
					<label for="userEmail">家庭地址</label>
					<div class="xiao-userEmail-input">
						<input type="text" id="address" name="address" placeholder="请输入您的家庭地址" />
					</div>
				</div>
				<div class="xiao-realname-box">
					<span class="xiao-require">*</span>
					<label for="realname">真实姓名</label>
					<div class="xiao-realname-input">
						<input type="text" id="realname" name="realname" placeholder="请输入您的真实姓名" />
					</div>
				</div>
				<div class="xiao-photo-box">
					<span class="xiao-require">*</span>
					<label for="userPhoto">头像   (用于门禁系统人脸识别)     <input class="login-button login-button:hover"  type="button" onclick="registe()" value="拍照"></label>
				</div>

				<div class="xiao-userGender-box">
					<span class="xiao-require">*</span>
					<label for="userGender">性别</label>
					<div class="xiao-userGender-input">
						<input type="radio" id="gender" name="gender" value="0" checked="checked" />男   
						<input type="radio" id="gender" name="gender" value="1" />女
					</div>
				</div>
				<div id="media" style="margin-top:470px;margin-left:100px;">
	                <video id="video"  width="250" height="250" autoplay></video>
					<canvas id="canvas" width="250" height="250"></canvas>
            	</div>
				
					<input id = "xiao-submit-button" type="button" onclick="registeuser()" style="margin-left:280px; " value="立即注册" />
				<input class="back-button" style="margin-left:50px; "  type="button" onclick="javascript:history.go(-1)" value="返回">	
				
				
            <dt>
                <input  type="hidden" id="img" value=""/>
            </dt>
            
        </dl>
		</div>
	</div>


    </form>
          <script type="text/javascript">
          var canvans = document.getElementById("canvas");
          var video = document.getElementById("video"); //获取video标签
          var context = canvas.getContext("2d");
          var con  ={
              audio:false,
              video:{
              width:300,
              height:300,
              }
          };  
          //导航 获取用户媒体对象
				navigator.mediaDevices.getUserMedia(con)
                 .then(function(stream){
                     video.srcObject=stream;
                     video.onloadmetadate = function(e){
                         video.play();
                     }
                 });
             var num=0;
              function registe(){
                 context.drawImage(video,0,0);
                 var imgData = canvans.toDataURL();
                 var imgData1 = imgData.split("base64,")[1];
                 $("#img").attr("value",imgData1);
                 var username = $("#username").val();
                 	 $.ajax({
                         type:"post",
                         url:"${pageContext.request.contextPath}/faceregiste.action",
                         data: {"img":imgData1,"username":username},
                         success:function(data){
                        	 data=eval('('+data+')');
                        	 if(data.error_msg=="SUCCESS"){
                        		 if(data.result.user_list[0].score > 90){
                 					$("#xiao-submit-button").attr("disabled", true);
                 					alert("您已注册");
                 	 			} else{
                 	 				$.ajax({
                                        type:"post",
                                        url:"${pageContext.request.contextPath}/faceregiste1.action",
                                        data: {"img":imgData1,"username":username},
                                        success:function(data){
                                       	 data=eval('('+data+')');
                                       	$("#xiao-submit-button").attr("disabled", false);
                                       	 alert("图片注册成功");
                                      },error:function(msg){
                                            alert("错误");
                                      }
                                  }); 
                 	 			} 
                 	 		 }else{
                 	 			$("#xiao-submit-button").attr("disabled", true);
                 	 			alert(data.error_msg);
                 	 		 }
                       },error:function(msg){
                             alert("错误");
                       }
                   }); 
            }
              function registeuser(){
                 var username = $("#username").val();
                 var password = $("#password").val();
                 var idnumber = $("#idnumber").val();
                 var age = $("#age").val();
                 var input = $("#input").val();
                 var confirmpassword = $("#confirmpassword").val();
                 var phonenumber = $("#phonenumber").val();
                 var address = $("#address").val();
                 var realname = $("#realname").val();
                 var idnumber1 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
                 var username1 = new RegExp("[\\u4E00-\\u9FFF]+","g");
                 var phonenumber1 = /^[1][3,4,5,7,8][0-9]{9}$/;
                 var realname1 =/^[\u4e00-\u9fa5]{2,4}$/;  
                 var age1=/^\d+(\.\d+)?$/;
                 if(username== "" || $.trim($("#username").val()).length == 0){
            		 alert("请输入用户名！");
            	 }else if (username1.test(username)){
                 	alert("用户名不能含有有中文");
                 }else if(username.length > 20){
            		 alert("用户名长度不能超过20位");
            	 }else if(input=="已注册"){
            		 alert("用户名已注册");
            	 }else if($("#password").val().length == 0){
            		 alert("请输入密码！");
            	 }else if(password.length < 6 || password.length > 12){
            		 alert("密码长度范围在6-12位之间");
            	 }else if(idnumber.length ==0){
            		 alert("请输入身份证号");
            	 }else if(!idnumber1.test(idnumber)){
            		 alert("身份证号输入不合法");
            	 }else if(age.length == 0){
            		 alert("请输入年龄");
            	 }else if(!age1.test(age)){
            		 alert("请输入年龄");
            	 }else if(confirmpassword.length ==0){
            		 alert("请再次输入密码");
            	 }else if(confirmpassword!=password){
            		 alert("两次密码输入不一致");
            	 }else if(phonenumber.length ==0){
            		 alert("请输入手机号码");
            	 }else if(!phonenumber1.test(phonenumber)){
            		 alert("请输入正确的手机号码");
            	 }else if(address.length ==0){
            		 alert("请输入家庭住址");
            	 }else if(realname.length ==0){
            		 alert("请输入真实姓名");
            	 }else if(!realname1.test(realname)){
            		 alert("请输入真实姓名");
            	 }else{
            		 $("#formregiste").submit();
            	 }
            }
              $("#username").change(function(){
            	  var username = $("#username").val();
                  $.ajax({
                      type:"post",
                      url:"${pageContext.request.contextPath}/checkUserName.action",
                      data: {"username":username},
                      success:function(data){
                    	$("#div").empty();
                      	var span="<span id='span1' style='color: red;'>"+data+"</span>"
                      	var input="<input type='hidden' value='"+data+"' id='input'>"
                      	var div="<div id='div' style='float:right;margin-right:110px;'> </div>"
                      	$("#userbox").append(div); 
                      	$("#div").append(span); 
                      	$("#div").append(input); 
                    },error:function(msg){
                          alert("错误");
                    }
                }); 
            	});
              
            
        </script>                  
</body>
</html>
