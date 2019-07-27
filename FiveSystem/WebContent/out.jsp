<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退出</title>
<%
session.setAttribute("uname", null);
session.setAttribute("power", null); 
response.sendRedirect("login.jsp");%>
</head>
<body>

</body>
</html>