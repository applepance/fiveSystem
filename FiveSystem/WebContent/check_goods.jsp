<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询物资库</title>
<script type="text/javascript">
function not_empty(){
	var gname=form1.gname.value;
	if(gname==""){
		alert("不能为空");
		form1.gname.focus();
		return false;
		}
	return true;
}
</script>
<style>
    html{
        height:100%;
    }
    body{
        background: url(./images/check_goods.jpg);
        background-color: white;
        background-size: 100% 100%;
        height: 100%;
        width: 100%;
        position: absolute;

    }
    p{
        font-size: 20px;
    }
    .test{
        margin: 0 auto;
        width: 150px;
        height: 100px;
        border: 1px solid black;
        position: absolute;

    }

</style>
<%
request.setCharacterEncoding("utf-8");
String gname="";
Good good=new Good();
if(request.getParameter("gname")!=null){
	gname=request.getParameter("gname");
	GoodDao goodDao=new GoodDao();
	good=goodDao.getGood_gname(gname);
}
%>
</head>
<body>
	<form action="check_goods.jsp" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
    	<div>
       	 	<p>物资名称：<input type="text" value="" name="gname" placeholder="物品名" maxlength="50" autocomplete="off" class="">
       	 	</p>
       	 	<input type="submit" class="btn btn-login" value="查询">
   	 	</div>
    </form>
    <div class="test">
        <p><%=gname %>：</p><%=good.getGnum() %>
    </div>
</body>
</html>