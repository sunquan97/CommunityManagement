<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="shortcut icon" href="https://static.guahao.cn/favicon.ico" />

    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/portal.base.min.css?v=162394246787d5d6" type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/portal.basic.min.css?v=162394246787d5d6" type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/portal.hdd.min.css?v=162394246787d5d6" type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/portal.content.min.css?v=162394246787d5d6" type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/style.min.css?v=162394246787d5d6" type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/common/css/animate.min.css?v=20141222" type="text/css"/>


    <script  type="text/javascript">
        $GF = [];

        GreenLine = {};
        // 打点日志全局变量
        GreenLine.Log = {
            url:'https://track.guahao.cn/blank.gif?',
            requestMethod:'GET',
            loginId:'',
            perSessiionId:'1630075975669201780671555',
            shortSessionId:'1630116258047',
            referurl:'',
            userAgent:'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36',
            errorEventName:'portal_pc_js_error',
            token: "",
            monitorLog : false
        }
        // 老的埋点，已废弃，后面统一删除HTML上的埋点
        function _smartlog(link,mod){return true;};
    </script>

</head>
<body class="g-1200px g-page-1200">

<div id="g-wrapper" class="g-wrapper ">

    <div id="gc">
        <div class="gp-search g-container" id="g-cfg" data-page="expert_in" data-module="search"  data-loadpop="remind">
            <div id="g-breadcrumb">
                <a href="https://www.guahao.com" monitor="fastorder_head,fastorder_head,home">首页</a>&gt;
                <a href="https://www.guahao.com/hospital/22/%E6%B1%9F%E8%8B%8F/all/%e4%b8%8d%e9%99%90">江苏</a monitor="fastorder_head,fastorder_head,province">&gt;
                <a href="https://www.guahao.com/hospital/22/%E6%B1%9F%E8%8B%8F/294/%E5%B8%B8%E5%B7%9E" monitor="fastorder_head,fastorder_head,city">常州</a>&gt;
                <a href="https://www.guahao.com/hospital/138681870014210000" monitor="fastorder_head,fastorder_head,hospital" monitor-hosp-id="138681870014210000">常州市武进人民医院</a>&gt;
                <a href="https://www.guahao.com/department/0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" monitor="fastorder_head,fastorder_head,div" monitor-div-id="0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"></a>&gt;
                <span>排班信息</span>
            </div>


            <div class="filter-tip">
                <div class="filter-condition" id="J_SelCondition">
                </div>
                <span class="result-num">找到<strong id="J_ResultNum"> 4 </strong>位医生</span>
            </div>
            <!-- .results -->
            <div class="results">
                <!-- .filter -->
                <div class="filter-new indept-filter J_Filter">
                    <form name="fform" action="https://www.guahao.com/department/shiftcase/0c624b62-3bcb-4bc5-9c1d-13e94aee2824000">
                        <div class="condition-wrap in-condition-wrap">
                            <div class="condition J_dt">
                                <div class="condition-title">医生职称</div>
                                <div class="condition-content condition-collapse J_CT">
                                    <ul>
                                        <li><a href="javascript:void(0);"  class="J_Submit_A" data-code="SXYZ" data-val="主任医师" name="dt" monitor="fastorder_order,fastorder_order,doctor_level">主任医师</a></li>
                                        <li><a href="javascript:void(0);"  class="J_Submit_A" data-code="SXYZ" data-val="副主任医师" name="dt" monitor="fastorder_order,fastorder_order,doctor_level">副主任医师</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="gfm-inline gfm-thin top">
                            <div class="gfm-field date-range J_DateRange" >
                                <label class="date-title">就诊日期：</label>
                                <span class="picker-mask g-datepicker">
                            <input type="text" name="ed" value="不限" class="gfm-input gfm-input-s J_Submit J_DateF" data-code="SXRQF" />
                        </span>
                                <span class="picker-mask g-datepicker">
                            &nbsp;-&nbsp;<input type="text" name="edt" value="不限" class="gfm-input gfm-input-s J_Submit J_DateT" data-code="SXRQT" />
                        </span>
                            </div>
                            <div class="hy-type">
                                <span class="tx"><i></i>特需门诊</span>
                                <span class="zj"><i></i>专家门诊</span>
                                <span class="pt"><i></i>普通门诊</span>
                                <span><i></i>不可约</span>
                            </div>
                        </div>
                        <input type="hidden" name="hdid" value="0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" />
                        <input type="hidden" name="dt" value="all" />
                    </form>
                </div>
                <!-- end of .filter -->

                <!-- .doc-list -->
                <div class="list">
                    <div class="g-doctor-item2 g-clear to-margin">
                        <div class="g-doc-baseinfo g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/138681899598567000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')" class="img">
                                <img src="https://kano.guahao.cn/G8X2621305_image140.jpg" class="img"
                                     alt="张磊"
                                     onerror="this.src='https://static.guahao.cn/img/character/doc-f-l.png?_=20121223';"/>

                            </a>
                            <dl>
                                <dt>
                                    <a href="https://www.guahao.com/expert/138681899598567000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" class="name js-doc"
                                       target="_blank" onmousedown="return _smartlog(this,'DOCN_1')">
                                        <em>张磊</em>
                                    </a>&nbsp;&nbsp;
                                    主任医师
                                </dt>
                                <dd>
                                    <span class="split"></span>
                                    <span class="split">  </span>
                                    <a href="https://www.guahao.com/department/0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                                       onmousedown="return _smartlog(this,'DOCD')"
                                       target="_blank"
                                    >
                                        营养科门诊
                                    </a>
                                </dd>
                            </dl>
                        </div>
                        <div class="skill g-left">
                            <strong>擅长：</strong>
                            危重病、手术、慢性病、肥胖及孕产人群的营养治疗与调理。


                        </div>
                        <div class="num-info g-left">
                            <div class="stars">
                                暂无评分
                            </div>
                            <div class="count">
                                <span class="consult">暂无<br><em>问诊量</em></span>
                                <span>85<br><em>预约量</em></span>
                            </div>
                        </div>
                        <div class="action g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/138681899598567000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-blue"
                            >挂号</a>

                            <a target="_blank" href="https://www.guahao.com/expert/138681899598567000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >问诊</a>
                        </div>
                    </div>
                    <div class="g-doctor-item2 g-clear to-margin">
                        <div class="g-doc-baseinfo g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/138681924758013000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')" class="img">
                                <img src="https://kano.guahao.cn/lGg2608467_image140.jpg" class="img"
                                     alt="於红梅"
                                     onerror="this.src='https://static.guahao.cn/img/character/doc-f-l.png?_=20121223';"/>

                            </a>
                            <dl>
                                <dt>
                                    <a href="https://www.guahao.com/expert/138681924758013000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" class="name js-doc"
                                       target="_blank" onmousedown="return _smartlog(this,'DOCN_1')">
                                        <em>於红梅</em>
                                    </a>&nbsp;&nbsp;
                                    副主任医师
                                </dt>
                                <dd>
                                    <span class="split"></span>
                                    <span class="split">  </span>
                                    <a href="https://www.guahao.com/department/0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                                       onmousedown="return _smartlog(this,'DOCD')"
                                       target="_blank"
                                    >
                                        营养科门诊
                                    </a>
                                </dd>
                            </dl>
                        </div>
                        <div class="skill g-left">
                            <strong>擅长：</strong>
                            各类疾病的营养调理与治疗


                        </div>
                        <div class="num-info g-left">
                            <div class="stars">
                                暂无评分
                            </div>
                            <div class="count">
                                <span class="consult">暂无<br><em>问诊量</em></span>
                                <span>10<br><em>预约量</em></span>
                            </div>
                        </div>
                        <div class="action g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/138681924758013000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-blue"
                            >挂号</a>

                            <a target="_blank" href="https://www.guahao.com/expert/138681924758013000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >问诊</a>
                        </div>
                    </div>
                    <div class="g-doctor-item2 g-clear to-margin">
                        <div class="g-doc-baseinfo g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/5e7f3211-7a0d-47a6-bd9d-cf0386ff4037000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')" class="img">
                                <img src="https://kano.guahao.cn/pYf27810846" class="img"
                                     alt="黄颖琦"
                                     onerror="this.src='https://static.guahao.cn/img/character/doc-unknow-l.png?_=20121223';"/>

                            </a>
                            <dl>
                                <dt>
                                    <a href="https://www.guahao.com/expert/5e7f3211-7a0d-47a6-bd9d-cf0386ff4037000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" class="name js-doc"
                                       target="_blank" onmousedown="return _smartlog(this,'DOCN_1')">
                                        <em>黄颖琦</em>
                                    </a>&nbsp;&nbsp;
                                    副主任医师
                                </dt>
                                <dd>
                                    <span class="split"></span>
                                    <span class="split">  </span>
                                    <a href="https://www.guahao.com/department/0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                                       onmousedown="return _smartlog(this,'DOCD')"
                                       target="_blank"
                                    >
                                        营养科门诊
                                    </a>
                                </dd>
                            </dl>
                        </div>
                        <div class="skill g-left">
                            <strong>擅长：</strong>
                            糖尿病、妊娠期糖尿病、肥胖等内分泌与营养代谢疾病的诊治，婴幼儿及儿童喂养、孕产妇营养指导及健康管理，非药物干预医学营养减重及慢病营养治疗等。


                        </div>
                        <div class="num-info g-left">
                            <div class="stars">
                                暂无评分
                            </div>
                            <div class="count">
                                <span class="consult">暂无<br><em>问诊量</em></span>
                                <span>7<br><em>预约量</em></span>
                            </div>
                        </div>
                        <div class="action g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/5e7f3211-7a0d-47a6-bd9d-cf0386ff4037000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-blue"
                            >挂号</a>

                            <a target="_blank" href="https://www.guahao.com/expert/5e7f3211-7a0d-47a6-bd9d-cf0386ff4037000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >问诊</a>
                        </div>
                    </div>
                    <div class="g-doctor-item2 g-clear to-margin">
                        <div class="g-doc-baseinfo g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/a7f8e467-c0b0-45f9-a3cf-1cdcd0110f8c000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')" class="img">
                                <img src="https://kano.guahao.cn/pYf27810846" class="img"
                                     alt="普通门诊"
                                     onerror="this.src='https://static.guahao.cn/img/character/doc-unknow-l.png?_=20121223';"/>

                            </a>
                            <dl>
                                <dt>
                                    <a href="https://www.guahao.com/expert/a7f8e467-c0b0-45f9-a3cf-1cdcd0110f8c000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" class="name js-doc"
                                       target="_blank" onmousedown="return _smartlog(this,'DOCN_1')">
                                        <em>普通门诊</em>
                                    </a>&nbsp;&nbsp;

                                </dt>
                                <dd>
                                    <span class="split"></span>
                                    <span class="split">  </span>
                                    <a href="https://www.guahao.com/department/0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                                       onmousedown="return _smartlog(this,'DOCD')"
                                       target="_blank"
                                    >
                                        营养科门诊
                                    </a>
                                </dd>
                            </dl>
                        </div>
                        <div class="skill g-left">
                            <strong>擅长：</strong>
                            普通门诊


                        </div>
                        <div class="num-info g-left">
                            <div class="stars">
                                暂无评分
                            </div>
                            <div class="count">
                                <span class="consult">暂无<br><em>问诊量</em></span>
                                <span>暂无<br><em>预约量</em></span>
                            </div>
                        </div>
                        <div class="action g-left">
                            <a target="_blank" href="https://www.guahao.com/expert/a7f8e467-c0b0-45f9-a3cf-1cdcd0110f8c000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >挂号</a>

                            <a target="_blank" href="https://www.guahao.com/expert/a7f8e467-c0b0-45f9-a3cf-1cdcd0110f8c000?hospitalId=138681870014210000&hospDeptId=0c624b62-3bcb-4bc5-9c1d-13e94aee2824000"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >问诊</a>
                        </div>
                    </div>
                </div>
                <!-- end of .doc-list -->
                <div class="clear"></div>


                <div class="clear"></div>
            </div>
            <!-- end of .results -->
        </div>
        <!-- end of .gp-search -->

    </div>


    <div id="gm-bg"></div>
    <div id="gm-mask">
        <div class="gm-box account-ui-v3 user-login-v3 new-login-dialog-v3 g-clear J_LoginDialogV3" id="gm-login">
            <a class="close gm-close" href="javascript:;"></a>
            <div class="g-left">
                <div class="main-box J_MainBox">
                    <div class="nav g-clear">
                        <li class="main-current J_MainTab"><span>登录</span>&nbsp;&nbsp;<i>▪</i>&nbsp;&nbsp;<a href="https://www.guahao.com/register/mobile?target=%2Fdepartment%2Fshiftcase%2F0c624b62-3bcb-4bc5-9c1d-13e94aee2824000">注册</a></li>
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
                                            <li class="icon-line">
                                                <label class="item-icon icon-user"></label>
                                                <input type="text" id="poploginId" name="loginId" class="form-input required" placeholder="手机、邮箱或用户名" maxlength="30" tabindex="1" />
                                            </li>
                                            <li class="icon-line">
                                                <label class="item-icon icon-pwd"></label>
                                                <input type="password" autocomplete="off" disableautocomplete   id="password" class="form-input required" placeholder="密码" maxlength="20" tabindex="2" />
                                                <input type="password" autocomplete="off" disableautocomplete name="password" class="hide" />
                                            </li>

                                            <li class="geeTest J_Valid">
                                                <input type="hidden" value="geetest" id = "J_CaptchaName">
                                                <input type="hidden" id="J_GeeTestValid" value="0">
                                                <div class="J_ImageTest" style="display:none;">
                                                    <input type="text" maxlength="4" autocomplete="off" class=" required code-text" placeholder="验证码" id="validCode" name="validCode" data-validcode="loginmodal" tabindex="3" />
                                                    <a href="javascript:void(0)"  title="换一张" class="captcha">
                                                        <img src="https://www.guahao.com/validcode/genimage/1" />
                                                    </a>
                                                </div>
                                            </li>

                                            <li class="action-bar actionbt">
                                                <a tabindex="4" href="javascript:;" id="loginbtn" class="gbb gbt-green">登&nbsp;录</a>
                                            </li>
                                            <li class="auto-login">
                                                <input type="checkbox" id="autoLogin" name="autologin"><label for="autoLogin">自动登录</label>
                                                <div class="fo-pwd">
                                                    <a href="https://www.guahao.com/forget/index" class="forget-ps" target="_blank">忘记密码？</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="third-login">
                                    <i class="or">或</i>
                                    <div class="qrcode-wrapper">
                                        <img src="https://static.guahao.cn/front/portal-pc-static/img/qr/drain/app-login.jpg">
                                        <span>下载APP</span>
                                    </div>
                                    <div class="qrcode-wrapper secondary">
                                        <img src="https://static.guahao.cn/front/portal-pc-static/img/qr/drain/wechat-subscription.jpg">
                                        <span>关注公众号</span>
                                    </div>
                                    <h5>使用第三方登录平台</h5>
                                    <p class="third-platform J_LoginList">
                                        <a href="https://www.guahao.com/partners/weixin/login" class="icon-weixin J_Social">微信</a>
                                        <a href="https://www.guahao.com/partners/qq/login" class="icon-qq J_Social">QQ</a>
                                        <a href="https://www.guahao.com/partners/sina/fastlogin" class="noMrgR icon-sina J_Social">新浪微博</a>
                                        <a href="https://www.guahao.com/tblogin/tbfastlogin" class="icon-taobao">淘宝</a>
                                        <a href="https://www.guahao.com/alipayFastLogin/getFastLoginInfo" class="icon-alipay J_Social">支付宝</a>
                                    </p>
                                    <div class="go-home">
                                        <a href="https://www.guahao.com">返回首页</a>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-download g-clear J_TabDownload">
                                <div class="qr-inner">
                                    <ul class="g-clear">
                                        <li><img src="https://static.guahao.cn/front/portal-pc-static/img/account/v3/qr-user.png" alt=""><p>下载<a href="https://www.guahao.com/intro/userapp">微医APP</a></p></li>
                                        <li class="wy-qr"><img src="https://static.guahao.cn/front/portal-pc-static/img/account/v3/qr-doctor.png" alt=""><p>下载<a href="https://www.guahao.com/intro/drapp">微医生APP</a></p></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="btn-switch" href="https://doctor.guahao.com/user/login"><i></i><span>医生</span></a>
                </div>
            </div>
        </div>

    </div><script type="text/javascript">
    $GC = {
        debug: false,
        echartServer: '//im-web.guahao.cn',
        isLogined : false,
        guahaoServer : 	'https://www.guahao.com',
        staticServer : 'https://static.guahao.cn',
        imageServer : 'https://h2img.guahao.com',
        kanoServer: 'https://kano.guahao.cn',
        serviceServer : 'https://service.guahao.com',
        eopsServer : 'https://doctor.guahao.com',
        wepayServer : 'https://wepay.guahao.com',
        mobilevalidcodepwd : 'lvxian95169124',
        version:"162394246787d5d6",
        encodeId:"",
        jsCPath:"https://static.guahao.cn" + "/common/js",
        jspath:"https://static.guahao.cn" + "/front/portal-pc-static/js",
        domainEnd:'guahao.com',
        bbsServer: 'https://bbs.guahao.com',
        gatewayServer: 'https://api-gateway.guahao.com',
        cloudcardServer: "https://service-api-finance.guahao.com",
        jkljServer: 'https://health.ljjk.org.cn',
        weiYiH5GuahaoServer: 'https://wy.guahao.com',
        bayAreaServer:'https://dw.guahao.com',
        epayServer: 'https://pay.guahao.com'
    };

    // $GS { Array } - the init parameters for startup
    $GS = [
        $GC.jspath + "/plugins/scout.js?_=162394246787d5d6",
        $GC.jspath + "/plugins/raven.js?_=162394246787d5d6",
        $GC.jsCPath + "/base/jquery-1.8.1.min.js",
        $GC.jspath + "/base/GH.js?_=162394246787d5d6",
        $GC.jsCPath + "/plugins/validator.js?_=20160129",function(){

            // load common module
            GL.load([GH.adaptModule("common")]);

            // load the modules defined in page
            var moduleName = $("#g-cfg").data("module");
            if(moduleName){
                var module = GH.modules[moduleName];
                if(!module) {
                    module = GH.adaptModule(moduleName);
                }
                if(module) {
                    GL.load([module]);
                }
            }

            if($GU.isIE6()){
                GL.load([$GC.jspath + "/hack/ie6.js"]);
            }
        }];
</script>
    <script type="text/javascript" src="https://static.guahao.cn/front/portal-pc-static/js/base/GL.js?_=162394246787d5d6" ></script>
    <script>
        //同盾token 发送
        (function() {
            _fmOpt = {
                partner: 'weiyi',
                appName: 'weiyi_web',
                token: "weiyi-" + new Date().getTime() + '-' + Math.random().toString(16),
                fmb: true,
                getinfo: function() {
                    return "e3Y6ICIyLjUuMCIsIG9zOiAid2ViIiwgczogMTk5LCBlOiAianMgbm90IGRvd25sb2FkIn0=";
                }
            };
            var cimg = new Image(1,1);
            cimg.onload = function() {
                _fmOpt.imgLoaded = true;
            };
            cimg.src = "https://fp.fraudmetrix.cn/fp/clear.png?partnerCode=weiyi&appName=weiyi_web&tokenId=" + _fmOpt.token;
            var fm = document.createElement('script'); fm.type = 'text/javascript'; fm.async = true;
            fm.src = '//static.fraudmetrix.cn/v2/fm.js?ver=0.1&t=' + (new Date().getTime()/3600000).toFixed(0);
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(fm, s);
            setTimeout(function () {
                var fmCode = _fmOpt.getinfo();
                if (fmCode.length <= 256) {
                    setCookie('_fm_code', _fmOpt.getinfo())
                };
            }, 1200);
            function setCookie (name, val) {
                var expires = '; expires=' + new Date(new Date().getTime() + 30 * 24 * 3600 * 1000).toUTCString()
                document.cookie = [name, '=', encodeURIComponent(val), expires, "; secure", '; path=/'].join('')
            }
        })();
    </script>

    <script>
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https'){
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else{
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    </script>
    <div class="hide">
        <script type="text/javascript">

            (function() {

                // baidu
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?3a79c3f192d291eafbe9735053af3f82";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </div>
</body>
</html>