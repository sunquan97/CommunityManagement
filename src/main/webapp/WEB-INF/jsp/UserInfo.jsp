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
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font/css/font-awesome.min.css" />
		<script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath }/static/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/js/typeahead-bs2.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/assets/js/jquery.dataTables.bootstrap.js"></script>
                      
<title>个人信息管理</title>
</head>

<body>
<div class="clearfix">
 <div class="admin_info_style">
   <div class="admin_modify_style" id="Personal">
     <div class="type_title">个人信息 </div>
      <div class="xinxi">
      <form action="${pageContext.request.contextPath }/updateUser.action?userid=${user.userid }" method="post" id="userinfo">
        <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名： </label>
        	<input type="hidden" id="userid" value="${user.userid }">
          <div class="col-sm-9"><input type="text" name="username" id="website-title" value="${user.username }" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;<a href="javascript:ovid()" onclick="change_Password()" class="btn btn-warning btn-xs">修改密码</a></div>
          
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别： </label>
          <div class="col-sm-9">
          <span class="sex">
          <c:choose>
			  <c:when test="${user.gender ==0 }">
					男
	          </c:when>
	          <c:otherwise>
					女
	          </c:otherwise>
        </c:choose>
			</span>
			<div class="add_sex">
            <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
            <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>
            </div>
           </div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">年龄： </label>
          <div class="col-sm-9"><input type="text" name="age" id="website-title" value="${user.age }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">移动电话： </label>
          <div class="col-sm-9"><input type="text" name="phonenumber" id="website-title" value="${user.phonenumber }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">家庭地址： </label>
          <div class="col-sm-9"><input type="text" name="address" id="website-title" value="${user.address }" class="col-xs-12 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">真实姓名： </label>
          <div class="col-sm-9"><input type="text" name="realname" id="website-title" value="${user.realname }" class="col-xs-7 text_info" disabled="disabled"> </div>
          </div>
           <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">权限： </label>
          <div class="col-sm-9" > <span>${user.userrole.rolename }</span></div>
          </div>
           <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">注册时间： </label>
          <div class="col-sm-9" > <span><fmt:formatDate value="${user.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
          </div>
          </form>
            </div>
    </div>
    <div class="recording_style">
    <div class="type_title">管理员登录记录 </div>
    <div class="recording_list">
     <table class="table table-border table-bordered table-bg table-hover table-sort" id="sample-table">
    <thead>
      <tr class="text-c">
        <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
        <th width="80">ID</th>
        <th width="100">类型</th>
        <th width="120">内容</th>
        <th width="150">用户名</th>
        <th width="120">客户端IP</th>
        <th width="250">时间</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${loginrecords }" var="loginrecord">
      <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>${loginrecord.recordid }</td>
        <td>${loginrecord.flag }</td>
        <td>${loginrecord.content }</td>
        <td>${loginrecord.username }</td>
        <td>${loginrecord.ip }</td>
        <td><fmt:formatDate value="${loginrecord.logintime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>      
      </tr>
      </c:forEach>
    </tbody>
  </table>
    </div>
    </div>
 </div>
</div>
 <!--修改密码样式-->
         <div class="change_Pass_style" id="change_Pass">
            <ul class="xg_style">
             <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="password" type="password" class="" id="password"></li>
             <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="newpassword" type="password" class="" id="Nes_pas"></li>
             <li><label class="label_name">确认密码</label><input name="againpassword" type="password" class="" id="c_mew_pas"></li>
              
            </ul>
     <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
         </div>
</body>
</html>
<script>

 //按钮点击事件
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#Personal').find('.xinxi').addClass("hover");
	  $('#Personal').find('.btn-success').css({'display':'block'});
	};
function save_info(){
	    var num=0;
		 var str="";
     $(".xinxi input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  
			   layer.alert('修改成功！',{
               title: '提示框',				
			   icon:1,			   		
			  });
			  $('#Personal').find('.xinxi').removeClass("hover");
			  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
			  $('#Personal').find('.btn-success').css({'display':'none'});
			   layer.close(index);
			   $("#userinfo").submit();
			
		  }		  		
	};	
 //初始化宽度、高度    
    $(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
  });
  //修改密码
  function change_Password(){
	   layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{
			var userid =$("#userid").val();
			var password =$("#password").val()
			var newpassword =$("#Nes_pas").val()
			  $.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/selectPassword.action",
					data : {
						userid : userid,password:password,newpassword:newpassword
					},
					success : function(data) {
						data=eval('('+data+')');
						if(data.msg=="旧密码相同"){
							layer.alert('修改成功！下次登录请使用新密码！',{
					               title: '提示框',				
								icon:1,		
								  }); 
							layer.close(index); 
						}else{
							layer.alert('旧密码输入错误！',{
					               title: '提示框',				
								icon:1,		
								  }); 
							layer.close(index); 
						}
					}
				}); 
			 
			  
		  }	 
	}
    });
	  }
</script>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});
</script>
