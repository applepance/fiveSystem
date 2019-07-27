<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>资产管理员评价</title>
<script type="text/javascript">
function not_empty(){
	var dem_id=form1.dem_id.value;
	if(dem_id==""){
		alert("不能为空");
		form1.dem_id.focus();
		return false;
		}
	var evaluation=form1.evaluation.value;
	if(evaluation==""){
		alert("不能为空");
		form1.evaluation.focus();
		return false;
		}
	var radioLOVE=form1.radioLOVE.value;
	if(radioLOVE==""){
		alert("不能为空");
		return false;
		}
	return true;
}
</script>
    <style>
            html{
                height: 100%;
            }
            body{
                background: url(./images/recovery.jpg);
                background-color: black;
                background-size: 100% 100%;
                position: absolute;
            }
        a{
            top: 150%;
            position: absolute;
            font-size: 20px;
        
        }
        p{
            font-size: 20px;
        }
        </style>
</head>
<body>
        <div>
                <h1>资产管理员操作</h1>
                <h2>归口部门对回收的资源完整性作出评价</h2>
                <form action="recovery_test.jsp" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
                <p>需求单号：<input type="text" name="dem_id"></p>
                <p>评价：<textarea name="evaluation" placeholder="评价" class=""></textarea>
                </p>
                <input type="radio" name="radioLOVE" value="1">非常不满意
                <input type="radio" name="radioLOVE" value="2">不满意
                <input type="radio" name="radioLOVE" value="3">一般
                <input type="radio" name="radioLOVE" value="4">满意
                <input type="radio" name="radioLOVE" value="5">非常满意
                <input type="submit" value="回收">
                </form>
         </div>
</body>
</html>