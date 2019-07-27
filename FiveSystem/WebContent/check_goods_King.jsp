<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.Good"%>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已占用物资</title>
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
</head>
<body>
<%
GoodDao goodDao=new GoodDao();
Good good=new Good();
List<Good> list=goodDao.getGood_allwait("in-use");
for(int i=0;i<list.size();i++){
	good=list.get(i);
	%>
	<div class="test">
        <p><%=good.getGname() %>：</p><%=good.getGnum() %>
    </div>
	
	<%
}
%>

</body>
</html>