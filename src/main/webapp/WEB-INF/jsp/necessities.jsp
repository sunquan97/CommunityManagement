<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/style_1.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/jquery.spinner.css" /> 
		<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/jquery.spinner.js"></script>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/home.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/css/style.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/res/layui/css/layui.css">
		<script src="${pageContext.request.contextPath }/jsp/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath }/jsp/assets/laydate/laydate.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/js/viewFoodPage.js"></script>
	</head>
	<body>
		<div class="danpin center">
			<div class="biaoti center">生活必需品</div>
				<div class="main center" id="food">
					<c:forEach items="${food }" var="food">
						<div class="mingxing fl" >
							<input type="hidden" id="foodid" value="${food.foodid}">
							<div class="sub_mingxing"><a href=""><img src="${food.img}" alt=""></a></div>
							<div class="pinpai"><a href="">${food.foodname }</a></div><br>
							<div class="jiage" id="jiage">${food.price }</div><br>
							<div style="margin-left:70px;" id="count"><input type="text" class="spinner" id="${food.foodid }"/></div>
						</div>
					</c:forEach>
				</div>
		</div>
		<button  class="layui-btn jie-add" onclick="Submitorder(${sessionScope.user.userid} )" style="margin-top:350px;">提交订单</button>
		<div class="ydc-pagination" >
			<input type="hidden" value="${page.currentPage}" id="currentPage">
			<input type="hidden" value="${pageContext.request.contextPath }" id="url">
			<input type="hidden" value="${page.pageCount }" id="pageCount">
			<ol style="margin-left:210px;">
				<li class="ydc-previous-item">
					<button id="first" class="ydc-previous-item-btn-medium ">
						<span>首页</span>
					</button>
				</li>
				<li class="ydc-previous-item">
					<button id="prev" class="ydc-previous-item-btn-medium ">
						<span>上一页</span>
					</button>
				</li>
				<li class="ydc-previous-item">
					<button id="next" class="ydc-previous-item-btn-medium">
						<span>下一页</span>
					</button>
				</li>
				<div style="margin-left:800px;">第<div class="ydc-item-quick-kun"><input type="number" id="viPage" aria-invalid="false" class=""></div>页
					<button id="transfer" style="margin-left:5px;" class="ydc-previous-item-btn-medium">
						<span>跳转</span>
					</button>
				</div>
											
			</ol>
		</div>
		<form action="${pageContext.request.contextPath }/addUser.action" method="post" id="addUserForm" ENCTYPE="multipart/form-data">
			<div class="add_menber" id="add_menber_style" style="display:none">
				    <ul class=" page-content">
				     <li><label class="label_name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label><span class="add_name"><input name="realname" id="realname" type="text"  class="text_add"/></span><div class="prompt r_f" id="userbox"></div></li>
				     <li><label class="label_name">详细地址：</label><span class="add_name"><input name="address" id="address" type="text" placeholder="精确到门牌号"  class="text_add"/></span><div class="prompt r_f"></div></li>
				     <li><label class="label_name">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label><span class="add_name"><input name="phonenumber" id="phonenumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
				     
				    </ul>
			</div>
  		</form>

	</body>
	<script>
		$('.spinner').spinner();
		
		function Submitorder(userid){
			$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/getUserById.action",
					data : {
						userid : userid
					},
					dataType : "JSON",
					success : function(data) {
						$("#realname").attr('value',data.realname);  
						$("#phonenumber").attr('value',data.phonenumber);  
					}
				});
		  layer.open({
	        type: 1,
	        title: '订单信息',
			maxmin: true, 
			shadeClose:false, //点击遮罩关闭层
	        area : ['800px' , ''],
	        content:$('#add_menber_style'),
			btn:['提交','取消'],
			yes:function(index,layero){	
				var realname = $("#realname").val();
	            var phonenumber = $("#phonenumber").val();
	            var address = $("#address").val();
	            var phonenumber1 = /^[1][3,4,5,7,8][0-9]{9}$/;
	            var realname1 =/^[\u4e00-\u9fa5]{2,4}$/;  
	            if(realname.length ==0){
		       		layer.alert('请输入真实姓名',{
		                title: '提示框',				
		 			icon:1,		
		 			  });
	       	 	}else if(!realname1.test(realname)){
		       		layer.alert('请输入真实姓名',{
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
		       		layer.alert('请输入详细地址',{
		                title: '提示框',				
		 			icon:1,		
		 			  });
	       	 	}else{
	       	 		var foodchild = $("#food").children("div")
	       	 		var data = {};
	       	 	 	var a = new Array();
	       	 		foodchild.each(function(){
	       	 			if($(this).children("#count").children(".spinner").children("input").val()!=0){
	       	 			var b = {};
	       	 			b["id"]=$(this).children("input").val();
		       	 		b["price"]=$(this).children("#jiage").text();
		       	 		b["count"]=$(this).children("#count").children(".spinner").children("input").val();
		       	 		a.push(b);
	       	 			}
	       	 		});
	       	 		data["shop"]=a;
	       	 		var json=JSON.stringify(data);
	       	 		var i=0;
		       	 	foodchild.each(function(){
	       	 			if($(this).children("#count").children(".spinner").children("input").val()!=0){
	       	 				i=1;
	       	 			}
	       	 		});
		       	 	if(i==1){
			       	 	$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath }/addOrder.action",
							data : {
								json : json,
								realname : realname,
								phonenumber: phonenumber,
								address : address
							},
							success : function(data) {
								alert(data);
							}
						}); 
		       	 	}else if(i==0){
		       	 		alert("未选择商品"); 
		       	 	}
	       	 		layer.close(index);	
	       	 	}
			}
	    });
	}
		</script>
</html>