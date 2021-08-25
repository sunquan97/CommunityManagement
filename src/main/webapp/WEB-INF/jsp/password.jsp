<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>忘记密码</title>
    <link type="text/css" rel="stylesheet" href="static/css/password.css" />
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var height=$(document).height();
            $('.main').css('height',height);
        })
    </script>
</head>

<body>
<div class="main">
    <div class="main0">
        <div class="formBox">
            <h3>登录密码重置</h3>
            <ul>
                <li class="mainCol firLi">&gt;身份验证</li>
                <li>&gt;登录密码重置</li>
                <li class="lastLi">&gt;重置完成</li>
            </ul>
            <img src="static/images/login/line.png" />
            <div class="itembox">
                <label>手机号码&nbsp;:</label>
                <input type="text" placeholder="请输入注册手机号"></span>
            </div>
            <div class="btnBox">
                <button onclick="window.location.href='password_2.html'">下一步</button>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="footer0">
        <div class="footer_l">使用条款 | 隐私保护</div>
        <div class="footer_r">© 2020</div>
    </div>
</div>
</body>
</html>