<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Demand" %>
    <%@ page import="cn.five.testsys.entity.Message" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.DemandDao" %>
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
reqInfo.setManage_id(user.getUid());
int i;
i=reqInfoDao.updateManage_id(reqInfo);

MessageDao messageDao=new MessageDao();
Message message=new Message();
List<User> list=userDao.getUser_power("Knight");
int size=list.size();
DemandDao demandDao=new DemandDao();
Demand demand=new Demand();
demand.setReq_id(req_id);
int t=demandDao.save(demand);
demand=demandDao.getDemand_req_id(req_id);

for(int temp=0;temp<size;temp++){
	user=list.get(temp);
	message.setUid(user.getUid());
	message.setReq_id(0);
	message.setDem_id(demand.getDem_id());
	messageDao.save(message);
}

response.sendRedirect("select_requisition.jsp?req_id="+req_id);
%>

</body>
</html>