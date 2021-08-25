<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/home.css">
    <link href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
    <link href="${pageContext.request.contextPath }/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/viewNoticePage.js"></script>
    <script type="text/javascript"> window.jQuery || document.write("<script src='${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js'>" + "<" + "/script>");</script>
    <script type="text/javascript"> if ("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");</script>
    <script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <title></title>
    <style type="text/css"> #footer {
        height: 40px;
        line-height: 40px;
        position: fixed;
        bottom: 0;
        width: 100%;
        text-align: center;
        background: #333;
        color: #fff;
        font-family: Arial;
        font-size: 13px;
        letter-spacing: 1px;</style>
</head>
<body>
<div class="page-content clearfix">
    <div class="state-overview clearfix">
        <div class="col-lg-3 col-sm-3">
            <section class="panel">
                <div class="symbol terques"><i class="icon-user"></i></div>
                <div class="value"><h1 id="userSum"></h1>
                    <p>社区居民</p></div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-3">
            <section class="panel">
                <div class="symbol yellow"><i class="icon-user"></i></div>
                <div class="value"><h1 id="securitySum"></h1>
                    <p>安保人员</p></div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-3">
            <section class="panel">
                <div class="symbol blue"><i class="icon-bar-chart"></i></div>
                <div class="value"><h1 id="noticeSum"></h1>
                    <p>公告数</p></div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-3">
            <iframe width="400" height="100" frameborder="0" scrolling="no" hspace="0"
                    src="https://i.tianqi.com/?c=code&a=getcode&id=35&site=34&icon=1"></iframe>
        </div>
    </div>
</div>
<div class="page-content clearfix" style="width:60%;float:left;">
    <div id="myCarousel" class="carousel" data-ride="carousel" style="margin-top: 20px"><!--图片的容器-->
        <div class="carousel-inner">
            <div class="item active"><img style="width: 850px;height: 400px"
                                          src="${pageContext.request.contextPath }/static/images/propaganda/51miz.jpg"/>
            </div>
            <div class="item"><img style="width: 850px;height: 400px"
                                   src="${pageContext.request.contextPath }/static/images/propaganda/gtimg.jpg"/></div>
            <div class="item"><img style="width: 850px;height: 400px"
                                   src="${pageContext.request.contextPath }/static/images/propaganda/yuncs.jpg"/></div>
        </div><!--圆圈指示符-->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol><!--左右的按钮--><a href="#myCarousel" class="left carousel-control" data-slide="prev"><span
                class="glyphicon glyphicon-chevron-left"></span></a><a href="#myCarousel" class="right carousel-control"
                                                                       data-slide="next"><span
                class="glyphicon glyphicon-chevron-right"></span></a></div>
</div>
<div class="page-content clearfix" style="width:40%;float:left;">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style"><!---->
            <div class="table_menu_list">
                <div class="ydc-loading-box">
                    <div class="ydc-tabPanel">
                        <div>
                            <ul>
                                <li class="hit"><h3 style="margin-top:10px;">公告栏</h3></li>
                                <c:choose><c:when test="${ sessionScope.user.userroleid == 2}">
                                    <li>
                                        <button class="btn" onclick="javascript:window.location.href='/release';"><i
                                                class="ydc-icon-shu"></i><span>发布公告</span></button>
                                    </li>
                                </c:when></c:choose></ul>
                        </div>
                        <div class="ydc-panes">
                            <div class="ydc-pane" style="display:block;"><c:forEach items="${notices }" var="notice">
                                <ol class="ydc-pane-list">
                                    <li><h4><a
                                            href="${pageContext.request.contextPath }/page.action?noticeid=${notice.noticeid }"
                                            target="_blank">${notice.noticename }<i>new</i></a><span><fmt:formatDate
                                            value="${notice.createtime}" pattern="yyyy-MM-dd"/></span></h4></li>
                                </ol>
                            </c:forEach>
                                <ol class="ydc-pane-list">
                                    <li><span
                                            style="float: left;margin-left: 10px">共${page.pageCount}页/当前第${page.currentPage}页/共${page.recordCount }条记录</span>
                                    </li>
                                </ol>
                                <ol style="width: 100%;height: 45px;">
                                    <div class="ydc-pagination" style="width: 100%;"><input type="hidden"
                                                                                            value="${page.currentPage}"
                                                                                            id="currentPage"><input
                                            type="hidden" value="${pageContext.request.contextPath }" id="url"><input
                                            type="hidden" value="${page.pageCount }" id="pageCount">
                                        <ol style="width: 100%;">
                                            <li class="ydc-previous-item">
                                                <button id="first" class="ydc-previous-item-btn-medium "><span>首页</span>
                                                </button>
                                            </li>
                                            <li class="ydc-previous-item">
                                                <button id="prev" class="ydc-previous-item-btn-medium "><span>上一页</span>
                                                </button>
                                            </li>
                                            <li class="ydc-previous-item">
                                                <button id="next" class="ydc-previous-item-btn-medium"><span>下一页</span>
                                                </button>
                                            </li>
                                            <li class="ydc-previous-item">
                                                <div class="ydc-item-quick-kun"><input type="number" id="viPage"
                                                                                       aria-invalid="false" class="">
                                                </div>
                                                <button id="transfer" style="margin-left:5px;"
                                                        class="ydc-previous-item-btn-medium"><span>跳转</span></button>
                                            </li>
                                        </ol>
                                    </div>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="page-content clearfix" style="width:50%;float:left;">--%><%--    <div id="Member_Ratings">--%><%--        <div class="d_Confirm_Order_style"><!---->--%><%--            <div class="table_menu_list">--%><%--                <div class="ydc-loading-box">--%><%--                    <div class="ydc-tabPanel">--%><%--                        <div>--%><%--                            <ul>--%><%--                                <li class="hit"><h3 style="margin-top:10px;">疫情资讯</h3></li>--%><%--                            </ul>--%><%--                        </div>--%><%--                        <div class="ydc-panes">--%><%--                            <div class="ydc-pane" style="display:block;"><c:forEach items="${outinfors }"--%><%--                                                                                    var="outinfor">--%><%--                                <ol class="ydc-pane-list">--%><%--                                    <li><h4><a onclick="infor(${outinfor.id })" id="information"--%><%--                                               target="_blank">${outinfor.title }</a><span--%><%--                                            style="float:right;"><fmt:formatDate value="${outinfor.pubdatestr}"--%><%--                                                                                 pattern="yyyy-MM-dd"/></span></h4></li>--%><%--                                </ol>--%><%--                            </c:forEach></div>--%><%--                        </div>--%><%--                    </div>--%><%--                </div>--%><%--            </div>--%><%--        </div>--%><%--    </div>--%><%--</div>--%>
<div class="add_menber" id="add_menber_style" style="display:none;height:230px;">
    <ul>
        <li style="width:100%;">
            <h4><p align="center" id="title"></p></h4>
        </li>
        <li style="width:100%;text-align:center"><span style="margin-left:80px;margin-right:80px;" id="summary"></span>
        </li>
        <div>
            <li style="width:100%;margin-top:90px;"><p style="margin-left:80px;" id="infosource"></p></li>
        </div>
        <div>
            <li style="width:100%;"><p style="margin-left:600px;" id="pubdatestr"></p></li>
        </div>
    </ul>
</div>
</body>
</html>
<script type="text/javascript"> $(function () {
    $('.ydc-tabPanel ul li').click(function () {
        $(this).addClass('hit').siblings().removeClass('hit');
        $('.ydc-panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
    })
})</script>
<script>jQuery(function ($) {
    var oTable1 = $('#sample-table').dataTable({
        "aaSorting": [[1, "desc"]],/*默认第几个排序*/
        "bStateSave": true,/*状态保存*/
        "aoColumnDefs": [/*{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示*/ {
            "orderable": false,
            "aTargets": [0, 8, 9]
        }/* 制定列不参与排序*/]
    });
    $('table th input:checkbox').on('click', function () {
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox').each(function () {
            this.checked = that.checked;
            $(this).closest('tr').toggleClass('selected');
        });
    });
    $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

    function tooltip_placement(context, source) {
        var $source = $(source);
        var $parent = $source.closest('table')
        var off1 = $parent.offset();
        var w1 = $parent.width();
        var off2 = $source.offset();
        var w2 = $source.width();
        if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
        return 'left';
    }
});
$(function () {
    $.ajax({
        type: "post", url: "${pageContext.request.contextPath }/personnelSum.action", success: function (data) {
            data = eval('(' + data + ')');
            var user = "<span>" + data.user + "</span>";
            var admin = "<span>" + data.admin + "</span>";
            var security = "<span>" + data.security + "</span>";
            var notice = "<span>" + data.notice + "</span>";
            $("#userSum").append(user);
            $("#adminSum").append(admin);
            $("#securitySum").append(security);
            $("#noticeSum").append(notice);
        }, error: function (xmlHttpRequest) {
            alert(xmlHttpRequest.status);
        }
    });
});

function infor(id) {
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/infor.action",
        data: {id: id},
        dataType: "JSON",
        success: function (data) {
            layer.open({
                type: 1,
                title: '疫情资讯',
                maxmin: true,
                shadeClose: true, /*点击遮罩关闭层*/
                area: ['60%'],
                content: $('#add_menber_style'),
                offset: ['15%', '15%']
            });
            $("#title").html(data.title);
            $("#summary").html(data.summary);
            $("#infosource").html("<br>来源：&nbsp;&nbsp;<a href=" + data.sourceurl + " >" + data.infosource + "</a>");
        }
    });
}</script>