<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/portal.base.min.css?v=162394246787d5d6" type="text/css"/>
    <link rel="stylesheet" href="https://static.guahao.cn/front/portal-pc-static/css/portal.basic.min.css?v=162394246787d5d6" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">

</head>
<body class="g-1200px g-page-1200">
<div id="g-wrapper" class="g-wrapper ">
    <div id="gc">
        <div class="gp-search g-container" id="g-cfg" data-page="expert_in" data-module="search"  data-loadpop="remind">
            <div id="g-breadcrumb">

            </div>
            <div class="filter-tip">
                <div class="filter-condition" id="J_SelCondition">
                </div>
                <span class="result-num">找到<strong id="J_ResultNum"> 2 </strong>位医生</span>
            </div>
            <!-- .results -->
            <div class="results">
                <!-- .filter -->
                <div class="filter-new indept-filter J_Filter">
                    <form name="fform" action="">
                        <div class="condition-wrap in-condition-wrap">
                            <div class="condition J_dt">
                                <div class="condition-title">医生职称</div>
                                <div class="condition-content condition-collapse J_CT">
                                    <ul>
                                        <li><a href="#"  class="J_Submit_A" data-code="SXYZ" data-val="主任医师" name="dt" monitor="fastorder_order,fastorder_order,doctor_level">主任医师</a></li>
                                        <li><a href="#"  class="J_Submit_A" data-code="SXYZ" data-val="副主任医师" name="dt" monitor="fastorder_order,fastorder_order,doctor_level">副主任医师</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="gfm-inline gfm-thin top">
                            <div class="gfm-field date-range J_DateRange" >
                                <label class="date-title">就诊日期：</label>
                                <span class="picker-mask g-datepicker">
                            <input type="date" id="date" name="ed" value="不限" style="width: auto" class="gfm-input gfm-input-s J_Submit J_DateF" data-code="SXRQF" />
                        </span>
                                <span class="picker-mask g-datepicker">
                            &nbsp;-&nbsp;<input type="time" id="time" name="edt" value="不限" style="width: auto" class="gfm-input gfm-input-s J_Submit J_DateT" data-code="SXRQT" />
                        </span>
                            </div>
                            <div class="hy-type">
                                <span class="tx"><i></i>特需门诊</span>
                                <span class="zj"><i></i>专家门诊</span>
                                <span class="pt"><i></i>普通门诊</span>
                                <span><i></i>不可约</span>
                            </div>
                        </div>
                        <input type="hidden" name="hdid" value="0c624b62-3bcb-4bc5-9c1d-13e94aee2824000" />
                        <input type="hidden" name="dt" value="all" />
                    </form>
                </div>
                <!-- end of .filter -->

                <!-- .doc-list -->
                <div class="list">
                    <div class="g-doctor-item2 g-clear to-margin">
                        <div class="g-doc-baseinfo g-left">
                            <a target="_blank"
                               onmousedown="return _smartlog(this,'DOCP_1')" class="img">
                                <img src="https://kano.guahao.cn/G8X2621305_image140.jpg" class="img"
                                     alt="张磊"
                                     onerror="this.src='';"/>

                            </a>
                            <dl>
                                <dt>
                                    <a  class="name js-doc"
                                       target="_blank" onmousedown="return _smartlog(this,'DOCN_1')">
                                        <em id="name1">张磊</em>
                                    </a>&nbsp;&nbsp;
                                    主任医师
                                </dt>
                                <dd>
                                    <span class="split"></span>
                                    <span class="split">  </span>
                                    <a
                                       onmousedown="return _smartlog(this,'DOCD')"
                                       target="_blank"
                                    >
                                        营养科门诊
                                    </a>
                                </dd>
                            </dl>
                        </div>
                        <div class="skill g-left">
                            <strong>擅长：</strong>
                            危重病、手术、慢性病、肥胖及孕产人群的营养治疗与调理。


                        </div>
                        <div class="num-info g-left">
                            <div class="stars">
                                暂无评分
                            </div>
                            <div class="count">
                                <span class="consult">暂无<br><em>问诊量</em></span>
                                <span>85<br><em>预约量</em></span>
                            </div>
                        </div>
                        <div class="action g-left">
                            <a target="_blank"  onclick="confirmAppointment($('#name1').text())" class="gbn gbt-blue">挂号</a>

                            <a target="_blank"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >问诊</a>
                        </div>
                    </div>
                    <div class="g-doctor-item2 g-clear to-margin">
                        <div class="g-doc-baseinfo g-left">
                            <a target="_blank"
                               onmousedown="return _smartlog(this,'DOCP_1')" class="img">
                                <img src="https://kano.guahao.cn/lGg2608467_image140.jpg" class="img"
                                     alt="於红梅"
                                     onerror="this.src='https://static.guahao.cn/img/character/doc-f-l.png?_=20121223';"/>

                            </a>
                            <dl>
                                <dt>
                                    <a  class="name js-doc"
                                       target="_blank" onmousedown="return _smartlog(this,'DOCN_1')">
                                        <em id="name2">於红梅</em>
                                    </a>&nbsp;&nbsp;
                                    副主任医师
                                </dt>
                                <dd>
                                    <span class="split"></span>
                                    <span class="split">  </span>
                                    <a
                                       onmousedown="return _smartlog(this,'DOCD')"
                                       target="_blank"
                                    >
                                        营养科门诊
                                    </a>
                                </dd>
                            </dl>
                        </div>
                        <div class="skill g-left">
                            <strong>擅长：</strong>
                            各类疾病的营养调理与治疗


                        </div>
                        <div class="num-info g-left">
                            <div class="stars">
                                暂无评分
                            </div>
                            <div class="count">
                                <span class="consult">暂无<br><em>问诊量</em></span>
                                <span>10<br><em>预约量</em></span>
                            </div>
                        </div>
                        <div class="action g-left">
                            <a target="_blank" onclick="confirmAppointment($('#name2').text())"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-blue"
                            >挂号</a>
                            <a target="_blank"
                               onmousedown="return _smartlog(this,'DOCP_1')"
                               class="gbn gbt-off"
                            >问诊</a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of .results -->
        </div>
        <!-- end of .gp-search -->
    </div>
<script type="text/javascript">
function confirmAppointment(doctor) {
    var province= '${province}';
    var city= '${city}';
    var hospital= '${hospital}';
    var department= '${department}';
    var date= $("#date").val();
    var time= $("#time").val();
    if (date!=""&&time!=""){
        console.log(province,city,hospital,department,doctor,date,time);
        layer.confirm('您确定'+date+' '+time+'在'+hospital+'的'+department+'预约挂号'+doctor+'医生？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            var newData = "{'province':'" + province + "','city':'" + city + "','hospital':'" + hospital + "'," +
                "'department':'" + department + "','doctor':'" + doctor + "','date':'" + date + "','time':'" + time + "'}";
            var url = "${pageContext.request.contextPath }/appointment/addAppointment";
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                url: url,
                data: newData,
                success: function (result) {
                    if(result.status == 1){
                        layer.msg('预约成功');
                    }
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });

        }, function(){
            layer.msg('预约失败');
        });
    }else {
        layer.msg('请选择就诊日期');
    }

}
</script>
</body>
</html>