<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Message" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.MessageDao" %>
    <%@ page import="java.util.List" %>
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
ReqInfo reqInfo=new ReqInfo();
UserDao userDao=new UserDao();
User user=userDao.getUser_string((String)session.getAttribute("uname"));
reqInfo.setReq_id(req_id);
reqInfo.setDep_id(user.getUid());
int i;
i=reqInfoDao.updateDep_id(reqInfo);

MessageDao messageDao=new MessageDao();
Message message=new Message();
List<User> list=userDao.getUser_power("King");
int size=list.size();
for(int temp=0;temp<size;temp++){
	user=list.get(temp);
	message.setUid(user.getUid());
	message.setReq_id(reqInfo.getReq_id());
	message.setDem_id(0);
	messageDao.save(message);
}

response.sendRedirect("select_requisition.jsp?req_id="+req_id);
%>

</body>
</html>