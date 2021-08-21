<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>社区贴吧</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/home.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/global.css">
		<script src="${pageContext.request.contextPath}/static/res/layui/layui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/viewPostPage.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/viewSearchPostPage.js"></script>
	</head>
	<body>
		<div class="main layui-clear">
			<div class="wrap">
				<div  style="margin-left:0;width:100%;">
					<div class="fly-tab">
						<!--
        <span>
          <a href="" class="tab-this">全部</a>
          <a href="">未结帖</a>
          <a href="">已采纳</a>
          <a href="">置顶帖</a>
          <a href="../user/index.html">我的帖</a>
        </span>
       -->
						<form action="${pageContext.request.contextPath}/searchPost.action" class="fly-search">
							<i class="iconfont icon-sousuo"></i>
							<input class="layui-input" autocomplete="off" placeholder="搜索内容" type="text" name="title" value="${title }">
						</form>
						<a href="${pageContext.request.contextPath}/addjsp.action" class="layui-btn jie-add">发布问题</a>
					</div>

					<ul class="fly-list">
						<c:forEach items="${posts }" var="post">
							<li class="fly-list-li">
								<a href="#" class="fly-list-avatar">
									<img src="${pageContext.request.contextPath}/static/res/images/uer.jpg" alt="">
								</a>
								<h2 class="fly-tip">
		            				<a href="${pageContext.request.contextPath }/getPostById.action?postid=${post.postid }">${post.title }</a>
		            				<!-- <span class="fly-tip-stick">置顶</span> -->
	          					</h2>
								<p>
									<span>${post.username }</span>
									<span><fmt:formatDate value="${post.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									<span class="fly-list-hint"> 
	              						<i class="iconfont" title="回答">&#xe60c;</i> 317
	            					</span>
								</p>
							</li>
						</c:forEach>
						<p style="margin-left:40px;margin-top:40px;">共${page.pageCount}页/当前第${page.currentPage}页/共${page.recordCount }条记录</p>
					</ul>
					<input type="hidden" name="username" value=" ${sessionScope.user.username}">
					<div class="ydc-pagination">
										<input type="hidden" value="${page.currentPage}" id="currentPage">
							        	<input type="hidden" value="${pageContext.request.contextPath }" id="url">
							        	<input type="hidden" value="${page.pageCount }" id="pageCount">
									<ol>
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
										<div style="margin-left:55%;">
										第<div class="ydc-item-quick-kun"><input type="number" id="viPage" aria-invalid="false" class=""></div>页
											<button id="transfer" style="margin-left:5px;" class="ydc-previous-item-btn-medium">
												<span>跳转</span>
											</button>
										</div>
											
									</ol>
								</div>

				</div>
			</div>
		</div>
	</body>

</html>