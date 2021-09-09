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
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
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
                        <div class="hd"><h3 class="hd-title">社区代办</h3>
                            <p class="hd-sub-title">为群众提供政策咨询、业务帮办指导、特殊人群代办服务</p>
                        </div>
                        <div class="bd">
                            <div class="bd-item bd-fast-filter"><p class="title">代办</p>
                                <p>指在接受申请人咨询、协助准备齐全材料后，代办人员到相关窗口办理业务。</p></div>
                            <div class="bd-item bd-fit-people"><p class="title">适用人群</p>
                                <p>社区全部人群</p></div>
                        </div>
                        <div class="fastorder-ads">
                            <div class="hide" id="J_AdsBox"></div>
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath }/appointment/addAssistant" id="addAssistant" enctype="multipart/form-data" method="post">
                        <div class="fastorder-main"><input type="hidden" name="jklj" value="0"/>
                            <div class="tips">温馨提醒：费用由相关机构自行设定，平台不收取任何额外费用</div>
                            <div class="g-fastorder-box">
                                <div class="row g-clear"><label style="width: auto">代办项目：</label><select id="assistant" class="province js-province"
                                                                                                         name="assistant">
                                    <option value="">请选择...</option>
                                </select></div>

                                <div class="row g-clear"><label style="width: auto;">全部材料：</label>
                                    <input id="allFile" type="file" name="allFile">
                                </div>

                                <div class="gfm-actions"><a href="javascript:confirmSubmit();" class="gbn gbt-green js-btn"
                                                            monitor="fastorder,fastorder,fast_order">申请代办</a></div>
                                <div class="footer-msg"></div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<input id="result" value="${result}" type="hidden"  />
<script type="text/javascript">
    function confirmSubmit(){
        var assistant=$("#assistant option:selected").text();
        if (assistant!="请选择..."){
            //window.location.href="${pageContext.request.contextPath }/doctorRoom/confirm?province="+province+"&city="+city+"&project="+project+"&appointmentTime="+appointmentTime+"";
            layer.confirm('您确定申请代办'+assistant+'项目？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                $("#addAssistant").submit();
            });

        }else {
            layer.msg('请选择完整信息');
        }
    }

    $(document).ready(function() {
        getAssistant();
        if ($("#result").val()!=""){
            layer.msg($("#result").val());
        }
    });


    function getAssistant() {
        // var newData = "{'applyId':'" + applyId + "'}";
        var url = "${pageContext.request.contextPath }/appointment/getAssistant";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            // data: newData,
            success: function (result) {
                var assistantsList=result.data;
                for(var i=0;i<assistantsList.length;i++){
                    var id=assistantsList[i].id;
                    var assistantName=assistantsList[i].codeValue;
                    var option="<option value="+assistantName+">"+assistantName+"</option>";
                    $("#assistant").append(option);
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }


</script>
</body>
</html>