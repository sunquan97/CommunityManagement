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
<title>公告列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
    	<div class="d_Confirm_Order_style">
      		<form action="${pageContext.request.contextPath }/getAllNotices.action" method="post" id="search">
      			<div class="search_style">
		        	<ul class="search_content clearfix">
		       			<li><label class="l_f">公告标题</label><input name="search" value="${search}" type="text"  class="text_add" placeholder="输入公告标题"  style=" width:400px"/></li>
		       			<li><label class="l_f">添加时间</label><input type="datetime" value="${addtime}" name="addtime" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
		       			<li style="width:90px;"><input type="submit" id="searchbtn" class="btn_search" value="查询"></li>
		      		</ul>
	    		</div>
      		</form>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加公告</a>
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
				<th width="60">公告ID</th>
				<th width="60">公告标题</th>
				<th width="100">公告内容</th>
				<th width="100">公告图片</th>
				<th width="80">创建时间</th>
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach items="${notices}" var="notice">
			<tr>
				<td style="vertical-align: middle !important;text-align: center;"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
				<td style="vertical-align: middle !important;text-align: center;">${notice.notice_id }</td>
				<td style="vertical-align: middle !important;text-align: center;">${notice.noticename }</td>
				<td style="vertical-align: middle !important;text-align: center;">${notice.content }</td>
				<td style="vertical-align: middle !important;text-align: center;">${notice.img  }</td>
				<td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${notice.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>

				<td class="td-manage">
					<a title="编辑" onclick="member_edit(${notices .noticeid })" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120">编辑</i></a>
					<a title="删除" href="javascript:;"  onclick="notice_del(this,${notices.noticeid })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">删除</i></a>
				</td>
			</tr>
		</c:forEach>
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
<!--添加公告图层-->
<form action="${pageContext.request.contextPath }/insertNotices.action" method="post" id="addNoticesForm" ENCTYPE="multipart/form-data">
<div class="add_menber" id="add_menber_style" style="display:none">
	    <ul class=" page-content">
	    <li><label class="label_name">公告ID：</label><span class="add_name"><input name="noticeid" id="noticeid" type="text"  class="text_add"/></span><div class="prompt r_f" id="noticebox"></div></li>
	     <li><label class="label_name">公告标题</label><span class="add_name"><input name="noticename" id="noticename" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">公告内容：</label><span class="add_name"><input name="content" id="content" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">公告图片</label><span class="add_name"><input name="img" id="img" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">创建时间</label><span class="add_name"><input name="createtime" id="createtime" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>

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
/*公告-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加公告',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
			var noticename = $("#noticename").val();
            var content = $("#content").val();
            var img = $("#iig").val();

            if(noticename== "" || $.trim($("#noticename").val()).length == 0){
	       		layer.alert('请输入公告标题！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });

       	 	}else if(content== "" || $.trim($("#content").val()).length == 0){
	       		layer.alert('请输入公告内容！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });


       	 	}else if(img.length ==0){
	       		layer.alert('请添加公告信息图片',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else{
	       		$("#addNoticeForm").submit();
				layer.close(index);	
       	 	}
            
		}
    });
});

/*公告信息-修改*/
function member_edit(noticeid){
		$.ajax({		url : "${pageContext.request.contextPath}/editNotices.action
				type : "POST",
		action",
				data : {
					noticeid : noticeid
				},
				dataType : "JSON",
				success : function(data) {
					$("#noticename").attr('value',data.noticename);
					$("#content").attr('value',data.content);
					$("#img").attr('value',data.img);
					$("#createtime").attr('value',data.createtime);

				}
			});
	  layer.open({
        type: 1,
        title: '修改通告信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
			var noticename = $("#noticename").val();
            var content= $("#content").val();
            var idnumber = $("#idnumber").val();
            var img = $("#img").val();


            if(noticename== "" || $.trim($("#noticename").val()).length == 0){
	       		layer.alert('请输入通告信息标题！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });


       	 	}else if(content= "" || $.trim($("#content").val()).length == 0){
	       		layer.alert('请填写通告信息！',{
	                title: '提示框',				
	 			icon:1,		
	 			  });


       	 	}else if(img.length ==0){
	       		layer.alert('请选择通告信息的相关图片',{
	                title: '提示框',				
	 			icon:1,		
	 			  });
       	 	}else{
	       	 	var newUrl = "${pageContext.request.contextPath }/insertNotice.action?noticeid="+noticeid+"";    //设置新提交地址
		        $("#addNoticesForm").attr('action',newUrl);    //通过jquery为action属性赋值
		        $("#addNoticesForm").attr('ENCTYPE','multipart/form-data');
		        $("#addNoticesForm").submit();    //提交ID为myform的表单
			   layer.close(index);	
       	 	}
			  
		}
    });
}
/*公告-删除*/
function notice_del(obj,noticeid){
$.ajax({		url : "${pageContext.request.contextPath}/delNotices.action
				type : "POST",
		action",
				data : {
					noticeid : noticeid
				},
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
		window.location.href="${pageContext.request.contextPath }/delNotices.action?noticeid="+noticeid+""
	});
}
laydate({
    elem: '#start',
    event: 'focus' 
});
</script>