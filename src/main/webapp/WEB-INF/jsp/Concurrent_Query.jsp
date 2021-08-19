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
<title>同程查询</title>
</head>
  <script >
  $(document).ready(function(){
  $("#searchbtn").click(function(){
	  	var  type= $('#type option:selected').val(); 
		var  date= $('#date').val(); 
		var  no= $('#no').val(); 
		var  arrive= $('#arrive').val(); 
		if(type!=-1&&date==""&&no==""&&arrive==""){
			$.ajax({
		        type:"get",
		        url:"https://api.tianapi.com/txapi/ncovsame/index",
		        data: {"key":"7dcef006b46a8fc296af6b3266cf6a10",
		        	   "type":type,
		        },
		        success:function(data){
		        	if(data.code!=200){
		        		alert("查询失败");
		        	}
		        	$("#tbody").empty();
		        	$.each(data.newslist,function(i,pro){
		        		var tr="<tr><td style='vertical-align: middle !important;text-align: center;'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td><td style='vertical-align: middle !important;text-align: center;'>"+pro.date+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.type+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.memo+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no_sub+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.source+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.who+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.verified+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.created_at+"</td></tr>";
		        		$("#tbody").append(tr); 
		        	}); 
		      },error:function(msg){
		            alert("错误");
		      }
		  }); 
		}else if(type==-1&&date!=""&&no==""&&arrive==""){
			$.ajax({
		        type:"get",
		        url:"https://api.tianapi.com/txapi/ncovsame/index",
		        data: {"key":"7dcef006b46a8fc296af6b3266cf6a10",
		        	   "date":date,
		        },
		        success:function(data){
		        	if(data.code!=200){
		        		alert("查询失败");
		        	}
		        	$("#tbody").empty();
		        	$.each(data.newslist,function(i,pro){
		        		var tr="<tr><td style='vertical-align: middle !important;text-align: center;'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td><td style='vertical-align: middle !important;text-align: center;'>"+pro.date+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.type+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.memo+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no_sub+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.source+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.who+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.verified+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.created_at+"</td></tr>";
		        		$("#tbody").append(tr); 
		        	}); 
		      },error:function(msg){
		            alert("错误");
		      }
		  }); 
		}else if(type==-1&&date==""&&no!=""&&arrive==""){
			$.ajax({
		        type:"get",
		        url:"https://api.tianapi.com/txapi/ncovsame/index",
		        data: {"key":"7dcef006b46a8fc296af6b3266cf6a10",
		        	   "no":no,
		        },
		        success:function(data){
		        	if(data.code!=200){
		        		alert("查询失败");
		        	}
		        	$("#tbody").empty();
		        	$.each(data.newslist,function(i,pro){
		        		var tr="<tr><td style='vertical-align: middle !important;text-align: center;'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td><td style='vertical-align: middle !important;text-align: center;'>"+pro.date+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.type+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.memo+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no_sub+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.source+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.who+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.verified+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.created_at+"</td></tr>";
		        		$("#tbody").append(tr); 
		        	}); 
		      },error:function(msg){
		            alert("错误");
		      }
		  }); 
		}else if(type==-1&&date==""&&no==""&&arrive!=""){
			$.ajax({
		        type:"get",
		        url:"https://api.tianapi.com/txapi/ncovsame/index",
		        data: {"key":"7dcef006b46a8fc296af6b3266cf6a10",
		        	   "arrive":arrive,
		        },
		        success:function(data){
		        	if(data.code!=200){
		        		alert("查询失败");
		        	}
		        	$("#tbody").empty();
		        	$.each(data.newslist,function(i,pro){
		        		var tr="<tr><td style='vertical-align: middle !important;text-align: center;'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td><td style='vertical-align: middle !important;text-align: center;'>"+pro.date+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.type+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.memo+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no_sub+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.source+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.who+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.verified+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.created_at+"</td></tr>";
		        		$("#tbody").append(tr); 
		        	}); 
		      },error:function(msg){
		            alert("错误");
		      }
		  }); 
		}else if(type!=-1&&date!=""&&no!=""&&arrive!=""){
			$.ajax({
		        type:"get",
		        url:"https://api.tianapi.com/txapi/ncovsame/index",
		        data: {"key":"7dcef006b46a8fc296af6b3266cf6a10",
		        	   "type":type,
		        	   "date":date,
		        	   "no":no,
		        	   "arrive":arrive,
		        },
		        success:function(data){
		        	if(data.code!=200){
		        		alert("查询失败");
		        	}
		        	$("#tbody").empty();
		        	$.each(data.newslist,function(i,pro){
		        		var tr="<tr><td style='vertical-align: middle !important;text-align: center;'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td><td style='vertical-align: middle !important;text-align: center;'>"+pro.date+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.type+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.memo+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.no_sub+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_start+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.pos_end+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.source+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.who+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.verified+"</td><td style='vertical-align: middle !important;text-align: center;'>"+pro.created_at+"</td></tr>";
		        		$("#tbody").append(tr); 
		        	}); 
		      },error:function(msg){
		            alert("错误");
		      }
		  }); 
		}
	    
  });
  });	 
  </script>
<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
    	<div class="d_Confirm_Order_style">
      			<div class="search_style">
		        	<ul class="search_content clearfix">
		       			<li>
			       			<label class="l_f">交通类型：</label> 
			       			<select id="type" name="type" >
	                  			<option id="choosePro"value="-1">请选择交通类型</option>
	                  			<option id="choosePro"value="1">飞机</option>
	                  			<option id="choosePro"value="2">火车</option>
	                  			<option id="choosePro"value="3">地铁</option>
	                  			<option id="choosePro"value="4">长途客车/大巴</option>
	                  			<option id="choosePro"value="5">公交车</option>
	                  			<option id="choosePro"value="6">出租车</option>
	                  			<option id="choosePro"value="7">轮船</option>
	                  			<option id="choosePro"value="8">其他公共场所</option>
	              			</select>
              			</li>
              			<li><label class="l_f">日期</label><input type="date"  name="date" class="inline laydate-icon" id="date" style=" margin-left:10px;"></li>
		       			<li><label class="l_f">车次</label><input name="no" id="no" type="text"  class="text_add"  style=" width:100px"/></li>
		       			<li><label class="l_f">到达地点</label><input name="arrive" id="arrive" type="text"  class="text_add"  style=" width:100px"/></li>
		      			<li style="width:90px;"><button id="searchbtn" class="btn_search" >查询</button></li>
		      		</ul>
	    		</div>
     <!---->
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">日期</th>
				<th width="60">出发时刻</th>
				<th width="60">到达时刻</th>
				<th width="60">交通工具类型</th>
				<th width="80">车次</th>
				<th width="80">乘客情况</th>
				<th width="80">病例所在车厢</th>
				<th width="80">出发站</th>
				<th width="80">到达站</th>
				<th width="80">消息来源</th>
				<th width="80">媒体平台</th>
				<th width="80">是否已证实</th>
				<th width="80">发生时刻</th>
			</tr>
		</thead>
	<tbody id="tbody">
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
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
laydate({
    elem: '#start',
    event: 'focus' 
});
</script>