<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="cn.five.testsys.function.Login_Func" %>
     <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>未完成申请单</title>
<%
Login_Func login_Func=new Login_Func();
if(session.getAttribute("power")==null){
	response.sendRedirect("login.jsp");
}else{
	if(session.getAttribute("power")!="Non"){
		response.sendRedirect(login_Func.check_power((String)session.getAttribute("power")));
	}
} %>
    <style>
    html{
        height: 100%;
    }
    body
    {
        background: url(./images/check_requisition.jpg);
        background-color: black;
        background-size: 100% 100%;
        position: absolute;
        width: 100%;
        height: 100%;
    }
    .div{
        font-size: 20px;
        position: absolute;
        left: 28.7%;
        top:20%; 
      transform: translate(-50%,0%);
    } 
    p{
        font-size: 20px;
        
    
        
    }
    .test{
        transform: translate(-50%,0%);
        position: absolute;
        left: 30%;
        top:25%;
    }
    </style>
</head>
<body>
        <div class="div" style="text-align:center">
                单名:
            </div>
        <div class="test">
                <p>电脑:</p>
                <p>桌子:</p>
                <p>备注:</p>
                <p>     <a href="">修改</a> <a href="">删除</a> </p>
        </div>
</body>
</html>