<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>采购</title>
 <script type="text/javascript">
function not_empty(){
	var gname=form1.gname.value;
	if(gname==""){
		alert("不能为空");
		form1.gname.focus();
		return false;
		}
	var gnum=form1.gnum.value;
	if(gnum==""){
		alert("不能为空");
		form1.gnum.focus();
		return false;
		}
	var gtype=form1.gtype.value;
	if(gtype==""){
		alert("不能为空");
		form1.gtype.focus();
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
        background: url(./images/new_goods.jpg);
        background-color: black;
        background-size: 100% 100%;
        position: absolute;
    }
.test{
    font-size: 20px;color: white;

}
</style>
</head>

<body>
    <div class="test">
    <form action="new_goods_test.jsp" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
    	<p>需求单号：<input style="width:30px;" type="text" name="dem_id" placeholder="单号" maxlength="50" autocomplete="off" class=""></p>
    	<p>物品名：
    	<input type="text" name="gname" placeholder="物品名" maxlength="50" autocomplete="off" class="">
       	 </p>
       	 <p>数量：<input style="width:30px;" type="text" name="gnum" placeholder="数量" maxlength="50" autocomplete="off" class=""></p>
       	 <p>类型：<input style="width: 60px;" type="text" name="gtype" placeholder="类型" maxlength="50" autocomplete="off" class=""></p>
       	 <input type="submit" class="btn btn-login" value="采购">
    </form>
    </div>
</body>
</html>