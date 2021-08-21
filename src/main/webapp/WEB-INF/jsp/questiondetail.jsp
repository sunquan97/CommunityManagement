<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>问题详情</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/global.css">
        <link href="${pageContext.request.contextPath }/static/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace.min.css" />
<script src="${pageContext.request.contextPath}/static/res/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<style type="text/css" rel="stylesheet">
form {
	margin: 0;
}

.editor {
	margin-top: 5px;
	margin-bottom: 5px;
}
.div {
    display: inline-block;
    padding: .3em .5em;
    background-image: linear-gradient(#ddd, #bbb);
    border: 1px solid rgba(0,0,0,.2);
    border-radius: .3em;
    box-shadow: 0 1px white inset;
    text-align: center;
    text-shadow: 0 1px 1px black;
    font-weight: bold;
}
.div:active{
    box-shadow: .05em .1em .2em rgba(0,0,0,.6) inset;
    border-color: rgba(0,0,0,.3);
    background: #bbb;
}
</style>

</head>
<body>
	<div class="main layui-clear">
		<div class="wrap">
			<div class="content detail">
				<div class="fly-panel detail-box">
				<input id="postid" type="hidden" value="${post.postid }">
					<h1>${post.title }</h1>
					<div class="fly-tip fly-detail-hint" data-id="">
						<span class="fly-tip-stick">置顶帖</span><span class="jie-admin">  </span> 
						<c:choose>
				          	<c:when test="${post.username == sessionScope.user.username }">
					          	<span class="jie-admin" type="del" style="margin-left: 20px;">
									<a href="${pageContext.request.contextPath}/delPost.action?postid=${post.postid }">删除该帖</a> </span> 
								</span>
							</c:when>
						</c:choose>
						<div class="fly-list-hint">
							<i class="iconfont" title="回答">&#xe60c;</i> ${post.replypost } 
						</div>
					</div>
					<div class="detail-about">
						<a class="jie-user" href=""> <img
							src="${pageContext.request.contextPath}/static/res/images/uer.jpg" alt="头像"> <cite> ${post.username }
								<em><fmt:formatDate value="${post.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/> 发布</em> </cite> </a>
						<c:choose>
					        		<c:when test="${post.username == sessionScope.user.username}">
										<c:choose>
				          	<c:when test="${post.flag ==1 }">
								<div class="detail-hits" data-id="">
									 <span class="layui-btn layui-btn-mini jie-admin"><a
										href="#">已完帖，无法编辑</a> </span> 
								</div>
							</c:when>
							<c:otherwise>
								<div class="detail-hits" data-id="">
									 <span class="layui-btn layui-btn-mini jie-admin"><a
										href="${pageContext.request.contextPath}/editor.action?postid=${post.postid}">编辑</a> </span> 
								</div>
          					</c:otherwise>
				        	</c:choose>
									</c:when>
								</c:choose>
						
					</div>
					<div class="detail-body photos" style="margin-bottom: 20px;">
						<h4><p>${post.content }</p></h4>
						<c:choose>
					        <c:when test="${post.img !=null }">
								<img src="${post.img}">
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="fly-panel detail-box" style="padding-top: 0;">
					<a name="comment"></a>
					<ul class="jieda photos" id="jieda">
					<c:forEach items="${replyposts }" var="replypost">
						<c:choose>
				          <c:when test="${replypost.flag ==1 }">
								<li data-id="12" class="jieda-daan"><a
							name="item-121212121212"></a>
							<div class="detail-about detail-about-reply">
								<a class="jie-user" href=""> <img
									src="${pageContext.request.contextPath}/static/res/images/uer.jpg" alt=""> <cite> <i>${replypost.username }</i>
										<!-- <em>(楼主)</em>
                  						<em style="color:#5FB878">(管理员)</em> --> </cite> </a>
								<div class="detail-hits">
									<span><fmt:formatDate value="${replypost.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</div>
								<i class="iconfont icon-caina" title="最佳答案"></i>
							</div>
							<div class="detail-body jieda-body">
								<h4><p>${replypost.content }</p></h4>
							</div>
							<div class="jieda-reply">
								<span class="jieda-zan zanok" type="zan"><i
									class="iconfont icon-zan"></i><em>12</em>
								</span> 
								<!-- <div class="jieda-admin">
						                <span type="del">删除</span>
						                <span class="jieda-accept" type="accept">采纳</span>
						             </div> -->
							</div>
						</li>
				          </c:when>
				        </c:choose>
						</c:forEach>
					<c:forEach items="${replyposts }" var="replypost">
						<c:choose>
				          <c:when test="${replypost.flag ==0 }">
				          <li data-id="13"><a name="item-121212121212"></a>
							<div class="detail-about detail-about-reply">
							<input type="hidden" value="${replypost.replypostid }" id="replypostid">
								<a class="jie-user" href=""> <img
									src="${pageContext.request.contextPath}/static/res/images/uer.jpg" alt=""> <cite> <i>${replypost.username }</i>
										<em style="color:#FF9E3F">活雷锋</em> </cite> </a>
								<div class="detail-hits">
									<span><fmt:formatDate value="${replypost.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</div>
							</div>
							<div class="detail-body jieda-body">
							<h4><p>${replypost.content }</p></h4>
								<c:choose>
					        		<c:when test="${replypost.img !=null }">
										<img src="${replypost.img}">
									</c:when>
								</c:choose>
							</div>
							<div class="detail-body jieda-body">
							<table class="table table-hover">
								<c:forEach items="${replys }" var="reply">
									<c:choose>
						        		<c:when test="${reply.replypostid ==replypost.replypostid }">
						        		<tr class="active" >
						        		<td class="active" style="width:650px;">
											<blockquote>
											  <footer><mark>${reply.username }</mark>   评论        <mark>${reply.replyname }</mark>
											  		<label class="label_name">&nbsp; &nbsp; &nbsp; <button  type="button" class="btn btn-warning" onclick="rpy(${reply.replyid })">回复</button ></label>
													<input id="rpy${reply.replyid }" type="hidden"  class="text_add" />
													<input id="btn${reply.replyid }" type="hidden" onclick="addreplys(${reply.replyid },${replypost.replypostid },'${reply.username }')"  class="button_reply"  value="确认"/>
											  </footer>
											  <h4><p>${reply.replycontent } </p></h4>
											</blockquote>
										</td>
										</tr>
										</c:when>
									</c:choose>
								</c:forEach>
							</table>
							</div>
							<div class="jieda-reply">
								<label class="label_name"><button class="btn btn-info" onclick="reply(${replypost.replypostid })">评论</button ></label>
								<input name="replycontent" id="reply${replypost.replypostid }" type="hidden"  class="text_add" />
								<input name="button" id="button${replypost.replypostid }" type="hidden" onclick="addreply(${replypost.replypostid },'${replypost.username }')"  class="button_reply"  value="确认"/>
								
								<c:choose>
					        		<c:when test="${post.username == sessionScope.user.username}">
										<div class="jieda-admin">
											<span type="del"><a href="${pageContext.request.contextPath}/delReplyPost.action?postid=${post.postid }&replypostid=${replypost.replypostid }" class="layui-btn layui-btn-danger layui-btn-small">删除</a></span>
											<span class="jieda-accept" type="accept">
											<a href="${pageContext.request.contextPath}/accept.action?postid=${post.postid }&replypostid=${replypost.replypostid }" class="layui-btn  layui-btn-small">采纳</a></span>
										</div>
									</c:when>
								</c:choose>
								
							</div></li>
				          </c:when>
				        </c:choose>
						</c:forEach>

						<!-- <li class="fly-none">没有任何回答</li> -->
					</ul>
					<div class="layui-form layui-form-pane">
						<form action="${pageContext.request.contextPath}/addReplyPost.action" ENCTYPE="multipart/form-data" id="replypost" method="post" >
							<div class="layui-form-item layui-form-text">
								<div class="layui-input-block">
										<textarea id="L_content" name="content"  placeholder="我要回答"
										class="layui-textarea fly-editor" style="height: 150px;"></textarea>
										<input type="hidden" name="username" value=" ${user.username}" id="username">
										<input type="hidden" name="postid" value=" ${post.postid }">
								</div>
								<div class="layui-form-item">
						          <label for="L_title" class="layui-form-label">添加图片</label>
						          <div class="layui-input-block">
						            <input type="file" name="file">
						          </div>
						        </div>
							</div>
							<div class="layui-form-item">
								<button class="layui-btn" lay-filter="*" id="layui-btn" lay-submit>提交回答</button>
								<a href="javascript:history.back(-1)" class="layui-btn">返回上一页</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="edge">
			<dl class="fly-panel fly-list-one">
				<dt class="fly-panel-title">最近热帖</dt>
				<c:forEach items="${posts }" var="post">
				<dd>
					<a href="${pageContext.request.contextPath }/getPostById.action?postid=${post.postid }">${post.title }</a> <span><i
						class="iconfont">&#xe60c;</i>${post.replypost }</span>
				</dd>
				</c:forEach>
			</dl>

		</div>
	</div>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/res/js/kindeditor.js"></script>
  <script >

    $('#layui-btn').on('click', function(){
    	$('#replypost').submit();
    });
    function   reply(id){
    	$("#reply"+id+"").attr('type','text');
    	$("#button"+id+"").attr('type','button');
    }
    function   addreply(id,replyname){
    	var username=$("#username").val();
    	var postid = $("#postid").val();
    	var replycontent=$("#reply"+id+"").val();
    	window.location.href="${pageContext.request.contextPath }/addReply.action?replypostid="+id+"&replycontent="+replycontent+"&postid="+postid+"&username="+username+"&replyname="+replyname+"";
    }; 
    function   rpy(id){
    	$("#rpy"+id+"").attr('type','text');
    	$("#btn"+id+"").attr('type','button');
    }
    function   addreplys(replyid,id,replyname){
    	var username=$("#username").val();
    	var postid = $("#postid").val();
    	var replycontent=$("#rpy"+replyid+"").val();
    	window.location.href="${pageContext.request.contextPath }/addReply.action?replypostid="+id+"&replycontent="+replycontent+"&postid="+postid+"&username="+username+"&replyname="+replyname+"";
    }; 
  </script>
</body>
</html>