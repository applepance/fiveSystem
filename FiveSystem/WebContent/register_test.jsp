<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.function.Login_Func" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册操作</title>
<%
request.setCharacterEncoding("utf-8");
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
String power=request.getParameter("power");

Login_Func login_Func=new Login_Func();
login_Func.save(uname, pwd, power);

session.setAttribute("uname", uname);
session.setAttribute("power", power);
response.sendRedirect(login_Func.logining_jump(uname,pwd));
%>
</head>
<body>

</body>
</html>