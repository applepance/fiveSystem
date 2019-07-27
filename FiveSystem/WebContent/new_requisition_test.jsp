<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.UserCheck" %>
    <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.Message" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.UserCheckDao" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.MessageDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申请单提交中——少女祈祷中</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
GoodDao goodDao=new GoodDao();
List<Good> list=goodDao.getGood_allwait("waiting");
int countaid = list.size();
int i=0;


String tit=request.getParameter("tit");
String note=request.getParameter("note");
	String uname=(String)session.getAttribute("uname");
	UserDao userDao=new UserDao();
	User user=userDao.getUser_string(uname);
int req_uid=user.getUid();
ReqInfoDao reqInfoDao=new ReqInfoDao();
ReqInfo reqInfo=new ReqInfo();
reqInfo.setTit(tit);
reqInfo.setNote(note);
reqInfo.setReq_uid(req_uid);
reqInfoDao.save(reqInfo);
reqInfo=reqInfoDao.getReqInfo_tit(tit);
while(i<countaid){
	Good good=list.get(i);
	i +=1;
	if(request.getParameter(good.getGname())!=null){
		ReqGoodDao reqGoodDao=new ReqGoodDao();
		ReqGood reqGood=new ReqGood();
		reqGood.setReq_id(reqInfo.getReq_id());
		int req_num=Integer.parseInt(request.getParameter(String.valueOf(good.getGid())));
		reqGood.setReq_num(req_num);
		reqGood.setGid(good.getGid());
		reqGoodDao.save(reqGood);
	}
}
UserCheckDao userCheckDao=new UserCheckDao();
UserCheck userCheck=userCheckDao.getUserCheck_ass(req_uid);
MessageDao messageDao=new MessageDao();
Message message=new Message();
message.setUid(userCheck.getLeader_id());
message.setReq_id(reqInfo.getReq_id());
message.setDem_id(0);
messageDao.save(message);
message.setUid(user.getUid());
message.setReq_id(reqInfo.getReq_id());
message.setDem_id(0);
messageDao.save(message);
response.sendRedirect("index_Non.jsp");
%>

</body>
</html>