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
    <title>????????????</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <form action="${pageContext.request.contextPath }/searchUser.action" method="post" id="search">
                <div class="search_style">
                    <ul class="search_content clearfix">
                        <li><label class="l_f">?????????</label><input name="search" value="${search}" type="text"  class="text_add" placeholder="???????????????"  style=" width:400px"/></li>
                        <li><label class="l_f">????????????</label><input type="datetime" value="${addtime}" name="addtime" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
                        <li style="width:90px;"><input type="submit" id="searchbtn" class="btn_search" value="??????"></li>
                    </ul>
                </div>
            </form>
            <!---->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>????????????</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>????????????</a>
       </span>
                <span class="r_f">??????<b>${size}</b>???</span>
            </div>
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="60">ID</th>
                        <th width="100">?????????</th>
                        <th width="100">????????????</th>
                        <th width="80">??????</th>
                        <th width="100">??????</th>
                        <th width="150">??????</th>
                        <th width="150">????????????</th>
                        <th width="80">??????</th>
                        <th width="70">??????</th>
                        <th width="250">??????</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users }" var="user">
                        <tr>
                            <td style="vertical-align: middle !important;text-align: center;"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                            <td style="vertical-align: middle !important;text-align: center;">${user.userid }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${user.username }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${user.realname }</td>
                            <td style="vertical-align: middle !important;text-align: center;">		<c:choose>
                                <c:when test="${user.gender ==0 }">
                                    ???
                                </c:when>
                                <c:otherwise>
                                    ???
                                </c:otherwise>
                            </c:choose></td>
                            <td style="vertical-align: middle !important;text-align: center;">${user.phonenumber }</td>
                            <td style="vertical-align: middle !important;text-align: center;">${user.address }</td>
                            <td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${user.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td style="vertical-align: middle !important;text-align: center;">${user.userrole.rolename }</td>
                            <td class="td-status">
                                <c:choose>
                                    <c:when test="${user.flag==0 }">
                                        <span class="label label-success radius">?????????</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="label label-defaunt radius">?????????</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="td-manage">
                                <c:choose>
                                    <c:when test="${user.flag==0 }">
                                        <a onClick="user_stop(this,${user.userid })"  href="javascript:;" title="??????"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120">??????</i></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a style="text-decoration:none" class="btn btn-xs " onClick="user_start(this,${user.userid })" href="javascript:;" title="??????"><i class="icon-ok bigger-120">??????</i></a>
                                    </c:otherwise>
                                </c:choose>
                                <a title="??????" onclick="member_edit(${user.userid })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120">??????</i></a>
                                <a title="??????" href="javascript:;"  onclick="user_del(this,${user.userid })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">??????</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--??????????????????-->
<form action="${pageContext.request.contextPath }/addUser.action" method="post" id="addUserForm" ENCTYPE="multipart/form-data">
    <div class="add_menber" id="add_menber_style" style="display:none">
        <ul class=" page-content">
            <li><label class="label_name">????????????</label><span class="add_name"><input name="username" id="username" type="text"  class="text_add"/></span><div class="prompt r_f" id="userbox"></div></li>
            <li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input name="password" id="password" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name">
	     <label><input name="gender" type="radio" checked="checked" class="ace" value="0"><span class="lbl">???</span></label>&nbsp;&nbsp;&nbsp;
	     <label><input name="gender" type="radio" class="ace" value="1"><span class="lbl">???</span></label>&nbsp;&nbsp;&nbsp;
            </li>
            <li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input name="age" id="age" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li><label class="label_name">???????????????</label><span class="add_name"><input name="realname" id="realname" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li><label class="label_name">???????????????</label><span class="add_name"><input name="idnumber" id="idnumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li><label class="label_name">???????????????</label><span class="add_name"><input name="phonenumber" id="phonenumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li><label class="label_name">???????????????</label><span class="add_name"><input name="file" type="file" id="file"  class="text_add"/></span><div class="prompt r_f"></div></li>
            <li class="adderss"><label class="label_name">???????????????</label><span class="add_name"><input name="address" id="address" type="text"  class="text_add" style=" width:450px"/></span><div class="prompt r_f"></div></li>
        </ul>
    </div>
</form>
</body>
</html>
<script>
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//?????????????????????
            "bStateSave": true,//????????????
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //????????????????????????
                {"orderable":false,"aTargets":[0,8,9]}// ????????????????????????
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
    /*??????-??????*/
    $('#member_add').on('click', function(){
        layer.open({
            type: 1,
            title: '????????????',
            maxmin: true,
            shadeClose: true, //?????????????????????
            area : ['800px' , ''],
            content:$('#add_menber_style'),
            btn:['??????','??????'],
            yes:function(index,layero){
                var username = $("#username").val();
                var password = $("#password").val();
                var idnumber = $("#idnumber").val();
                var age = $("#age").val();
                var input = $("#input").val();
                var file = $("#file").val();
                var confirmpassword = $("#confirmpassword").val();
                var phonenumber = $("#phonenumber").val();
                var address = $("#address").val();
                var realname = $("#realname").val();
                var idnumber1 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                var username1 = new RegExp("[\\u4E00-\\u9FFF]+","g");
                var phonenumber1 = /^[1][3,4,5,7,8][0-9]{9}$/;
                var realname1 =/^[\u4e00-\u9fa5]{2,4}$/;
                var age1=/^\d+(\.\d+)?$/;
                if(username== "" || $.trim($("#username").val()).length == 0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if (username1.test(username)){
                    layer.alert('???????????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(username.length > 20){
                    layer.alert('???????????????????????????20???',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(input=="?????????"){
                    layer.alert('??????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(password== "" || $.trim($("#password").val()).length == 0){
                    layer.alert('??????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(password.length < 6 || password.length > 12){
                    layer.alert('?????????????????????6-12?????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(age.length == 0){
                    layer.alert('???????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!age1.test(age)){
                    layer.alert('???????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(realname.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!realname1.test(realname)){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(idnumber.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!idnumber1.test(idnumber)){
                    layer.alert('???????????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(phonenumber.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!phonenumber1.test(phonenumber)){
                    layer.alert('??????????????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(address.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(file.length ==0){
                    layer.alert('???????????????????????????(????????????????????????)',{
                        title: '?????????',
                        icon:1,
                    });
                }else{
                    $("#addUserForm").submit();
                    layer.close(index);
                }

            }
        });
    });
    $("#username").change(function(){
        var username = $("#username").val();
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/checkUserName.action",
            data: {"username":username},
            success:function(data){
                $("#userbox").empty();
                var span="<span id='span1' style='color: red;'>"+data+"</span>"
                var input="<input type='hidden' value='"+data+"' id='input'>"
                $("#userbox").append(span);
                $("#userbox").append(input);
            },error:function(msg){
                alert("??????");
            }
        });
    });
    /*??????-??????*/
    function member_show(title,url,id,w,h){
        layer_show(title,url+'#?='+id,w,h);
    }
    /*??????-??????*/
    function user_stop(obj,userid){
        layer.confirm('?????????????????????',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="user_start(this,'+userid+')" href="javascript:;" title="??????"><i class="icon-ok bigger-120">??????</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">?????????</span>');
            $(obj).remove();
            layer.msg('?????????!',{icon: 5,time:1000});
            window.location.href="${pageContext.request.contextPath }/stopUser.action?userid="+userid+""
        });
    }
    /*??????-??????*/
    function user_start(obj,userid){
        layer.confirm('?????????????????????',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="user_stop(this,'+userid+')" href="javascript:;" title="??????"><i class="icon-ok bigger-120">??????</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">?????????</span>');
            $(obj).remove();
            layer.msg('?????????!',{icon: 6,time:1000});
            window.location.href="${pageContext.request.contextPath }/startUser.action?userid="+userid+""
        });
    }
    /*??????-??????*/
    function member_edit(userid){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/getUserById.action",
            data : {
                userid : userid
            },
            dataType : "JSON",
            success : function(data) {
                $("#username").attr('value',data.username);
                $("#password").attr('value',data.password);
                $("#age").attr('value',data.age);
                $("#realname").attr('value',data.realname);
                $("#idnumber").attr('value',data.idnumber);
                $("#phonenumber").attr('value',data.phonenumber);
                $("#address").attr('value',data.address);
            }
        });
        layer.open({
            type: 1,
            title: '??????????????????',
            maxmin: true,
            shadeClose:false, //?????????????????????
            area : ['800px' , ''],
            content:$('#add_menber_style'),
            btn:['??????','??????'],
            yes:function(index,layero){
                var username = $("#username").val();
                var password = $("#password").val();
                var idnumber = $("#idnumber").val();
                var age = $("#age").val();
                var input = $("#input").val();
                var file = $("#file").val();
                var confirmpassword = $("#confirmpassword").val();
                var phonenumber = $("#phonenumber").val();
                var address = $("#address").val();
                var realname = $("#realname").val();
                var idnumber1 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                var username1 = new RegExp("[\\u4E00-\\u9FFF]+","g");
                var phonenumber1 = /^[1][3,4,5,7,8][0-9]{9}$/;
                var realname1 =/^[\u4e00-\u9fa5]{2,4}$/;
                var age1=/^\d+(\.\d+)?$/;
                if(username== "" || $.trim($("#username").val()).length == 0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if (username1.test(username)){
                    layer.alert('???????????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(username.length > 20){
                    layer.alert('???????????????????????????20???',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(input=="?????????"){
                    layer.alert('??????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(password== "" || $.trim($("#password").val()).length == 0){
                    layer.alert('??????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(password.length < 6 || password.length > 12){
                    layer.alert('?????????????????????6-12?????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(age.length == 0){
                    layer.alert('???????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!age1.test(age)){
                    layer.alert('???????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(realname.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!realname1.test(realname)){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(idnumber.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!idnumber1.test(idnumber)){
                    layer.alert('???????????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(phonenumber.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(!phonenumber1.test(phonenumber)){
                    layer.alert('??????????????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(address.length ==0){
                    layer.alert('?????????????????????',{
                        title: '?????????',
                        icon:1,
                    });
                }else if(file.length ==0){
                    layer.alert('???????????????????????????(????????????????????????)',{
                        title: '?????????',
                        icon:1,
                    });
                }else{
                    var newUrl = "${pageContext.request.contextPath }/updateUser.action?userid="+userid+"";    //?????????????????????
                    $("#addUserForm").attr('action',newUrl);    //??????jquery???action????????????
                    $("#addUserForm").attr('ENCTYPE','multipart/form-data');
                    $("#addUserForm").submit();    //??????ID???myform?????????
                    layer.close(index);
                }

            }
        });
    }
    /*??????-??????*/
    function user_del(obj,userid){
        layer.confirm('?????????????????????',function(index){
            $(obj).parents("tr").remove();
            layer.msg('?????????!',{icon:1,time:1000});
            window.location.href="${pageContext.request.contextPath }/delUser.action?userid="+userid+""
        });
    }
    laydate({
        elem: '#start',
        event: 'focus'
    });
</script>