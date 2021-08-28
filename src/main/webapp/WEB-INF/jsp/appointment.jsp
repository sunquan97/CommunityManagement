<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="shortcut icon" href="https://static.guahao.cn/favicon.ico"/>
    <link rel="stylesheet"
          href="https://static.guahao.cn/front/portal-pc-static/css/portal.base.min.css?v=162394246787d5d6"
          type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/fastorder.css?v=162394246787d5d6"
          type="text/css"/>
    <script src="static/js/jquery-3.2.1.min.js"></script>
</head>
<body class="g-1200px g-page-1200">
<div id="g-wrapper" class="g-wrapper ">
    <div id="gc">
        <div class="gp-fastorder" id="g-cfg">
            <div class="g-container">
                <div class="fastorder-wrap">
                    <div class="fastorder-left">
                        <div class="hd"><h3 class="hd-title">预约挂号</h3>
                            <p class="hd-sub-title">帮助普通患者快速找到选定条件下可预约的专家</p>
                            <p class="hd-tip">(目前只支持<em>部分</em>医院)</p></div>
                        <div class="bd">
                            <div class="bd-item bd-fast-filter"><p class="title">快速筛选</p>
                                <p>根据区域、医院、科室快速筛选对应班次</p></div>
                            <div class="bd-item bd-fit-people"><p class="title">适用人群</p>
                                <p>未确定具体病症，希望尽快就医确诊的普通患者</p></div>
                        </div>
                        <div class="fastorder-ads">
                            <div class="hide" id="J_AdsBox"></div>
                        </div>
                    </div>
                    <div class="fastorder-main"><input type="hidden" name="jklj" value="0"/>
                        <div class="tips">温馨提醒：费用由医院自行设定，平台不收取任何额外费用</div>
                        <div class="g-fastorder-box">
                            <div class="row g-clear"><label>地区：</label><select id="province" class="province js-province"
                                                                               name="province">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>&nbsp;</label><select id="city" class="city js-city disabled"
                                                                               disabled="disabled" name="city">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>医院：</label><select id="hospital" class="js-hospital disabled"
                                                                               disabled="disabled" name="hospital">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>科室：</label><select id="department" class="js-dept disabled"
                                                                               disabled="disabled" name="hdid">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="gfm-actions"><a href="javascript:;" class="gbn gbt-green js-btn"
                                                        monitor="fastorder,fastorder,fast_order">预约挂号</a></div>
                            <div class="footer-msg"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="gm-bg"></div>
    <div id="gm-mask">
        <div class="gm-box account-ui-v3 user-login-v3 new-login-dialog-v3 g-clear J_LoginDialogV3" id="gm-login"><a
                class="close gm-close" href="javascript:;"></a>
            <div class="g-left">
                <div class="main-box J_MainBox">
                    <div class="nav g-clear">
                        <li class="main-current J_MainTab"><span>登录</span>&nbsp;&nbsp;<i>▪</i>&nbsp;&nbsp;<a
                                href="https://www.guahao.com/register/mobile?target=%2Fexpert%2Ffastorder">注册</a></li>
                        <li class="download-normal">扫一扫</li>
                    </div>
                    <div class="tab-list ">
                        <div class="tab-listcon J_TabList">
                            <div class="tab-main g-clear J_TabMain">
                                <div class="form-container">
                                    <form action="/user/login_a">
                                        <div class="lg-tips tips-error hide"></div>
                                        <div class="lg-tips tips-succ hide"></div>
                                        <ul>
                                            <li class="icon-line"><label class="item-icon icon-user"></label><input
                                                    type="text" id="poploginId" name="loginId"
                                                    class="form-input required" placeholder="手机、邮箱或用户名" maxlength="30"
                                                    tabindex="1"/></li>
                                            <li class="icon-line"><label class="item-icon icon-pwd"></label><input
                                                    type="password" autocomplete="off" disableautocomplete id="password"
                                                    class="form-input required" placeholder="密码" maxlength="20"
                                                    tabindex="2"/><input type="password" autocomplete="off"
                                                                         disableautocomplete name="password"
                                                                         class="hide"/></li>
                                            <li class="geeTest J_Valid"><input type="hidden" value="geetest"
                                                                               id="J_CaptchaName"><input type="hidden"
                                                                                                         id="J_GeeTestValid"
                                                                                                         value="0">
                                                <div class="J_ImageTest" style="display:none;"><input type="text"
                                                                                                      maxlength="4"
                                                                                                      autocomplete="off"
                                                                                                      class=" required code-text"
                                                                                                      placeholder="验证码"
                                                                                                      id="validCode"
                                                                                                      name="validCode"
                                                                                                      data-validcode="loginmodal"
                                                                                                      tabindex="3"/><a
                                                        href="javascript:void(0)" title="换一张" class="captcha"><img
                                                        src="https://www.guahao.com/validcode/genimage/1"/></a></div>
                                            </li>
                                            <li class="action-bar actionbt"><a tabindex="4" href="javascript:;"
                                                                               id="loginbtn" class="gbb gbt-green">登&nbsp;录</a>
                                            </li>
                                            <li class="auto-login"><input type="checkbox" id="autoLogin"
                                                                          name="autologin"><label
                                                    for="autoLogin">自动登录</label>
                                                <div class="fo-pwd"><a href="https://www.guahao.com/forget/index"
                                                                       class="forget-ps" target="_blank">忘记密码？</a></div>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="third-login"><i class="or">或</i>
                                    <div class="qrcode-wrapper"><img
                                            src="https://static.guahao.cn/front/portal-pc-static/img/qr/drain/app-login.jpg"><span>下载APP</span>
                                    </div>
                                    <div class="qrcode-wrapper secondary"><img
                                            src="https://static.guahao.cn/front/portal-pc-static/img/qr/drain/wechat-subscription.jpg"><span>关注公众号</span>
                                    </div>
                                    <h5>使用第三方登录平台</h5>
                                    <p class="third-platform J_LoginList"><a
                                            href="https://www.guahao.com/partners/weixin/login"
                                            class="icon-weixin J_Social">微信</a><a
                                            href="https://www.guahao.com/partners/qq/login"
                                            class="icon-qq J_Social">QQ</a><a
                                            href="https://www.guahao.com/partners/sina/fastlogin"
                                            class="noMrgR icon-sina J_Social">新浪微博</a><a
                                            href="https://www.guahao.com/tblogin/tbfastlogin" class="icon-taobao">淘宝</a><a
                                            href="https://www.guahao.com/alipayFastLogin/getFastLoginInfo"
                                            class="icon-alipay J_Social">支付宝</a></p>
                                    <div class="go-home"><a href="https://www.guahao.com">返回首页</a></div>
                                </div>
                            </div>
                            <div class="tab-download g-clear J_TabDownload">
                                <div class="qr-inner">
                                    <ul class="g-clear">
                                        <li><img
                                                src="https://static.guahao.cn/front/portal-pc-static/img/account/v3/qr-user.png"
                                                alt="">
                                            <p>下载<a href="https://www.guahao.com/intro/userapp">微医APP</a></p></li>
                                        <li class="wy-qr"><img
                                                src="https://static.guahao.cn/front/portal-pc-static/img/account/v3/qr-doctor.png"
                                                alt="">
                                            <p>下载<a href="https://www.guahao.com/intro/drapp">微医生APP</a></p></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="btn-switch" href="https://doctor.guahao.com/user/login"><i></i><span>医生</span></a></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        getProvince();

    });
    $("#hospital").change(function(){
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getDepartment";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                $("#department").empty();
                $('#department').removeAttr("disabled");
                var option1="<option value=''>请选择...</option>";
                $("#department").append(option1);
                var departmentList=result.data;
                for(var i=0;i<departmentList.length;i++) {
                    var id = departmentList[i].id;
                    var departName = departmentList[i].departName;
                    var flag = departmentList[i].flag;
                    if (flag == 0) {
                        var option = "<optgroup label=" + departName + " style='font-family;'> </optgroup>";
                        $("#department").append(option);
                    } else {
                        var option = "<option value=" + id + ">" + departName + "</option>";
                        $("#department").append(option);
                    }
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    });

    $("#city").change(function(){
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getHospital";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                $("#hospital").empty();
                $("#department").empty();
                $('#hospital').removeAttr("disabled");
                var option1="<option value=''>请选择...</option>";
                $("#hospital").append(option1);
                $("#department").append(option1);
                var hospitalList=result.data;
                for(var i=0;i<hospitalList.length;i++){
                    var id=hospitalList[i].id;
                    var name=hospitalList[i].name;
                    var option="<option value="+id+">"+name+"</option>";
                    $("#hospital").append(option);
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    });

    function getProvince() {
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getProvinces";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                var provincesList=result.data;
                for(var i=0;i<provincesList.length;i++){
                    var id=provincesList[i].id;
                    var provinceName=provincesList[i].codeValue;
                    var option="<option value="+id+">"+provinceName+"</option>";
                    $("#province").append(option);
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
    $(function () {
        $("#province").change(function(){
            var id=$("#province").val();
            var newData = "{'id':'" + id + "'}";
            var url = "${pageContext.request.contextPath }/appointment/getCitys";
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                url: url,
                data: newData,
                success: function (result) {
                    $("#city").empty();
                    $("#hospital").empty();
                    $("#department").empty();
                    $('#city').removeAttr("disabled");
                    var option1="<option value=''>请选择...</option>";
                    $("#city").append(option1);
                    $("#hospital").append(option1);
                    $("#department").append(option1);
                    var citysList=result.data;
                    for(var i=0;i<citysList.length;i++){
                        var cityId=citysList[i].id;
                        var cityName=citysList[i].codeValue;
                        var option="<option value="+cityId+">"+cityName+"</option>";
                        $("#city").append(option);
                    }
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        });
    });

</script>
</body>
</html>