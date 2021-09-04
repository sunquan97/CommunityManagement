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
                    <li> <a href="${pageContext.request.contextPath }/nanny" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/baomu.png" alt=""/>
                        <p>保姆</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/maternityMatron" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/yuesao.png" alt=""/>
                        <p>月嫂</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/hourlyWorker" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/duanzhong.png" alt=""/>
                        <p>临时钟点工</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/longTermHourlyWork" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/changzhong.png" alt=""/>
                        <p>长期钟点工</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/householdApplianceClean" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/qingxi.png" alt=""/>
                        <p>家电清洗</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/hugong.png" alt=""/>
                        <p>护工</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/jiaju.png" alt=""/>
                        <p>居家保养</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/weixiu.png" alt=""/>
                        <p>家电维修</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/banjia.png" alt=""/>
                        <p>搬家</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/ganxi.png" alt=""/>
                        <p>干洗</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/piju.png" alt=""/>
                        <p>皮具护理</p>
                    </a> </li>
                    <li> <a href="${pageContext.request.contextPath }/noData" class="icon-links"> <img src="${pageContext.request.contextPath }/static/images/jujia.png" alt=""/>
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
