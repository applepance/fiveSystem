<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.function.Login_Func" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>改密码中</title>
<%
request.setCharacterEncoding("utf-8");
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");

Login_Func login_Func=new Login_Func();
login_Func.chang_pwd(uname,pwd);
String power=login_Func.select_power(uname, pwd);

if(power!="login_failure"){
	session.setAttribute("uname", uname);
	session.setAttribute("power", power);
}
response.sendRedirect(login_Func.logining_jump(uname,pwd));
%>
</head>
<body>

</body>
</html>