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
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="100">ID</th>
				<th width="100">????????????</th>
				<th width="120">??????</th>
				<th width="200">??????</th>
				<th width="350">????????????</th>
				<th width="150">????????????</th>
				<th width="150">??????</th>
				<th width="150">??????</th>
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
			<span class="label label-success radius">?????????</span>
          </c:when>
          <c:when test="${order.flag==1 }">
			<span class="label label-success radius">????????????</span>
          </c:when>
          <c:when test="${order.flag==2 }">
			<span class="label label-success radius">?????????</span>
          </c:when>
          <c:when test="${order.flag==3 }">
			<span class="label label-success radius">?????????</span>
          </c:when>
        </c:choose>
        </td>
        <td class="td-manage">
		<c:choose>
          <c:when test="${order.flag==1 }">
			<a onClick="sign(this,${order.orderid })"  href="javascript:;" title="??????"  class="btn btn-xs btn-success">??????</a> 
			<a onClick="cancel(this,${order.orderid })" href="javascript:;" title="????????????"  class="btn btn-xs btn-warning">????????????</a> 
          </c:when>
          <c:when test="${order.flag==0 }">
			<a  href="javascript:;" title="????????????"  class="btn btn-xs btn">????????????</a> 
			<a onClick="cancel(this,${order.orderid })" href="javascript:;" title="????????????"  class="btn btn-xs btn-warning">????????????</a> 
          </c:when>
          <c:when test="${order.flag==2 }">
			<a  href="javascript:;" title="????????????"  class="btn btn-xs btn-">???????????????</a> 
          </c:when>
          <c:when test="${order.flag==3 }">
			<a  href="javascript:;" title="????????????"  class="btn btn-xs btn">???????????????</a> 
          </c:when>
        </c:choose>
        	
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

</body>
</html>
<script>
/*??????*/
function sign(obj,orderid){
	layer.confirm('???????????????',function(index){
		window.location.href="${pageContext.request.contextPath }/sign.action?orderid="+orderid+"" 
	});
}
function cancel(obj,orderid){
	layer.confirm('???????????????',function(index){
		window.location.href="${pageContext.request.contextPath }/cancel.action?orderid="+orderid+"" 
	});
}
laydate({
    elem: '#start',
    event: 'focus' 
});
</script>