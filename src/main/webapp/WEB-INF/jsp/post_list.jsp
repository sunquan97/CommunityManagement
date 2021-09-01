<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
    <link href="${pageContext.request.contextPath }/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath }/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>帖子列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <form action="${pageContext.request.contextPath }/searchUser.action" method="post" id="search">
                <div class="search_style">
                    <ul class="search_content clearfix">
<%--                        <li><label class="l_f">用户名</label><input name="search" value="${search}" type="text"  class="text_add" placeholder="输入用户名"  style=" width:400px"/></li>--%>
<%--                        <li><label class="l_f">添加时间</label><input type="datetime" value="${addtime}" name="addtime" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>--%>
<%--                        <li style="width:90px;"><input type="submit" id="searchbtn" class="btn_search" value="查询"></li>--%>
                    </ul>
                </div>
            </form>
            <!---->

            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="60">帖子编号</th>
                        <th width="100">帖子标题</th>
                        <th width="100">帖子内容</th>
                        <th width="150">创建时间</th>
                        <th width="80">状态</th>
                        <th width="100">用户名</th>
                        <th width="150">图片</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${posts }" var="post">
                        <tr>
                            <td style="vertical-align: middle !important;text-align: center;"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                            <td style="vertical-align: middle !important;text-align: center;">${post.postid }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${post.title }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${post.content }</td>
                            <td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${post.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td style="vertical-align: middle !important;text-align: center;">${post.flag }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${post.username }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${post.img }</td>
                            <td class="td-manage">
                                <a title="编辑" onclick="post_edit(${post.postid })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120">编辑</i></a>
                                <a title="删除" href="javascript:;"  onclick="postDel(this,${post.postid })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">删除</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--添加和编辑图层-->
<form action="${pageContext.request.contextPath }/addUser.action" method="post" id="addUserForm" ENCTYPE="multipart/form-data">
    <div class="add_menber" id="add_menber_style" style="display:none">
        <ul class=" page-content">
            <li><label class="label_name">帖子标题：</label><span class="add_name"><input name="title" id="title" type="text"  class="text_add"/></span><div class="prompt r_f" id="userbox"></div></li>
            <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name"><input name="flag" id="flag" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li><label class="label_name" style="float: left">帖子内容：</label><span class="add_name"><input name="content" id="content" type="textarea" style="width: 500px;height: 120px;float: left"  class="text_add"/></span><div class="prompt r_f"></div></li>
        </ul>
    </div>
</form>
</body>
</html>
<script>
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
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

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    })

    /*帖子-编辑*/
    function post_edit(postid){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/getPostById",
            data : {
                postid : postid
            },
            dataType : "JSON",
            success : function(data) {
                $("#title").attr('value',data.title);
                $("#content").attr('value',data.content);
                $("#flag").attr('value',data.flag);
            }
        });
        layer.open({
            type: 1,
            title: '修改帖子信息',
            maxmin: true,
            shadeClose:false, //点击遮罩关闭层
            area : ['600px' , '350px'],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var newUrl = "${pageContext.request.contextPath }/updatePost?postid="+postid+"";    //设置新提交地址
                $("#addUserForm").attr('action',newUrl);    //通过jquery为action属性赋值
                $("#addUserForm").attr('ENCTYPE','multipart/form-data');
                $("#addUserForm").submit();    //提交ID为myform的表单
                layer.close(index);
            }
        });
    }
    /*用户-删除*/
    function postDel(obj,postid){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
            window.location.href="${pageContext.request.contextPath }/postDel?postid="+postid+""
        });
    }
    laydate({
        elem: '#start',
        event: 'focus'
    });
</script>