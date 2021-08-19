<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${pageContext.request.contextPath }/jsp/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/style.css"/>       
        <link href="${pageContext.request.contextPath }/jsp/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/assets/css/font-awesome.min.css" />
		<script src="${pageContext.request.contextPath}/jsp/js/jquery-3.2.1.min.js"></script>    
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/jsp/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath }/jsp/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/jsp/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="${pageContext.request.contextPath }/jsp/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath }/jsp/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/H-ui.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/H-ui.admin.js"></script> 
        <script src="${pageContext.request.contextPath }/jsp/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath }/jsp/assets/laydate/laydate.js" type="text/javascript"></script>
<title>用户列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
    	<div class="d_Confirm_Order_style">
      		<form action="${pageContext.request.contextPath }/searchUser.action" method="post" id="search">
      			<div class="search_style">
		        	<ul class="search_content clearfix">
		       			<li><label class="l_f">用户名</label><input name="search" value="${search}" type="text"  class="text_add" placeholder="输入用户名"  style=" width:400px"/></li>
		       			<li><label class="l_f">添加时间</label><input type="datetime" value="${addtime}" name="addtime" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
		       			<li style="width:90px;"><input type="submit" id="searchbtn" class="btn_search" value="查询"></li>
		      		</ul>
	    		</div>
      		</form>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
       </span>
       <span class="r_f">共：<b>${size}</b>条</span>
     </div>
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="60">ID</th>
				<th width="100">用户名</th>
				<th width="100">真实姓名</th>
				<th width="80">性别</th>
				<th width="100">手机</th>
				<th width="150">地址</th>
				<th width="150">加入时间</th>
                <th width="80">权限</th>
				<th width="70">状态</th>                
				<th width="250">操作</th>
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
				男
          </c:when>
          <c:otherwise>
				女
          </c:otherwise>
        </c:choose></td>
				<td style="vertical-align: middle !important;text-align: center;">${user.phonenumber }</td>
				<td style="vertical-align: middle !important;text-align: center;">${user.address }</td>
				<td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${user.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td style="vertical-align: middle !important;text-align: center;">${user.userrole.rolename }</td>
				<td class="td-status">
		<c:choose>
          <c:when test="${user.flag==0 }">
			<span class="label label-success radius">已启用</span>
          </c:when>
          <c:otherwise>
			<span class="label label-defaunt radius">已停用</span>
          </c:otherwise>
        </c:choose>
        </td>
				<td class="td-manage">
		<c:choose>
          <c:when test="${user.flag==0 }">
			<a onClick="user_stop(this,${user.userid })"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120">停用</i></a> 
          </c:when>
          <c:otherwise>
            <a style="text-decoration:none" class="btn btn-xs " onClick="user_start(this,${user.userid })" href="javascript:;" title="启用"><i class="icon-ok bigger-120">启用</i></a>
          </c:otherwise>
        </c:choose>
					<a title="编辑" onclick="member_edit(${user.userid })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120">编辑</i></a> 
					<a title="删除" href="javascript:;"  onclick="user_del(this,${user.userid })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">删除</i></a>
				</td>
			</tr>
		</c:forEach>
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
<!--添加用户图层-->
<form action="${pageContext.request.contextPath }/addUser.action" method="post" id="addUserForm" ENCTYPE="multipart/form-data">
<div class="add_menber" id="add_menber_style" style="display:none">
	    <ul class=" page-content">
	    <li><label class="label_name">用户名：</label><span class="add_name"><input name="username" id="username" type="text"  class="text_add"/></span><div class="prompt r_f" id="userbox"></div></li>
	     <li><label class="label_name">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><span class="add_name"><input name="password" id="password" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
	     <label><input name="gender" type="radio" checked="checked" class="ace" value="0"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
	     <label><input name="gender" type="radio" class="ace" value="1"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
	     </li>
	     <li><label class="label_name">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label><span class="add_name"><input name="age" id="age" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="realname" id="realname" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">身份证号：</label><span class="add_name"><input name="idnumber" id="idnumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">移动电话：</label><span class="add_name"><input name="phonenumber" id="phonenumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">个人照片：</label><span class="add_name"><input name="file" type="file" id="file"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input name="address" id="address" type="text"  class="text_add" style=" width:450px"/></span><div class="prompt r_f"></div></li>
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
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
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
	       		layer.alert('请输入用户名！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if (username1.test(username)){
            	layer.alert('用户名不能含有中文',{
                    title: '提示框',				
     			icon:1,		
     			  });
            }else if(username.length > 20){
	       		layer.alert('用户名长度不能超过20位',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(input=="已注册"){
	       		layer.alert('用户名已注册',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(password== "" || $.trim($("#password").val()).length == 0){
	       		layer.alert('请输入密码！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(password.length < 6 || password.length > 12){
	       		layer.alert('密码长度范围在6-12位之间',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(age.length == 0){
	       		layer.alert('请输入年龄',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!age1.test(age)){
	       		layer.alert('请输入年龄',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(realname.length ==0){
	       		layer.alert('请输入真实姓名',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!realname1.test(realname)){
	       		layer.alert('请输入真实姓名',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(idnumber.length ==0){
	       		layer.alert('请输入身份证号',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!idnumber1.test(idnumber)){
	       		layer.alert('身份证号输入不合法',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(phonenumber.length ==0){
	       		layer.alert('请输入手机号码',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!phonenumber1.test(phonenumber)){
	       		layer.alert('请输入正确的手机号码',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(address.length ==0){
	       		layer.alert('请输入家庭住址',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(file.length ==0){
	       		layer.alert('请选择您的真实照片(用于人脸识别登录)',{
	                title: '提示框',				
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
            alert("错误");
      }
  }); 
	});
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*用户-停用*/
function user_stop(obj,userid){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="user_start(this,'+userid+')" href="javascript:;" title="启用"><i class="icon-ok bigger-120">启用</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
		window.location.href="${pageContext.request.contextPath }/stopUser.action?userid="+userid+"" 
	});
}

/*用户-启用*/
function user_start(obj,userid){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="user_stop(this,'+userid+')" href="javascript:;" title="停用"><i class="icon-ok bigger-120">停用</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
		window.location.href="${pageContext.request.contextPath }/startUser.action?userid="+userid+"" 
	});
}
/*用户-编辑*/
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
        title: '修改用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
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
	       		layer.alert('请输入用户名！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if (username1.test(username)){
            	layer.alert('用户名不能含有中文',{
                    title: '提示框',				
     			icon:1,		
     			  });
            }else if(username.length > 20){
	       		layer.alert('用户名长度不能超过20位',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(input=="已注册"){
	       		layer.alert('用户名已注册',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(password== "" || $.trim($("#password").val()).length == 0){
	       		layer.alert('请输入密码！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(password.length < 6 || password.length > 12){
	       		layer.alert('密码长度范围在6-12位之间',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(age.length == 0){
	       		layer.alert('请输入年龄',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!age1.test(age)){
	       		layer.alert('请输入年龄',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(realname.length ==0){
	       		layer.alert('请输入真实姓名',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!realname1.test(realname)){
	       		layer.alert('请输入真实姓名',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(idnumber.length ==0){
	       		layer.alert('请输入身份证号',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!idnumber1.test(idnumber)){
	       		layer.alert('身份证号输入不合法',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(phonenumber.length ==0){
	       		layer.alert('请输入手机号码',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(!phonenumber1.test(phonenumber)){
	       		layer.alert('请输入正确的手机号码',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(address.length ==0){
	       		layer.alert('请输入家庭住址',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else if(file.length ==0){
	       		layer.alert('请选择您的真实照片(用于人脸识别登录)',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else{
	       	 	var newUrl = "${pageContext.request.contextPath }/updateUser.action?userid="+userid+"";    //设置新提交地址
		        $("#addUserForm").attr('action',newUrl);    //通过jquery为action属性赋值
		        $("#addUserForm").attr('ENCTYPE','multipart/form-data');
		        $("#addUserForm").submit();    //提交ID为myform的表单
			   layer.close(index);	
       	 	}
			  
		}
    });
}
/*用户-删除*/
function user_del(obj,userid){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
		window.location.href="${pageContext.request.contextPath }/delUser.action?userid="+userid+"" 
	});
}
laydate({
    elem: '#start',
    event: 'focus' 
});
</script>