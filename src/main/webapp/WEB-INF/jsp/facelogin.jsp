<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人脸识别登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style1.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/tracking-min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/face-min.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
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
	width: 400px;
	height: 400px;
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
		<dl class="admin_login" style="height: auto;">
			<dt>
				<strong>人脸识别登录</strong>
			</dt>
			<div id="media">
				<video id="video" width="400" height="400" autoplay style="position: absolute"></video>
				<canvas id="canvas" width="400" height="400" style="position: absolute"></canvas>
			</div>
			<dd>
				<input type="button" onclick="javascript:history.go(-1)" value="返回"
					class="submit_btn" />
			</dd>
		</dl>
		<script type="text/javascript">
			var video = document.getElementById('video');
			var canvas = document.getElementById('canvas');
			var context = canvas.getContext('2d');
			var tracker = new tracking.ObjectTracker('face');
			var count = 0;
			tracker.setInitialScale(4);
			tracker.setStepSize(2);
			tracker.setEdgesDensity(0.1);

			tracking.track('#video', tracker, { camera: true });
			tracker.on('track', function(event) {
				if (event.data.length != 0&&count==0) {
					//把流媒体数据画到convas画布上去
					context.drawImage(video,0,0,300,300);
					//获取图像
					var img = getBase64();
					//Ajax将Base64字符串传输到后台处理
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/search",
						data : {
							img : img
						},
						dataType : "JSON",
						success : function(data) {
							//取出对比结果的返回分数，如果分数90以上就判断识别成功了
							if(parseInt(data.result.user_list[0].score) > 80) {
								//关闭摄像头
								video.srcObject.getTracks()[0].stop();
								//提醒用户识别成功
								//验证成功跳转页面
								window.setTimeout(function() {
									layer.msg('登陆成功');
									window.location.href="${pageContext.request.contextPath}/faceLogin.action?username="+data.result.user_list[0].user_id+"";
								},1000)
							}else{
								layer.msg('您的人脸信息未注册，无法人脸识别登录');
								count=0;
							}
						},
						error : function() {
							alert("图像模糊，请重新拍照！");
						}
					});
					count=1;
				} else {
					event.data.forEach(function(rect) {

					});

				}
				context.clearRect(0, 0, canvas.width, canvas.height);
				event.data.forEach(function(rect) {
					context.strokeStyle = '#a64ceb';
					context.strokeRect(rect.x, rect.y, rect.width, rect.height);
					context.font = '11px Helvetica';
					context.fillStyle = "#fff";
					context.fillText('x: ' + rect.x + 'px', rect.x + rect.width + 5, rect.y + 11);
					context.fillText('y: ' + rect.y + 'px', rect.x + rect.width + 5, rect.y + 22);
				});
			});
			function getBase64() {
				//获取当前图像并转换为Base64的字符串
				var imgSrc = canvas.toDataURL("image/png");
				//截取字符串
				return imgSrc.substring(22);
			};

			window.setInterval(function() {
				count=0;
			},3000)
		</script>
	</form>
</body>
</html>
