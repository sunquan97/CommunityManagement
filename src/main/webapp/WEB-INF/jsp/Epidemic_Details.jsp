<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath }/static/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css" />
        <link href="${pageContext.request.contextPath }/static/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font/css/font-awesome.min.css" />
		<script src="${pageContext.request.contextPath }/static/assets/js/ace-extra.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<!-- <![endif]-->
        <script src="${pageContext.request.contextPath }/static/assets/dist/echarts.js"></script>
        <script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<%--		  <script src="//code.jquery.com/jquery-1.9.1.js"></script>--%>
		  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<title></title>
</head>
<style>
ul{
    display: table;
    margin-left: auto;
    margin-right: auto;
}

ul li{
     float: left;
}
a:link { text-decoration: none;} 
a:active { text-decoration:blink} 
a:hover { text-decoration:underline;} 
a:visited { text-decoration: none;} 
</style>
<body >
<div class=" page-content clearfix">
 <div class="transaction_style">
   <ul class="state-overview clearfix">
    <li class="Info">
    <span class="symbol red"><h3>确诊人数</h3></span>
     <span class="value"><p class="Quantity color_red"><input type="text" value=""style="border:none;width:60px;" id="diagnosed"readonly="readonly"/></p></span>
    </li>
     <li class="Info">
     <span class="symbol yellow"><h3>疑似人数</h3></span>
     <span class="value"><p class="Quantity color_red"><input type="text" value=""style="border:none;width:60px;" id="suspect"readonly="readonly"/></p></span>
    </li>
     <li class="Info">
     <span class="symbol black" style="background: black"><h3>死亡人数</h3></span>
     <span class="value"><p class="Quantity color_red"><input type="text" value=""style="border:none;width:60px;" id="death"readonly="readonly"/></p></span>
    </li>
     <li class="Info">
     <span class="symbol green"><h3>治愈人数</h3></span>
     <span class="value"><p class="Quantity color_red"><input type="text" value=""style="border:none;width:60px;" id="cured" readonly="readonly"/></p></span>
    </li>
   </ul>
 
 </div>
 			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
 			
 			</div>
               
</div>



</body>
</html>
<script type="text/javascript">



     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-60);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-60);
		});
 });
       
     $(function(){ 	
	   		$.ajax({
	   				type : "get",
	   				url : "https://api.tianapi.com/txapi/ncovcity/index?key=7dcef006b46a8fc296af6b3266cf6a10",
	   				dataType : "JSON",
	   				success : function(data) {
	   					var num=0;
	   					$.each(data.newslist,function(i,pro){
	   						var div1="<div class='panel panel-default' id='"+num+"'></div>";
							$("#accordion").append(div1);
							var div2="<div class='panel-heading' role='tab' id='headingOne"+num+"' >";
							$("#"+num+"").append(div2);
							var h4="<h4 class='panel-title'><input type='hidden'  value="+pro.provinceName+"><a role='button' data-toggle='collapse' data-parent='#accordion' href='#collapse"+num+"' aria-expanded='true' aria-controls='collapseOne'>"+pro.provinceName+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确诊人数"
							+pro.confirmedCount+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;治愈人数"+pro.curedCount+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;死亡人数"+pro.deadCount+"</a></h4>"
							$("#headingOne"+num+"").append(h4); 
							var div3="<div id='collapse"+num+"' class='panel-collapse collapse in' role='tabpanel' aria-labelledby='headingOne'><div class='panel-body'><ul id='ul"+num+"'></ul></div></div>";
		   					$("#"+num+"").append(div3); 
		   					$.each(pro.cities,function(i,area){
		   						var li=" <li style='width:830px;' class='list-group-item list-group-item-danger'><h4>"+area.cityName+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确诊人数"+area.confirmedCount+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;治愈人数"+area.curedCount+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;死亡人数"+area.deadCount+"</li>";
		   						$("#ul"+num+"").append(li);
		   					}); 
						    num=num+1;
	  					}); 
	   				}
	   			});
	   	});   
      $(function(){ 	
    		$.ajax({
    				type : "get",
    				url : "https://api.tianapi.com/txapi/ncov/index?key=7dcef006b46a8fc296af6b3266cf6a10",
    				dataType : "JSON",
    				success : function(data) {
    					$("#diagnosed").attr('value',data.newslist[0].desc.confirmedCount);
    					$("#suspect").attr('value',data.newslist[0].desc.suspectedCount);
    					$("#death").attr('value',data.newslist[0].desc.deadCount);
    					$("#cured").attr('value',data.newslist[0].desc.curedCount); 
    				}
    		});
    	});  


     $(document).ready(function(){
 		$("#mymenu ul li").next("ul").hide();
 		$("#mymenu ul li").click(function(){
 			$(this).next("ul").toggle();
 		});
 	});
     
</script> 