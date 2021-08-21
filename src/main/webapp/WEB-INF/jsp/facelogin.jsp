<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style1.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<style>
body {
	height: 100%;
	background: #213838;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/verificationNumbers.js"></script>
<script src="${pageContext.request.contextPath}/static/js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
});
</script>


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	height: 100vh;
	background-position: center;
	overflow: hidden;
}

h1 {
	color: #fff;
	text-align: center;
	font-weight: 100;
	margin-top: 40px;
}

#media {
	width: 280px;
	height: 250px;
	margin: 10px auto 0;
	border-radius: 30px;
	overflow: hidden;
	opacity: 0.7px;
}

#video {
	
}

#canvas {
	display: none;
}

#btn {
	width: 160px;
	height: 50px;
	background: #03a9f4;
	margin: 70px auto 0;
	text-align: center;
	line-height: 50px;
	color: #fff;
	border-radius: 40px;
}
</style>
</head>

<body>
	<form action=""
		method="get">
		<dl class="admin_login" style="height: 400px;">
			<dt>
				<strong>智慧社区管理系统</strong> <em>Management System</em> <strong>人脸识别</strong>
			</dt>
			<div id="media">
				<video id="video" width="300" height="300" autoplay></video>
				<canvas id="canvas" width="400" height="300"></canvas>
			</div>
			<dd>
				<input type="button" onclick="query()" value="立即登录"
					class="submit_btn" />
					
			</dd>
			<dd>
				<input type="button" onclick="javascript:history.go(-1)" value="返回"
					class="submit_btn" />
			</dd>
		</dl>
		<script type="text/javascript">
  		//var 是定义变量
  		var video = document.getElementById("video"); //获取video标签
  		var context = canvas.getContext("2d");
  		var con  ={
  			audio:false,
  			video:{
  			width:1024,
  			height:1024,
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
  			
  	
  			function query(){
  				//把流媒体数据画到convas画布上去
  				context.drawImage(video,0,0,300,300);
  				//获取图像
  				var img = getBase64();
  				//Ajax将Base64字符串传输到后台处理
  				$.ajax({
  					type : "POST",
  					url : "${pageContext.request.contextPath}/search.action",
  					data : {
  						img : img
  					},
  					dataType : "JSON",
  					success : function(data) {
  						alert(data.error_msg);
  						//取出对比结果的返回分数，如果分数90以上就判断识别成功了
  						if(parseInt(data.result.user_list[0].score) > 90) {
  							//关闭摄像头
  							video.srcObject.getTracks()[0].stop();
  							//提醒用户识别成功
  							//验证成功跳转页面
  							window.location.href="${pageContext.request.contextPath}/faceLogin.action?username="+data.result.user_list[0].user_id+"";
  				  		}else{
  				  			alert("您的头像未注册，无法人脸识别登录");
  				  		}
  						
  					},
  					error : function() {
  						alert("图像模糊，请重新拍照！");
  					}
  				});
			}
  			function getBase64() {
  				//获取当前图像并转换为Base64的字符串
  				var imgSrc = canvas.toDataURL("image/png");
  				//截取字符串
  				return imgSrc.substring(22);
  			};
		</script>
	</form>
</body>
</html>
