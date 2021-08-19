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
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js'>"+"<"+"/script>");
		</script>
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
<title>车辆列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
      <form action="${pageContext.request.contextPath }/searchVehicle.action" method="post" id="search">
		    <div class="search_style">
		      <ul class="search_content clearfix">
		       <li><label class="l_f">车牌号</label><input value="${vehiclenumber}" name="vehiclenumber" type="text"  class="text_add" placeholder="输入车牌号"  style=" width:200px"/></li>
		       <li><label class="l_f">车主</label><input value="${owner}" name="owner" type="text"  class="text_add" placeholder="输入车主姓名(仅可查询普通用户)"  style=" width:230px"/></li>
		       <li><label class="l_f">添加时间</label><input type="datetime" value="${addtime}" name="addtime" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
			   <li style="width:90px;"><input type="submit" id="searchbtn" class="btn_search" value="查询"></li>
		      </ul>
		    </div>
       </form>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="vehicle_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
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
				<th width="150">车辆所有人</th>
				<th width="100">手机号</th>
				<th width="150">车牌号</th>
				<th width="150">加入时间</th>
				<th width="150">结束时间</th>
                <th width="80">权限</th>
				<th width="70">状态</th>                
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach items="${vehicles }" var="vehicle">
			<tr>
				<td style="vertical-align: middle !important;text-align: center;"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
				<td style="vertical-align: middle !important;text-align: center;">${vehicle.vehicleid }</td>
				<td style="vertical-align: middle !important;text-align: center;">${vehicle.owner }</td>
				<td style="vertical-align: middle !important;text-align: center;">${vehicle.phonenumber }</td>
				<td style="vertical-align: middle !important;text-align: center;">${vehicle.vehiclenumber }</td>
				<td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${vehicle.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${vehicle.finite_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td style="vertical-align: middle !important;text-align: center;">${vehicle.vehiclerole.vehiclerolename }</td>
				<td class="td-status">
		<c:choose>
          <c:when test="${vehicle.flag==0 }">
			<span class="label label-success radius">已启用</span>
          </c:when>
          <c:otherwise>
			<span class="label label-defaunt radius">已停用</span>
          </c:otherwise>
        </c:choose>
        </td>
				<td class="td-manage">
		<c:choose>
          <c:when test="${vehicle.flag==0 }">
			<a onClick="vehicle_stop(this,${vehicle.vehicleid })"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120">停用</i></a> 
          </c:when>
          <c:otherwise>
            <a style="text-decoration:none" class="btn btn-xs " onClick="vehicle_start(this,${vehicle.vehicleid })" href="javascript:;" title="启用"><i class="icon-ok bigger-120">启用</i></a>
          </c:otherwise>
        </c:choose>
					<a title="编辑" onclick="vehicle_edit(${vehicle.vehicleid })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120">编辑</i></a> 
					<a title="删除" href="javascript:;"  onclick="vehicle_del(this,${vehicle.vehicleid })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">删除</i></a>
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
<form action="${pageContext.request.contextPath }/addVehicle.action" method="post" id="addUserForm" ENCTYPE="multipart/form-data">
<div class="add_menber" id="add_menber_style" style="display:none">
	    <ul class=" page-content">
	    <li ><label class="label_name">车&nbsp;&nbsp;&nbsp;&nbsp;主：</label><span class="add_name"><input name="owner" id="owner"  placeholder="车主" type="text"  class="text_add"/></span><div class="prompt r_f" ></div></li>
	     <li><label class="label_name">车牌号：</label><span class="add_name"><input name="vehiclenumber" id="vehiclenumber" placeholder="车牌号" type="text"  class="text_add"/></span><div class="prompt r_f" id="div"></div></li>
	     <li><label class="label_name">权&nbsp;&nbsp;&nbsp;&nbsp;限：</label><span class="add_name">
	     <label><input name="vehicleroleid" type="radio" checked="checked" class="ace" value="0"><span class="lbl">普通用户</span></label>&nbsp;&nbsp;&nbsp;
	     <label><input name="vehicleroleid" type="radio" class="ace" value="1"><span class="lbl">临时用户</span></label>&nbsp;&nbsp;&nbsp;</li>
	     <li><label class="label_name">手机号：</label><span class="add_name"><input name="phonenumber" id="phonenumber" placeholder="手机号" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
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
 $('#vehicle_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加车辆',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
			var phonenumber= $("#phonenumber").val();
			var vehiclenumber= $("#vehiclenumber").val();
     		var input = $("#input1").val();
     		var realname1 =/^[\u4e00-\u9fa5]{2,4}$/;  
     		var owner = $("#owner").val();
     		var phonenumber1 = /^[1][3,4,5,7,8][0-9]{9}$/;
     		var vehiclenumber1=/(^[\u4E00-\u9FA5]{1}[A-Z0-9]{6}$)|(^[A-Z]{2}[A-Z0-9]{2}[A-Z0-9\u4E00-\u9FA5]{1}[A-Z0-9]{4}$)|(^[\u4E00-\u9FA5]{1}[A-Z0-9]{5}[挂学警军港澳]{1}$)|(^[A-Z]{2}[0-9]{5}$)|(^(08|38){1}[A-Z0-9]{4}[A-Z0-9挂学警军港澳]{1}$)/;
     		if(owner.length==0){
     			layer.alert('请输入车主姓名',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(!realname1.test(owner)){
     			layer.alert('请输入正确姓名',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(vehiclenumber==0){
     			layer.alert('请输入车牌号',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(!vehiclenumber1.test(vehiclenumber)){
     			layer.alert('请输入正确的车牌号',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(input=="已存在"){
     			layer.alert('车牌号已存在',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(phonenumber==0){
     			layer.alert('请输入手机号',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(!phonenumber1.test(phonenumber)){
       		layer.alert('请输入正确的手机号码',{
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
/*用户-查看*/
function vehicle_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*用户-停用*/
function vehicle_stop(obj,vehicleid){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="vehicle_start(this,'+vehicleid+')" href="javascript:;" title="启用"><i class="icon-ok bigger-120">启用</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
		window.location.href="${pageContext.request.contextPath }/stopVehicle.action?vehicleid="+vehicleid+"" 
	});
}

/*用户-启用*/
function vehicle_start(obj,vehicleid){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="vehicle_stop(this,'+vehicleid+')" href="javascript:;" title="停用"><i class="icon-ok bigger-120">停用</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
		window.location.href="${pageContext.request.contextPath }/startVehicle.action?vehicleid="+vehicleid+"" 
	});
}
/*用户-编辑*/
function vehicle_edit(vehicleid){
		$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/getVehicleById.action",
				data : {
					vehicleid : vehicleid
				},
				dataType : "JSON",
				success : function(data) {
					$("#owner").attr('value',data.owner);  
					$("#phonenumber").attr('value',data.phonenumber);  
					$("#vehiclenumber").attr('value',data.vehiclenumber);  
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
			var phonenumber= $("#phonenumber").val();
			var vehiclenumber= $("#vehiclenumber").val();
     		var input = $("#input1").val();
     		var realname1 =/^[\u4e00-\u9fa5]{2,4}$/;  
     		var owner = $("#owner").val();
     		var phonenumber1 = /^[1][3,4,5,7,8][0-9]{9}$/;
     		var vehiclenumber1=/(^[\u4E00-\u9FA5]{1}[A-Z0-9]{6}$)|(^[A-Z]{2}[A-Z0-9]{2}[A-Z0-9\u4E00-\u9FA5]{1}[A-Z0-9]{4}$)|(^[\u4E00-\u9FA5]{1}[A-Z0-9]{5}[挂学警军港澳]{1}$)|(^[A-Z]{2}[0-9]{5}$)|(^(08|38){1}[A-Z0-9]{4}[A-Z0-9挂学警军港澳]{1}$)/;
     		if(owner.length==0){
     			layer.alert('请输入车主姓名',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(!realname1.test(owner)){
     			layer.alert('请输入正确姓名',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(vehiclenumber==0){
     			layer.alert('请输入车牌号',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(!vehiclenumber1.test(vehiclenumber)){
     			layer.alert('请输入正确的车牌号',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(input=="已存在"){
     			layer.alert('车牌号已存在',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(phonenumber==0){
     			layer.alert('请输入手机号',{
                    title: '提示框',				
     			icon:1,		
     			  });
     		}else if(!phonenumber1.test(phonenumber)){
       		layer.alert('请输入正确的手机号码',{
                title: '提示框',				
 			icon:1,		
 			  });
       	 	}else{
       	 var newUrl = "${pageContext.request.contextPath }/updateVehicle.action?vehicleid="+vehicleid+"";    //设置新提交地址
	        $("#addUserForm").attr('action',newUrl);    //通过jquery为action属性赋值
	        $("#addUserForm").attr('ENCTYPE','multipart/form-data');
	        $("#addUserForm").submit();    //提交ID为myform的表单
		   layer.close(index);	
		  }
		}
    });
}
/*用户-删除*/
function vehicle_del(obj,vehicleid){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
		window.location.href="${pageContext.request.contextPath }/delVehicle.action?vehicleid="+vehicleid+"" 
	});
}
laydate({
    elem: '#start',
    event: 'focus' 
});
$("#vehiclenumber").change(function(){
	  var vehiclenumber = $("#vehiclenumber").val();
    $.ajax({
        type:"post",
        url:"${pageContext.request.contextPath}/checkVehicleNumber.action",
        data: {"vehiclenumber":vehiclenumber},
        success:function(data){
      	$("#div").empty();
        	var span="<span id='span1' style='color: red;'>"+data+"</span>"
        	var input="<input type='hidden' value='"+data+"' id='input1'>"
        	$("#div").append(span); 
        	$("#div").append(input); 
      },error:function(msg){
            alert("错误");
      }
  }); 
	});
</script>