<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" id="templatecss" type="text/css" href="${pageContext.request.contextPath }/static/css/basic-grey.css">
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">
</head>

<body>

<form action="" method="post" class="basic-grey">

    <h1>健康信息填报

        <span>Health information filling</span>

    </h1>



    <label>

        <span>姓  名:</span>

        <input id="name" type="text" name="name" placeholder="请填写姓名" />

    </label>

    <label>

        <span>身份证号:</span>

        <input id="idNumber" type="text" name="idNumber" placeholder="请填写身份证号" />

    </label>



    <label>

        <span>手机号:</span>

        <input id="phoneNumber" type="text" name="phoneNumber" placeholder="请填写手机号"/>

    </label>

    <label>

        <span>本人身体情况:</span>
        <select name="PhysicalCondition" id="PhysicalCondition" >
            <option value="-1">请选择</option>
            <option value="正常">正常</option>
            <option value="异常">异常</option>
        </select>

    </label>

    <label>

        <span>体温:</span>
        <select name="temperature" id="temperature" >
            <option value="-1">请选择</option>
            <option value="35.0">35.0</option>
            <option value="35.0">35.1</option>
            <option value="35.0">35.2</option>
            <option value="35.0">35.3</option>
            <option value="35.0">35.4</option>
            <option value="35.0">35.5</option>
            <option value="35.0">35.6</option>
            <option value="35.0">35.7</option>
            <option value="35.0">35.8</option>
            <option value="35.0">35.9</option>
            <option value="35.0">36.0</option>
            <option value="35.0">36.1</option>
            <option value="35.0">36.2</option>
            <option value="35.0">36.3</option>
            <option value="35.0">36.4</option>
            <option value="35.0">36.5</option>
            <option value="35.0">36.6</option>
            <option value="35.0">36.7</option>
            <option value="35.0">36.8</option>
            <option value="35.0">36.9</option>
            <option value="35.0">37.0</option>
            <option value="35.0">37.1</option>
            <option value="35.0">37.2</option>
            <option value="35.0">37.3</option>
            <option value="35.0">37.4</option>
            <option value="35.0">37.5</option>
            <option value="35.0">37.6</option>
            <option value="35.0">37.7</option>
            <option value="35.0">37.8</option>
            <option value="35.0">37.9</option>
            <option value="35.0">38.0</option>
            <option value="35.0">38.1</option>
            <option value="35.0">38.2</option>
            <option value="35.0">38.3</option>
            <option value="35.0">38.4</option>
            <option value="35.0">38.5</option>
            <option value="35.0">38.6</option>
            <option value="35.0">38.7</option>
            <option value="35.0">38.8</option>
            <option value="35.0">38.9</option>
            <option value="35.0">39.0</option>
            <option value="35.0">39.1</option>
            <option value="35.0">39.2</option>
            <option value="35.0">39.3</option>
            <option value="35.0">39.4</option>
            <option value="35.0">39.5</option>
            <option value="35.0">39.6</option>
            <option value="35.0">39.7</option>
            <option value="35.0">39.8</option>
            <option value="35.0">39.9</option>
            <option value="35.0">40.0</option>
            <option value="35.0">40.1</option>
            <option value="35.0">40.2</option>
            <option value="35.0">40.3</option>
            <option value="35.0">40.4</option>
            <option value="35.0">40.5</option>
            <option value="35.0">40.6</option>
            <option value="35.0">40.7</option>
            <option value="35.0">40.8</option>
            <option value="35.0">40.9</option>
            <option value="35.0">41.0</option>
            <option value="35.0">41.1</option>
            <option value="35.0">41.2</option>
            <option value="35.0">41.3</option>
            <option value="35.0">41.4</option>
            <option value="35.0">41.5</option>
            <option value="35.0">41.6</option>
            <option value="35.0">41.7</option>
            <option value="35.0">41.8</option>
            <option value="35.0">41.9</option>
            <option value="35.0">42.0</option>
        </select>

    </label>

    <label>

        <span>最近是否接触过确诊病例或疑似病例:</span>
        <select name="isContact" id="isContact" >
            <option value="-1">请选择</option>
            <option value="是">是</option>

            <option value="否">否</option>

            <option value="不确定">不确定</option>

        </select>

    </label>

    <label>
        <span>填报时间:</span>
        <input id="fillTime" type="date" name="fillTime" placeholder="请选择填报时间"/>
    </label>


    <label>

        <span>&nbsp;</span>

        <input type="button" class="button" onclick="send()" value="提交" />

    </label>

</form>

<script>

    function send() {
        var name=$("#name").val();
        var idNumber=$("#idNumber").val();
        var phoneNumber=$("#phoneNumber").val();
        var PhysicalCondition=$("#PhysicalCondition option:selected").val();
        var temperature=$("#temperature option:selected").val();
        var isContact=$("#isContact option:selected").val();
        var fillTime=$("#fillTime").val();
        var json = {};
        json.name=name;
        json.idNumber=idNumber;
        json.phoneNumber=phoneNumber;
        json.PhysicalCondition=PhysicalCondition;
        json.temperature=temperature;
        json.isContact=isContact;
        json.fillTime=fillTime;

        var url = "${pageContext.request.contextPath }/healthInfo/addHealthInfo";
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            url: url,
            data: JSON.stringify(json),
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
    }

</script>

</body>

</html>