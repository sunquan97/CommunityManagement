<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/core.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/icon.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/home.css">
</head>
<body>
<!-- head YDC begin -->
	<header class="ydc-header">
		<div class="ydc-entered">
			<div class="ydc-header-content ydc-flex">
				<div class="ydc-column">
				</div>
				<div class="ydc-column">
					<div class="ydc-column-user">
						<div class="ydc-user-photo">
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<!-- head YDC end -->

<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-page-content">
				<div class="ydc-page-head">
					<h3>${notice.noticename }</h3>
					<h4>亲爱的朋友们：</h4>
					<p>${notice.content }</p>
				</div>
				<div class="ydc-right-banner" style="width:100%;height:100%;">
					<div class="slideshow-container">
						<c:choose>
					        <c:when test="${notice.img !=null }">
								<img src="${notice.img}" style="width:100%;height:100%;">
							</c:when>
						</c:choose>
							
						<%-- <a href="https://weibo.com/525135676" target="_blank" class="mySlides fade">
							<img src="${pageContext.request.contextPath }/admin/images/ad/ad2.jpg" style="width:100%">
						</a>
						<a href="http://www.a-ui.cn/" target="_blank" class="mySlides fade">
							<img src="${pageContext.request.contextPath }/admin/images/ad/ad3.jpg" style="width:100%">
						</a> --%>
					</div>
				</div>
				<div class="ydc-page-aut">
					<span><fmt:formatDate value="${notice.createtime}" pattern="yyyy-MM-dd"/></span>
				</div>
				
			</div>
		</div>

	</section>
<!-- content YDC end -->

	<script type="text/javascript" src="${pageContext.request.contextPath }static/js/jquery.min.js"></script>
	<script type="text/javascript">
	    var slideIndex = 0;
	    showSlides();

	    function showSlides() {
	        var i;
	        var slides = document.getElementsByClassName("mySlides");
	        for (i = 0; i < slides.length; i++) {
	            slides[i].style.display = "none";
	        }
	        slideIndex++;
	        if (slideIndex> slides.length) {slideIndex = 1}
	        slides[slideIndex-1].style.display = "block";
	        setTimeout(showSlides, 3000); // 滚动时间
	    }
	</script>

	<script type="text/javascript">
	    $(function(){
	        $('.ydc-tabPanel ul li').click(function(){
	            $(this).addClass('hit').siblings().removeClass('hit');
	            $('.ydc-panes>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    })
	</script>

</body>
</html>