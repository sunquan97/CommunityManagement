<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<html>

<head>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style3.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css">

    <!--导航处城市切换插件-->

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/cityPicker.css">

    <!--下拉处城市切换插件-->

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/city-picker.css">

    <!--分页-->

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/pagination.css" />

    <!--lay组件-->

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/layui.css">

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>

    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>

    <!--分页-->

    <script src="${pageContext.request.contextPath }/static/js/jquery.pagination.js"></script>

    <!--日期插件-->

    <script src="${pageContext.request.contextPath }/static/js/layui.js"></script>

    <script src="${pageContext.request.contextPath }/static/js/laydate.js"></script>

</head>



<body>

<div class="header">

    <div class="">

        <div class="header-left">

            <ul class="header-nav">
                <li class="nav-list"><a href="${pageContext.request.contextPath }/housekeepingService">首页</a></li>

                <li class="nav-list"><a href="${pageContext.request.contextPath }/nanny">保姆</a></li>

                <li class="nav-list active"><a href="${pageContext.request.contextPath }/maternityMatron">月嫂</a></li>

                <li class="nav-list"><a href="${pageContext.request.contextPath }/hourlyWorker">临时钟点工</a></li>

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

            <div class="drop-menu">

                <span class="fa fa-navicon"></span>

            </div>

        </div>

    </div>

</div>

<div class="section-banner">

    <img style="width: max-content;height: 400px" src="${pageContext.request.contextPath }/static/images/yuesao_bj.jpg" alt=""/>

</div>

<div class="section-mian">

    <div class="container">
        <h4>以下数据更新于48小时前，如有变动请以客服为准。谢谢！</h4>
        <div class="person-info">

            <ul class="person-list">

                <li class="person-item col-md-4" style=" float:left">

                    <a href="book_info.html" class="person-link">

                        <img src="${pageContext.request.contextPath }/static/images/linshi_1.jpg" alt=""/>

                        <dl>

                            <dt class="user-name">高宝兰</dt>

                            <dd>薪资：3000元/月</dd>

                            <dd class="state">状态：忙碌</dd>

                            <dd>等级：1</dd>

                            <dd>好评率：0%</dd>

                            <dd>年龄：48岁</dd>

                            <dd>籍贯：福建</dd>

                            <dd>工作经验：2年</dd>

                            <dd>信用值：300</dd>

                            <dd class="last-child">能力：做家务、照顾能自理的老人</dd>

                        </dl>

                    </a>

                </li>

                <li class="person-item col-md-4" style=" float:left">

                    <a href="book_info.html" class="person-link">

                        <img src="${pageContext.request.contextPath }/static/images/linshi_2.jpg" alt=""/>

                        <dl>

                            <dt class="user-name">向俊芝</dt>

                            <dd>薪资：3000元/月</dd>

                            <dd class="state">状态：空闲</dd>

                            <dd>等级：1</dd>

                            <dd>好评率：0%</dd>

                            <dd>年龄：48岁</dd>

                            <dd>籍贯：福建</dd>

                            <dd>工作经验：2年</dd>

                            <dd>信用值：300</dd>

                            <dd class="last-child">能力：做家务、照顾能自理的老人</dd>

                        </dl>

                    </a>

                </li>

                <li class="person-item col-md-4" style=" float:left">

                    <a href="book_info.html" class="person-link">

                        <img src="${pageContext.request.contextPath }/static/images/linshi_3.jpg" alt=""/>

                        <dl>

                            <dt class="user-name">温秋香</dt>

                            <dd>薪资：3000元/月</dd>

                            <dd class="state">状态：工作中</dd>

                            <dd>等级：1</dd>

                            <dd>好评率：0%</dd>

                            <dd>年龄：48岁</dd>

                            <dd>籍贯：福建</dd>

                            <dd>工作经验：2年</dd>

                            <dd>信用值：300</dd>

                            <dd class="last-child">能力：做家务、照顾能自理的老人</dd>

                        </dl>

                    </a>

                </li>

                <div class="clearfix"></div>

            </ul>

        </div>

        <div class="center-box">

            <div class="M-box2"></div>

        </div>

    </div>

</div>


<script>

    $(".search-input li").hide().first().show();

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

        //返回顶部

        $(".top-item").click(function(){

            $('body,html').animate({ scrollTop: 0 }, 500);

            return false;

        });

    });

</script>

<script>

    $(function(){

        $('.M-box').pagination({

            callback:function(api){

                $('.now').text(api.getCurrent());

            }

        },function(api){

            $('.now').text(api.getCurrent());

        });



        $('.M-box2').pagination({

            coping:true,

            homePage:'首页',

            endPage:'末页',

            prevContent:'上页',

            nextContent:'下页'

        });

    });

</script>

<!--	<script>

	layui.use('laydate', function(){

 	 var laydate = layui.laydate;

	</script>-->

</body>

</html>

