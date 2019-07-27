<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.Delnote" %>
    <%@ page import="cn.five.testsys.dao.DelnoteDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
int  dem_id=Integer.parseInt(request.getParameter("dem_id"));;
int star=Integer.parseInt(request.getParameter("radioLOVE"));
String evaluation=request.getParameter("evaluation");
DelnoteDao delnoteDao=new DelnoteDao();
Delnote delnote=delnoteDao.getDelnote_dem_id(dem_id);
delnote.setEvaluation(evaluation);
delnote.setStar(star);
delnoteDao.update_evaluation(delnote);
response.sendRedirect("index_Non.jsp");
%>
</head>
<body>

</body>
</html>