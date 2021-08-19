<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>订单</title>
	<script src="${pageContext.request.contextPath }/jsp/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/jsp/assets/dist/echarts.js"></script>
    <script src="${pageContext.request.contextPath }/jsp/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>
<div id="map" style="width:100%; overflow:auto; overflow:hidden";>
<input type="hidden" value="" id="total"/>
</div>
</body>
</html>
<script>
$(function(){ 	
	$.ajax({
			type : "get",
			url : "https://api.tianapi.com/txapi/ncov/index?key=7dcef006b46a8fc296af6b3266cf6a10",
			dataType : "JSON",
			success : function(data) {
				$("#total").attr('value','截止目前'+'   确诊人数   '+data.newslist[0].desc.confirmedCount+'   疑似人数   '+data.newslist[0].desc.suspectedCount+'   死亡人数   '+data.newslist[0].desc.deadCount+'   治愈人数   '+data.newslist[0].desc.curedCount);
			}
	});
}); 
		$(function(){ 	
			$.ajax({
					type : "get",
					url : "https://api.tianapi.com/txapi/ncovcity/index?key=7dcef006b46a8fc296af6b3266cf6a10",
					dataType : "JSON",
					success : function(data) {
						var total= $("#total").val();
						//初始化宽度、高度
					    $("#map").height($(window).height()-20); 
					    //当文档窗口发生改变时 触发  
					    $(window).resize(function(){
						$("#map").height($(window).height()-20); 
					  });
					//统计
						        require.config({
					            paths: {
					                echarts: './assets/dist'
					            }
					        });
					        require(
					            [
					                'echarts',
									'echarts/theme/macarons',
					                'echarts/chart/map',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
					                //'echarts/chart/bar'
					            ],
					            function (ec,theme) {
					                var myChart = ec.init(document.getElementById('map'),theme);
									
									option = {
					    title : {
					        text: '疫情地图',
					        subtext:total ,
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'item'
					    },
					    legend: {
					        orient: 'vertical',
					        x:'left',
					        data:['疫情地图']
					    },
					    dataRange: {
					        x: 'left',
					        y: 'bottom',
					        splitList: [
					            {start: 1000},
					            {start: 500, end: 1000},
					            {start: 100, end: 499},
					            {start: 10, end: 200, label: '10 到 99'},
					            {end: 10}
					        ],
					        color: ['#920a03', '#d00101', '#df6962','#f2b49a','#ffd6c4']
					    },
					    toolbox: {
					        show: true,
					        orient : 'vertical',
					        x: 'right',
					        y: 'center',
					        feature : {
					            mark : {show: true},
					            dataView : {show: true, readOnly: false},
					            restore : {show: true},
					            saveAsImage : {show: true}
					        }
					    },
					    roamController: {
					        show: true,
					        x: 'right',
					        mapTypeControl: {
					            'china': true
					        }
					    },
					    series : [
					        {
					            name: '疫情地图',
					            type: 'map',
					            mapType: 'china',
					            roam: false,
					            itemStyle:{
					                normal:{
					                    label:{
					                        show:true,
					                        textStyle: {
					                           color: "rgb(249, 249, 249)"
					                        }
					                    }
					                },
					                emphasis:{label:{show:true}}
					            },
					            data:[
					                {name: data.newslist[0].provinceShortName,value: data.newslist[0].confirmedCount},
					                {name: data.newslist[1].provinceShortName,value: data.newslist[1].confirmedCount},
					                {name: data.newslist[2].provinceShortName,value: data.newslist[2].confirmedCount},
					                {name: data.newslist[3].provinceShortName,value: data.newslist[3].confirmedCount},
					                {name: data.newslist[4].provinceShortName,value: data.newslist[4].confirmedCount},
					                {name: data.newslist[5].provinceShortName,value: data.newslist[5].confirmedCount},
					                {name: data.newslist[6].provinceShortName,value: data.newslist[6].confirmedCount},
					                {name: data.newslist[7].provinceShortName,value: data.newslist[7].confirmedCount},
					                {name: data.newslist[8].provinceShortName,value: data.newslist[8].confirmedCount},
					                {name: data.newslist[9].provinceShortName,value: data.newslist[9].confirmedCount},
					                {name: data.newslist[10].provinceShortName,value: data.newslist[10].confirmedCount},
					                {name: data.newslist[11].provinceShortName,value: data.newslist[11].confirmedCount},
					                {name: data.newslist[12].provinceShortName,value: data.newslist[12].confirmedCount},
					                {name: data.newslist[13].provinceShortName,value: data.newslist[13].confirmedCount},
					                {name: data.newslist[14].provinceShortName,value: data.newslist[14].confirmedCount},
					                {name: data.newslist[15].provinceShortName,value: data.newslist[15].confirmedCount},
					                {name: data.newslist[16].provinceShortName,value: data.newslist[16].confirmedCount},
					                {name: data.newslist[17].provinceShortName,value: data.newslist[17].confirmedCount},
					                {name: data.newslist[18].provinceShortName,value: data.newslist[18].confirmedCount},
					                {name: data.newslist[19].provinceShortName,value: data.newslist[19].confirmedCount},
					                {name: data.newslist[20].provinceShortName,value: data.newslist[20].confirmedCount},
					                {name: data.newslist[21].provinceShortName,value: data.newslist[21].confirmedCount},
					                {name: data.newslist[22].provinceShortName,value: data.newslist[22].confirmedCount},
					                {name: data.newslist[23].provinceShortName,value: data.newslist[23].confirmedCount},
					                {name: data.newslist[24].provinceShortName,value: data.newslist[24].confirmedCount},
					                {name: data.newslist[25].provinceShortName,value: data.newslist[25].confirmedCount},
					                {name: data.newslist[26].provinceShortName,value: data.newslist[26].confirmedCount},
					                {name: data.newslist[27].provinceShortName,value: data.newslist[27].confirmedCount},
					                {name: data.newslist[28].provinceShortName,value: data.newslist[28].confirmedCount},
					                {name: data.newslist[29].provinceShortName,value: data.newslist[29].confirmedCount},
					                {name: data.newslist[30].provinceShortName,value: data.newslist[30].confirmedCount},
					                {name: data.newslist[31].provinceShortName,value: data.newslist[31].confirmedCount},
					                {name: data.newslist[32].provinceShortName,value: data.newslist[32].confirmedCount},
					                {name: data.newslist[33].provinceShortName,value: data.newslist[33].confirmedCount},
					            ]
					        }
					    ]
					};
									
									
									
										 myChart.setOption(option);
								})
								
					}
				});
		}); 
</script>
