<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet"
          href="https://static.guahao.cn/front/portal-pc-static/css/portal.base.min.css?v=162394246787d5d6"
          type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/fastorder.css?v=162394246787d5d6"
          type="text/css"/>
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">
</head>
<body class="g-1200px g-page-1200">
<div id="g-wrapper" class="g-wrapper ">
    <div id="gc">
        <div class="gp-fastorder" id="g-cfg">
            <div class="g-container">
                <div class="fastorder-wrap">
                    <div class="fastorder-left">
                        <div class="hd"><h3 class="hd-title">上门服务</h3>
                            <p class="hd-sub-title">服务仍处于试运行阶段，所有服务项目均打折优惠，有需要的市民可以下单体验</p>
                        </div>
                        <div class="bd">
                            <div class="bd-item bd-fast-filter"><p class="title">快速筛选</p>
                                <p>根据区域、护理项目快速筛选对应的网约护士</p></div>
                            <div class="bd-item bd-fit-people"><p class="title">适用人群</p>
                                <p>高龄或失能或半失能老年人、母婴、特殊病患、行动不便等人群</p></div>
                        </div>
                        <div class="fastorder-ads">
                            <div class="hide" id="J_AdsBox"></div>
                        </div>
                    </div>
                    <div class="fastorder-main"><input type="hidden" name="jklj" value="0"/>
                        <div class="tips">温馨提醒：费用由医院自行设定，平台不收取任何额外费用</div>
                        <div class="g-fastorder-box">
                            <div class="row g-clear"><label>地区：</label><select id="province" class="province js-province"
                                                                               name="province">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>&nbsp;</label><select id="city" class="city js-city disabled"
                                                                               disabled="disabled" name="city">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>项目：</label><select id="project" class="js-hospital disabled"
                                                                               disabled="disabled" name="hospital">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>时间：</label>
                                <input type="datetime-local" id="appointmentTime"   style="width: auto" class="gfm-input gfm-input-s J_Submit J_DateF" data-code="SXRQF" />
                            </div>
                            <div class="row g-clear"><label>地址：</label>
                                <input type="text" id="address"   style="width: auto" class="gfm-input gfm-input-s J_Submit J_DateF" data-code="SXRQF" />
                            </div>
                            <div class="gfm-actions"><a href="javascript:sendDoctors();" class="gbn gbt-green js-btn"
                                                        monitor="fastorder,fastorder,fast_order">预约上门</a></div>
                            <div class="footer-msg"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function sendDoctors(){
        var province=$("#province option:selected").text();
        var city=$("#city option:selected").text();
        var project=$("#project option:selected").text();
        var appointmentTime=$("#appointmentTime").val();
        var address=$("#address").val();
        console.log(province,city,project,appointmentTime,address);
        if (province!="请选择..."&&city!="请选择..."&&project!="请选择..."&&appointmentTime!=""){
            //window.location.href="${pageContext.request.contextPath }/doctorRoom/confirm?province="+province+"&city="+city+"&project="+project+"&appointmentTime="+appointmentTime+"";
            layer.confirm('您确定预约'+project+'项目，在'+appointmentTime+'的'+address+'？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                var newData = "{'province':'" + province + "','city':'" + city + "','project':'" + project + "','appointmentTime':'" + appointmentTime + "','address':'" + address + "'}";
                var url = "${pageContext.request.contextPath }/doctorRoom/confirm";
                $.ajax({
                    type: "POST",
                    contentType: "application/json;charset=UTF-8",
                    url: url,
                    data: newData,
                    success: function (result) {
                        if(result.status==1){
                            layer.msg('预约成功');
                        }else {
                            layer.msg('预约失败');
                        }
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                    }
                });
            });

        }else {
            layer.msg('请选择完整信息');
        }
    }

    $(document).ready(function() {
        getProvince();

    });

    $("#city").change(function(){
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getProjects";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                $("#project").empty();
                $("#department").empty();
                $('#project').removeAttr("disabled");
                var option1="<option value=''>请选择...</option>";
                $("#project").append(option1);
                var projectlList=result.data;
                for(var i=0;i<projectlList.length;i++){
                    var id=projectlList[i].id;
                    var name=projectlList[i].codeValue;
                    var option="<option value="+id+">"+name+"</option>";
                    $("#project").append(option);
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    });

    function getProvince() {
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getProvinces";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                var provincesList=result.data;
                for(var i=0;i<provincesList.length;i++){
                    var id=provincesList[i].id;
                    var provinceName=provincesList[i].codeValue;
                    var option="<option value="+id+">"+provinceName+"</option>";
                    $("#province").append(option);
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
    $(function () {
        $("#province").change(function(){
            var id=$("#province").val();
            var newData = "{'id':'" + id + "'}";
            var url = "${pageContext.request.contextPath }/appointment/getCitys";
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                url: url,
                data: newData,
                success: function (result) {
                    $("#city").empty();
                    $("#hospital").empty();
                    $("#department").empty();
                    $('#city').removeAttr("disabled");
                    var option1="<option value=''>请选择...</option>";
                    $("#city").append(option1);
                    $("#hospital").append(option1);
                    $("#department").append(option1);
                    var citysList=result.data;
                    for(var i=0;i<citysList.length;i++){
                        var cityId=citysList[i].id;
                        var cityName=citysList[i].codeValue;
                        var option="<option value="+cityId+">"+cityName+"</option>";
                        $("#city").append(option);
                    }
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        });
    });

</script>
</body>
</html>