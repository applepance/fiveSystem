<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Message" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.MessageDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int req_id=Integer.parseInt(request.getParameter("req_id"));
ReqInfoDao reqInfoDao=new ReqInfoDao();
ReqInfo reqInfo=reqInfoDao.getReqInfo_req_id(req_id);
reqInfo.setManage_id(404);
int i;
i=reqInfoDao.updateManage_id(reqInfo);

MessageDao messageDao=new MessageDao();
Message message=new Message();
message.setUid(reqInfo.getReq_uid());
message.setReq_id(reqInfo.getReq_id());
message.setDem_id(0);
messageDao.save(message);

response.sendRedirect("select_requisition.jsp?req_id="+req_id);
%>
</body>
</html>