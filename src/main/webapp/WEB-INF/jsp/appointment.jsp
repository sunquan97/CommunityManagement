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
                        <div class="hd"><h3 class="hd-title">预约挂号</h3>
                            <p class="hd-sub-title">帮助普通患者快速找到选定条件下可预约的专家</p>
                            <p class="hd-tip">(目前只支持<em>部分</em>医院)</p></div>
                        <div class="bd">
                            <div class="bd-item bd-fast-filter"><p class="title">快速筛选</p>
                                <p>根据区域、医院、科室快速筛选对应班次</p></div>
                            <div class="bd-item bd-fit-people"><p class="title">适用人群</p>
                                <p>未确定具体病症，希望尽快就医确诊的普通患者</p></div>
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
                            <div class="row g-clear"><label>医院：</label><select id="hospital" class="js-hospital disabled"
                                                                               disabled="disabled" name="hospital">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="row g-clear"><label>科室：</label><select id="department" class="js-dept disabled"
                                                                               disabled="disabled" name="hdid">
                                <option value="">请选择...</option>
                            </select></div>
                            <div class="gfm-actions"><a href="javascript:appointment();" class="gbn gbt-green js-btn"
                                                        monitor="fastorder,fastorder,fast_order">预约挂号</a></div>
                            <div class="footer-msg"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function appointment(){
        var province=$("#province option:selected").text();
        var city=$("#city option:selected").text();
        var hospital=$("#hospital option:selected").text();
        var department=$("#department option:selected").text();
        console.log(province,city,hospital,department);
        if (province!="请选择..."&&city!="请选择..."&&hospital!="请选择..."&&department!="请选择..."){
            window.location.href="${pageContext.request.contextPath }/appointment/confirm?province="+province+"&city="+city+"&hospital="+hospital+"&department="+department+"";
        }else {
            layer.msg('请选择完整信息');
        }
    }

    $(document).ready(function() {
        getProvince();

    });
    $("#hospital").change(function(){
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getDepartment";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                $("#department").empty();
                $('#department').removeAttr("disabled");
                var option1="<option value=''>请选择...</option>";
                $("#department").append(option1);
                var departmentList=result.data;
                for(var i=0;i<departmentList.length;i++) {
                    var id = departmentList[i].id;
                    var departName = departmentList[i].departName;
                    var flag = departmentList[i].flag;
                    if (flag == 0) {
                        var option = "<optgroup label=" + departName + " style='font-family;'> </optgroup>";
                        $("#department").append(option);
                    } else {
                        var option = "<option value=" + id + ">" + departName + "</option>";
                        $("#department").append(option);
                    }
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    });

    $("#city").change(function(){
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getHospital";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                $("#hospital").empty();
                $("#department").empty();
                $('#hospital').removeAttr("disabled");
                var option1="<option value=''>请选择...</option>";
                $("#hospital").append(option1);
                $("#department").append(option1);
                var hospitalList=result.data;
                for(var i=0;i<hospitalList.length;i++){
                    var id=hospitalList[i].id;
                    var name=hospitalList[i].name;
                    var option="<option value="+id+">"+name+"</option>";
                    $("#hospital").append(option);
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