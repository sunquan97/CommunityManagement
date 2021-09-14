<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>垃圾分类</title>
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
            <strong>垃圾分类</strong>
        </dt>
        <div id="media">
            <video id="video" width="400" height="400" autoplay style="position: absolute"></video>
            <canvas id="canvas" width="400" height="400" style="position: absolute"></canvas>
        </div>
        <dd>
            <input type="button" onclick="query()" value="识别"
                   class="submit_btn" />
        </dd>
    </dl>
    <script type="text/javascript">
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
                url : "http://api.tianapi.com/txapi/imglajifenlei/index",
                data : {
                    key : "7dcef006b46a8fc296af6b3266cf6a10",
                    img : img
                },
                success : function(data) {
                    if(data.msg=="success"){
                        layer.msg(data.newslist[0].lajitip);
                    }else {
                        layer.msg("识别失败，请重新识别");
                    }

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
            return imgSrc;
        };

    </script>
</form>
</body>
</html>
