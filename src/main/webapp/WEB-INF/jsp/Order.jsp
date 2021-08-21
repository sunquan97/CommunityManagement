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
<title>订单列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
    	<div class="d_Confirm_Order_style">
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="100">ID</th>
				<th width="100">真实姓名</th>
				<th width="120">手机</th>
				<th width="200">地址</th>
				<th width="350">订单内容</th>
				<th width="150">创建时间</th>
				<th width="150">状态</th>
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach items="${orders }" var="order">
			<tr>
				<td style="vertical-align: middle !important;text-align: center;"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
				<td style="vertical-align: middle !important;text-align: center;">${order.orderid }</td>
				<td style="vertical-align: middle !important;text-align: center;">${order.name }</td>
				<td style="vertical-align: middle !important;text-align: center;">${order.number }</td>
				<td style="vertical-align: middle !important;text-align: center;">${order.address }</td>
				<td style="vertical-align: middle !important;text-align: center;">${order.foodids }</td>
				<td style="vertical-align: middle !important;text-align: center;"><fmt:formatDate value="${order.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class="td-status">
		<c:choose>
          <c:when test="${order.flag==0 }">
			<span class="label label-success radius">已下单</span>
          </c:when>
          <c:when test="${order.flag==1 }">
			<span class="label label-success radius">正在配送</span>
          </c:when>
          <c:when test="${order.flag==2 }">
			<span class="label label-success radius">已完成</span>
          </c:when>
          <c:when test="${order.flag==3 }">
			<span class="label label radius">已取消</span>
          </c:when>
        </c:choose>
        </td>
				<td class="td-manage">
		<c:choose>
          <c:when test="${order.flag==0 }">
			<a onClick="distribution(this,${order.orderid })"  href="javascript:;" title="配送"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120">配送</i></a> 
          </c:when>
        </c:choose>
			<a title="删除" href="javascript:;"  onclick="del(this,${order.orderid })" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">删除</i></a>
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
</body>
</html>
<script>


/*配送*/
function distribution(obj,orderid){
	layer.confirm('确认配送？',function(index){
		window.location.href="${pageContext.request.contextPath }/distribution.action?orderid="+orderid+"" 
	});
}
/*删除*/
function del(obj,orderid){
	layer.confirm('确认删除？',function(index){
		window.location.href="${pageContext.request.contextPath }/del.action?orderid="+orderid+"" 
	});
}
laydate({
    elem: '#start',
    event: 'focus' 
});
</script>