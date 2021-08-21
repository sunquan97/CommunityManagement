<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="baidu-site-verification" content="ZVPGgtpUfW"/>
        <link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/core.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/icon.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/home.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/assets/js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript">
        var currentShowCity=0;
        $(document).ready(function(){
            $("#province").change(function(){
                $("#province option").each(function(i,o){
                    if($(this).attr("selected"))
                    {
                        $(".city").hide();
                        $(".city").eq(i).show();
                        currentShowCity=i;
                    }
                });
            });

            $("#province").change();
        });

        function getSelectValue(){
            alert("1级="+$("#province").val());
            $(".city").each(function(i,o){
                if(i == currentShowCity){

                    alert("2级="+$(".city").eq(i).val());
                }
            });
        }
	
        </script>
    </head>
    <body>
                    <!-- right begin -->
                    <div class="ydc-column ydc-column-8">
                        <div class="ydc-release-content">
                            <div class="ydc-tabPanel ydc-tabPanel-release">
                                <div class="ydc-release-tab-head">
                                    <ul>
                                        <li class="hit">发布公告</li>
                                    </ul>
                                </div>
                                <div class="ydc-panes">
                                    <div class="ydc-pane" style="display:block;">
                                        
                                        </div>
                                        <div class="ydc-form-city">
                                            <form action="${pageContext.request.contextPath }/insertNotice.action" method="post" ENCTYPE="multipart/form-data" id="form">
                                                <div class="ydc-release-form-group ">
                                            <div class="ydc-warning-default">
                                                <p>标题字数需在11字到30字之间。</p>
                                            </div>
                                            <div class="ydc-release-form-group-input">
                                                <input type="text" class="ydc-form-control" name="noticename" title="" placeholder="请输入标题，为了更好的展示效果，建议标题字数在30个汉字以内" onkeyUp="textLimitCheck(this, 30);">
                                                <div class="ydc-form-group-jl">
                                                    <span id="messageCount">0</span>
                                                    /30
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ydc-release-form-text">
                                            <textarea name="content" style="width: 100%;height: 200px;" placeholder="   请输入内容" ></textarea>
											<br /><br />
                                            <span id="messageCount">添加图片</span><input type="file" name="file">
                                                <div class="ydc-btn">
                                                    <button class="btn" id="issue">发布</button>
                                                    <button class="btn btn-default">保存草稿</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- right end -->
                </div>
            </div>
        </section>
        <!-- content YDC end -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nicEdit.js"></script>
        <script type="text/javascript">
            
	    jQuery(function(){
	        upload_start();
	    });
	    //tab切换
	    $(function(){
	        $('.aui-ad-tab-title ul li').click(function(){
	            $(this).addClass('aui-current').siblings().removeClass('aui-current');
	            $('.aui-ad-tab-body>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    });
	
        </script>
        <script type="text/javascript">
            
	    bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });//编辑器
	
        </script>
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
	        setTimeout(showSlides, 3000); // AD滚动时间
	    }
	
        </script>
        <script type="text/javascript">
            
	    $(function(){
	        $('.ydc-tabPanel ul li').click(function(){
	            $(this).addClass('hit').siblings().removeClass('hit');
	            $('.ydc-panes>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    })//tab
	
        </script>
        <script type="text/javascript">
        $('#issue').on('click', function(){
        	$('#form').submit();
        });
	    function textLimitCheck(thisArea, maxLength){
	        if (thisArea.value.length > maxLength){
	            alert(maxLength + ' 个字限制. \r超出的将自动清除.');
	            thisArea.value = thisArea.value.substring(0, 30);
	            thisArea.focus();    }
	        messageCount.innerText = thisArea.value.length;
	        messageCount1.innerText = thisArea.value.length;
	        messageCount2.innerText = thisArea.value.length;
	    }//标题输入框字数限制
	
        </script>
    </body>
</html>
