<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>发表问题</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/res/css/global.css">
  <script src="${pageContext.request.contextPath}/static/res/layui/layui.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="main layui-clear">
  <div class="fly-panel" pad20>
    <h2 class="page-title">发表问题</h2>
    
    <!-- <div class="fly-none">并无权限</div> -->

    <div class="layui-form layui-form-pane">
      <form action="${pageContext.request.contextPath}/addPost.action" id="question" method="post" ENCTYPE="multipart/form-data">
        <div class="layui-form-item">
          <label for="L_title" class="layui-form-label">标题</label>
          <div class="layui-input-block">
            <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item layui-form-text">
          <div class="layui-input-block">
             <div class="editor">
    			<textarea id="content" name="content" style="width:1040px;height:450px;visibility:hidden;"></textarea>
    			<input type="hidden" name="username" value=" ${sessionScope.user.username}">
  			 </div>
          </div>
          <label for="L_content" class="layui-form-label" style="top: -2px;">描述</label>
        </div>
        <div class="layui-form-item">
          <label for="L_title" class="layui-form-label">添加图片</label>
          <div class="layui-input-block">
            <input type="file" name="file">
          </div>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn" lay-filter="*" id="lay-submit" lay-submit>立即发布</button>
          <a href="javascript:history.back(-1)" class="layui-btn">返回上一页</a>
        </div>
      </form>
    </div>
  </div>
</div>

 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/res/js/kindeditor.js"></script>
  <script type="text/javascript">
    KE.show({
        id : 'content',
		resizeMode : 1,
        cssPath : './index.css',
        items : [
        'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
        'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
        'insertunorderedlist', 'emoticons', 'image', 'link']
    });
  </script>
<script>
$('#lay-submit').on('click', function(){
	$('#question').submit();
});

</script>
</body>
</html>