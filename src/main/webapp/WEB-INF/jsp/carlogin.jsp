<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>车辆通行</title>
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
				<strong>智慧社区管理系统</strong> <em>Management System</em> <strong>车辆识别</strong>
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
			<input  id="time1" type="hidden"  class="text_add" value=""/>
			<input  id="vehiclenumber1" type="hidden"  class="text_add" value=""/>
			<input name="vehiclenumber" id="vehiclenumber" type="hidden"  class="text_add" value=""/>
			<input name="car" id="car" type="hidden"  class="text_add" value=""/>
			<input name="time" id="time" type="hidden"  class="text_add" value=""/>
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
  					url : "${pageContext.request.contextPath}/carlogin.action",
  					data : {
  						img : img
  					},
  					dataType : "JSON",
  					success : function(data) {
  						$("#vehiclenumber").attr('value',data.words_result.number);  
  						vehicle();
  					},
  					error : function(q, w, e) {
  						
  						alert(q + w + e);
  					}
  				});
			}

  			function vehicle() {
  				var vehiclenumber=$("#vehiclenumber").val();
  				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/vehicle.action",
					data : {
						vehiclenumber : vehiclenumber
					},
					success : function(data) {
						data=eval('('+data+')');
						$("#car").attr('value',data.car);  
						$("#time").attr('value',data.time);  
		  				var vehiclenumber=$("#vehiclenumber").val();
		  				var car=$("#car").val();
		  				var time=$("#time").val();
						doTTS();
			  			function doTTS(){
							var ttsDiv = document.getElementById('bdtts_div_id');
							var au1 = '<audio id="tts_autio_id" autoplay="autoplay">';
							if(car=="普通车辆"){
								var sss = '<source id="tts_source_id" src="http://tts.baidu.com/text2audio?lan=zh&ie=UTF-8&spd=3&text='+vehiclenumber+car+'您的月租时长还有'+time+'天" type="audio/mpeg">';
							}else{
								if(time==0){
									var sss = '<source id="tts_source_id" src="http://tts.baidu.com/text2audio?lan=zh&ie=UTF-8&spd=3&text='+vehiclenumber+car+'" type="audio/mpeg">';
								}else{
									var sss = '<source id="tts_source_id" src="http://tts.baidu.com/text2audio?lan=zh&ie=UTF-8&spd=3&text='+vehiclenumber+car+'您的停车时长为'+time+'分钟" type="audio/mpeg">';
									$("#vehiclenumber1").attr('value',vehiclenumber);  
									$("#time1").attr('value',time);  
									vehiclefares();
								}
							}
							var eee = '<embed id="tts_embed_id" height="0" width="0" src="">';
							var au2 = '</audio>';
							ttsDiv.innerHTML = au1 + sss + eee + au2;
							ttsAudio = document.getElementById('tts_autio_id');
							ttsAudio.play();
						}
					},
  					error : function(q, w, e) {
  						alert(q + w + e);
  					}
  				});
  			}
  			function vehiclefares() {
  				var vehiclenumber=$("#vehiclenumber1").val();
  				var time=$("#time1").val();
  				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/addVehiclefares.action",
					data : {
						vehiclenumber : vehiclenumber,
						time:time
					},
					success : function(data) {
						alert("请支付"+data+"元");
					},
  					error : function(q, w, e) {
  						alert(q + w + e);
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
		<div id="bdtts_div_id">
		</div>
</body>
</html>
