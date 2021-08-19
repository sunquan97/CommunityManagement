//首页
$(function(){
	$("#first").click(function(){
		var currentPage=1;
		location.href=$("#url").val()+"/searchPost.action?currentPage="+currentPage;
	});
});
//上一页
$(function(){
	$("#prev").click(function(){
		var currentPage=$("#currentPage").val();
		if(currentPage!=""&&currentPage!=1){
			currentPage--;
			location.href=$("#url").val()+"/searchPost.action?currentPage="+currentPage;
		}
	});
});
//下一页
$(function(){
	$("#next").click(function(){
		var currentPage=$("#currentPage").val();
		if(currentPage!=""&&currentPage!=$("#pageCount").val()){
			currentPage++;
			location.href=$("#url").val()+"/searchPost.action?currentPage="+currentPage;
		}
	});
});
//末页
$(function(){
	$("#end").click(function(){
		var currentPage=$("#pageCount").val();
		if(currentPage!=""){
			location.href=$("#url").val()+"/searchPost.action?currentPage="+currentPage;
		}
	});
});
//跳转
$(function(){
	$("#transfer").click(function(){
		var currentPage=$("#viPage").val();
		if(currentPage!=""){
			location.href=$("#url").val()+"/searchPost.action?currentPage="+currentPage;
		}
	});
});