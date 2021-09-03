<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap-touch-slider.css"  media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/owl.theme.default.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
    <!--分页-->
    <script src="${pageContext.request.contextPath }/static/js/jquery.pagination.js"></script>
    <!--日期插件-->
    <script src="${pageContext.request.contextPath }/static/js/layui.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/laydate.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.touchSwipe.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap-touch-slider.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/wow.min.js"></script>
</head>

<body>

<div class="header">
    <div class="container">
        <div class="jw-logo"> <img src="${pageContext.request.contextPath }/static/images/logo2.png" alt="" onClick="location.href=/housekeepingService";/>
        </div>
        <div class="header-right">
            <ul class="header-nav">
                <li class="nav-list active"><a href="${pageContext.request.contextPath }/housekeepingService">首页</a></li>

                <li class="nav-list"><a href="${pageContext.request.contextPath }/nanny">保姆</a></li>

                <li class="nav-list"><a href="${pageContext.request.contextPath }/maternityMatron">月嫂</a></li>

                <li class="nav-list "><a href="${pageContext.request.contextPath }/hourlyWorker">临时钟点工</a></li>

                <li class="nav-list"><a href="${pageContext.request.contextPath }/longTermHourlyWork">长期钟点工</a></li>

                <li class="nav-list">

                    <a href="javascript:void(0)" class="nav-more">更多服务<span class="fa fa-angle-down"></span></a>

                    <ol class="hide-nav">

                        <li><a href="${pageContext.request.contextPath }/householdApplianceClean">家电清洗</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">干洗</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">搬家</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">护工</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">居家保养</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">皮具护理</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">居家便民</a></li>

                        <li><a href="${pageContext.request.contextPath }/noData">家电维修</a></li>

                    </ol>

                </li>

            </ul>
            <div class="drop-menu"> <span class="fa fa-navicon"></span> </div>
        </div>
    </div>
</div>
<div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="5000" >

    <!-- Indicators -->

    <ol class="carousel-indicators">
        <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
        <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
        <li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper For Slides -->

    <div class="carousel-inner" role="listbox">
        <div class="item active"> <img src="${pageContext.request.contextPath }/static/images/banner1.png" alt="Bootstrap Touch Slider"  class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="slide-text slide_style_center">
                        <h1 data-animation="animated zoomInRight">您的家庭好帮手</h1>
                        <p data-animation="animated fadeInLeft">家务事交给我们，您的时间值得更多..</p>
                        <a href="changqi.html" class="btn btn-default" data-animation="animated fadeInLeft">点击查看</a> <a href="order.html"   class="btn btn-primary" data-animation="animated fadeInRight">立即预约</a> </div>
                </div>
            </div>
        </div>
        <div class="item"> <img src="${pageContext.request.contextPath }/static/images/banner2.png" alt="Bootstrap Touch Slider"  class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="slide-text slide_style_center">
                <h1 data-animation="animated flipInX">悠然的家庭生活</h1>
                <p data-animation="animated lightSpeedIn">金网家政全心全心为你提供</p>
                <a href="changqi.html" class="btn btn-default" data-animation="animated fadeInUp">点击查看</a> <a href="order.html"  class="btn btn-primary" data-animation="animated fadeInDown">立即预约</a> </div>
        </div>
        <div class="item"> <img src="${pageContext.request.contextPath }/static/images/banner3.png" alt="Bootstrap Touch Slider"  class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="slide-text slide_style_center">
                <h1 data-animation="animated zoomInLeft">净美环境　愉悦办公</h1>
                <p data-animation="animated fadeInRight">某某家政企业服务　服务好助手</p>
                <a href="changqi.html"  class="btn btn-default" data-animation="animated fadeInLeft">点击查看</a> <a href="order.html"  class="btn btn-primary" data-animation="animated fadeInRight">立即预约</a> </div>
        </div>
    </div>

    <!-- Left Control -->

    <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev"> <span class="fa fa-angle-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>

    <!-- Right Control -->

    <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next"> <span class="fa fa-angle-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
<div class="safe">
    <div class="container">
        <div class="section-heading">
            <div class="section-title">服务保障</div>
            <div class="section-subtitle">通过某某家政的安全保障、品质保障、风险保障三重保障机制，让您无后顾之忧！</div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 wow fadeInDown">
                <article>
                    <div class="safe-item">
                        <div class="wrap-safe-icon">
                            <div class="safe-icon"> <span class="fa fa-shield"></span> </div>
                        </div>
                        <div class="title">安全保障</div>
                        <div class="text">家政人员身份经过实名认证审核，上门服务家政险保障护航</div>
                    </div>
                </article>
            </div>
            <div class="col-md-3 col-sm-6 wow bounceInLeft">
                <article>
                    <div class="safe-item">
                        <div class="wrap-safe-icon">
                            <div class="safe-icon"> <span class="fa  fa-leaf"></span> </div>
                        </div>
                        <div class="title">风险保障</div>
                        <div class="text">全面的家政综合险保障三方的权益，轻松解决您的支付困扰</div>
                    </div>
                </article>
            </div>
            <div class="col-md-3 col-sm-6 wow bounceIn">
                <article>
                    <div class="safe-item">
                        <div class="wrap-safe-icon">
                            <div class="safe-icon"> <span class="fa fa-thumbs-o-up"></span> </div>
                        </div>
                        <div class="title">品质保障</div>
                        <div class="text">家政人员经过了严格的筛选、择优录取；专业工具、标准化流程</div>
                    </div>
                </article>
            </div>
            <div class="col-md-3 col-sm-6 wow bounceIn">
                <article>
                    <div class="safe-item">
                        <div class="wrap-safe-icon">
                            <div class="safe-icon"> <span class="fa fa-flash"></span> </div>
                        </div>
                        <div class="title">闪电匹配</div>
                        <div class="text">快速精准找到适合的家政人员,个性化需求智匹配，无需现金，轻松支付</div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</div>
<div id="type">
    <div class="container">
        <div class="section-heading">
            <div class="section-title">服务类型</div>
            <div class="section-subtitle">全方位的家庭服务，一键下单，尽享清闲生活！</div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-sm-7">
                <ul class="type-icon">
                    <li> <a href="baomu.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/baomu.png" alt=""/>
                        <p>保姆</p>
                    </a> </li>
                    <li> <a href="yuesao.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/yuesao.png" alt=""/>
                        <p>月嫂</p>
                    </a> </li>
                    <li> <a href="linshi.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/duanzhong.png" alt=""/>
                        <p>临时钟点工</p>
                    </a> </li>
                    <li> <a href="changqi.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/changzhong.png" alt=""/>
                        <p>长期钟点工</p>
                    </a> </li>
                    <li> <a href="jiadian.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/qingxi.png" alt=""/>
                        <p>家电清洗</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/hugong.png" alt=""/>
                        <p>护工</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/jiaju.png" alt=""/>
                        <p>居家保养</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/weixiu.png" alt=""/>
                        <p>家电维修</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/banjia.png" alt=""/>
                        <p>搬家</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/ganxi.png" alt=""/>
                        <p>干洗</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/piju.png" alt=""/>
                        <p>皮具护理</p>
                    </a> </li>
                    <li> <a href="no_date.html" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/jujia.png" alt=""/>
                        <p>居家便民</p>
                    </a> </li>
                </ul>
            </div>
            <div class="col-md-5 col-sm-5">
                <div class="type-item">
                    <div class="title">1、选择您的需求</div>
                    <div class="text">某某家政人性化设置，让您可以快速下单，也可精准筛选下单</div>
                </div>
                <div class="type-item">
                    <div class="title">2、选择家政人员</div>
                    <div class="text">通过平台精准筛选出的家政人员里，挑选觉得适合您的家政人员</div>
                </div>
                <div class="type-item">
                    <div class="title">3、坐等上门服务</div>
                    <div class="text">预约完成后，您只需在家中等候您满意的家政人员进行家政服务</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $('#bootstrap-touch-slider').bsTouchSlider();<!--轮播-->

    new WOW().init();<!--动画延迟加载-->

</script>
<script>

    $(".search-input li").hide().first().show();

    $(".filter-tab").hide().first().show();

    $(document).ready(function(e) {

        $(".nav-more").click(function(){

            $(".hide-nav").slideToggle();

        });

        $(".drop-menu").click(function(){

            $(".header-nav").slideToggle();

        });

        $(".three li").click(function(){

            $(this).addClass("current").siblings().removeClass("current");

            $(".search-input li").hide().eq($(this).index()).show();

        });

        $(".filter-wrap span").click(function(){

            $(this).addClass("active").siblings().removeClass("active");

            $(".filter-tab").hide().eq($(this).index()).show();

        });

        //返回顶部

        $(".top-item").click(function(){

            $('body,html').animate({ scrollTop: 0 }, 500);

            return false;

        });

        $(".phone-refer").click(function(){

            $(".public-dom").css("display","block");

        });

        $(".close-alert,.cancel").click(function(){

            $(".public-dom").fadeOut('fast');

        });

    });

</script>
<script>

    <!--套餐滚动-->

    $(document).ready(function(){

        $('.owl-carousel').owlCarousel({

            loop:true,

            margin:10,

            nav:true,

            navigation:true,

            responsive:{

                0:{

                    items:1

                },

                600:{

                    items:3

                },

                1000:{

                    items:5

                }

            }

        });

    });

</script>
</body>
</html>
