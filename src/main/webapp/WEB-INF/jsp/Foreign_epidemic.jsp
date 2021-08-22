<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Fav  Icon Link -->
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/static/images/fav.png">
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css">
	<!-- themify icons CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/themify-icons.css">
	<!-- Animations CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/animate.css">
	<!-- Main CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/styles.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/green.css" id="style_theme">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/responsive.css">
	<!-- morris charts -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/charts/css/morris.css">
	<!-- jvectormap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/jquery-jvectormap.css">
	<script src="${pageContext.request.contextPath }/static/js/modernizr.min.js"></script>
</head>
<body>

			<div class="container home">
				<div class="row">
					<!-- Widget Item -->
					<div class="col-md-6">
						<div class="widget-area lochana-box-shadow color-red">
							<div class="widget-left">
								<span class="ti-user"></span>
							</div>
							<div class="widget-right">
								<h4 class="wiget-title">累计确诊病例</h4>
								<span class="numeric color-red" id="confirmedCountsum"></span>
							</div>
						</div>
					</div>
					<!-- Widget Item -->
					<!-- Widget Item -->
					<div class="col-md-6">
						<div class="widget-area lochana-box-shadow color-red">
							<div class="widget-left">
								<span class="ti-user"></span>
							</div>
							<div class="widget-right">
								<h4 class="wiget-title">现有确诊病例</h4>
								<span class="numeric color-red" id="currentConfirmedCount"></span>
							</div>
						</div>
					</div>
					<!-- /Widget Item -->
					<!-- Widget Item -->
					<div class="col-md-6">
						<div class="widget-area lochana-box-shadow color-green">
							<div class="widget-left">
								<span class="ti-user"></span>
							</div>
							<div class="widget-right">
								<h4 class="wiget-title">累计治愈病例</h4>
								<span class="numeric color-green" id="curedCountsum"></span>
							</div>
						</div>
					</div>
					<!-- /Widget Item -->
					<!-- Widget Item -->
					<div class="col-md-6">
						<div class="widget-area lochana-box-shadow color-black">
							<div class="widget-left">
								<span class="ti-user"></span>
							</div>
							<div class="widget-right">
								<h4 class="wiget-title">累计死亡病例</h4>
								<span class="numeric color-black" id="deadCountsum"></span>
							</div>
						</div>
					</div>
					<!-- /Widget Item -->
				</div>

				<div class="row">
					<!-- Widget Item -->
					<div class="col-md-6">
						<div class="widget-area-2 lochana-box-shadow">
							<h3 class="widget-title">各大洲疫情程度占比</h3>
							<div id="donutMorris" class="chart-home"></div>
						</div>
					</div>
					<!-- /Widget Item -->
					<!-- Widget Item -->
					<div class="col-md-6">
						<div class="widget-area-2 lochana-box-shadow">
							<h3 class="widget-title">重点疫情国家</h3>
							<div id="barMorris" class="chart-home"></div>
						</div>
					</div>
					<!-- /Widget Item -->
				</div>
			</div>
		</div>
		<!-- /Page Content -->
	</div>
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top">
		<span class="ti-angle-up"></span>
	</a>
	<!-- /Back to Top -->
	<!-- Jquery Library-->
	<script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/charts/js/raphael-min.js"></script>
	<script src="${pageContext.request.contextPath }/static/charts/js/morris.min.js"></script>
</body>
<script>
$(document).ready(function(){
	  var USA=0;
	  var ITA=0;
	  var ESP=0;
	  var DEU=0;
	  var GBR=0;
	  $.ajax({
			type : "POST",
			url : "https://api.tianapi.com/txapi/ncovabroad/index?key=7dcef006b46a8fc296af6b3266cf6a10",
			success : function(data) {
				var confirmedCountsum=0;
				var curedCountsum=0
				var deadCountsum=0;
				var currentConfirmedCount=0;
				
				var Asia=0;
				var Europe=0;
				var Africa=0;
				var SouthAmerica=0;
				var NorthAmerica=0;
				var Oceania=0;
				var Antarctica=0;
				$.each(data.newslist,function(i,pro){
					currentConfirmedCount=currentConfirmedCount+pro.currentConfirmedCount;
					confirmedCountsum=confirmedCountsum+pro.confirmedCount;
					curedCountsum=curedCountsum+pro.curedCount;
					deadCountsum=deadCountsum+pro.deadCount;
					if(pro.countryShortCode=='USA'){
						USA=pro.confirmedCount;
					}else if(pro.countryShortCode=='IND'){
						IND=pro.confirmedCount;
					}else if(pro.countryShortCode=='ESP'){
						ESP=pro.confirmedCount;
					}else if(pro.countryShortCode=='DEU'){
						DEU=pro.confirmedCount;
					}else if(pro.countryShortCode=='GBR'){
						GBR=pro.confirmedCount;
					}
					
					if(pro.continents=='亚洲'){
						Asia=Asia+pro.confirmedCount;
					}else if(pro.continents=='欧洲'){
						Europe=Europe+pro.confirmedCount;
					}else if(pro.continents=='非洲'){
						Africa=Africa+pro.confirmedCount;
					}else if(pro.continents=='南美洲'){
						SouthAmerica=SouthAmerica+pro.confirmedCount;
					}else if(pro.continents=='北美洲'){
						NorthAmerica=NorthAmerica+pro.confirmedCount;
					}else if(pro.continents=='大洋洲'){
						Oceania=Oceania+pro.confirmedCount;
					}else if(pro.continents=='南极洲'){
						Antarctica =Antarctica+pro.confirmedCount;
					}
				}); 
				$("#confirmedCountsum").html(confirmedCountsum+"例"); 
				$("#curedCountsum").html(curedCountsum+"例"); 
				$("#deadCountsum").html(deadCountsum+"例"); 
				$("#currentConfirmedCount").html(currentConfirmedCount+"例"); 
				  //barmorris
				  var ctx = document.getElementById("barMorris");
				  if (ctx === null) return;
				  var chart = Morris.Bar({
				    element: 'barMorris',
				    data: [{
				      y: '美国',
				      a: USA
				    }, {
					      y: '德国',
					      a: DEU
					    }, {
							  y: '西班牙',
							  a: ESP
							}, {
						  y: '英国',
						  a: GBR
						}, {
						      y: '意大利',
						      a: ITA
							}],
				    xkey: 'y',
				    ykeys: ['a'],
				    labels: ['累计确诊人数'],
				    barColors: ['#FF7D00'],
				    barOpacity: 1,
				    barSizeRatio: 0.5,
				    hideHover: 'auto',
				    gridLineColor: '#eef0f2',
				    resize: true
				  });
				  
				  
				  if($("#donutMorris").length == 1){
					   var $donutData = [
					    { label: "亚洲", value: Asia },
					    { label: "欧洲", value: Europe },
					    { label: "非洲", value: Africa },
					    { label: "南美洲", value: SouthAmerica },
					    { label: "北美洲", value: NorthAmerica },
					    { label: "大洋洲", value: Oceania }
					  ];
					  Morris.Donut({
					    element: 'donutMorris',
					    data: $donutData,
					    barSize: 0.1,
					    labelColor: '#3e5569',
					    resize: true, //defaulted to true
					    colors: ['#ef6e6e', '#22c6ab', "#00a65a","#ff9900","#990000","#6B238E"]
					  });
					  }
			},
			error : function(q, w, e) {
				alert(q + w + e);
			}
		});

});

</script>
</html>