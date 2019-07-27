<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Demand" %>
    <%@ page import="cn.five.testsys.entity.Delnote" %>
    <%@ page import="cn.five.testsys.entity.Message" %>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.DemandDao" %>
    <%@ page import="cn.five.testsys.dao.DelnoteDao" %>
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
request.setCharacterEncoding("utf-8");
int dem_id=0;
String tit="";
int req_id;
DemandDao demandDao=new DemandDao();
Demand demand=new Demand();
ReqInfoDao reqInfoDao=new ReqInfoDao();
ReqGoodDao reqGoodDao=new ReqGoodDao();
ReqInfo reqInfo=new ReqInfo();
reqInfo.setTit("");
List<ReqGood> list=null;
UserDao userDao=new UserDao();
User user=new User();
user.setUname("");
if(request.getParameter("dem_id")!=null){
	dem_id=Integer.parseInt(request.getParameter("dem_id"));
	user=userDao.getUser_string((String)session.getAttribute("uname"));
	int uid=user.getUid();
	req_id=demandDao.getDemand_dem_id(dem_id).getReq_id();
	reqInfo=reqInfoDao.getReqInfo_req_id(req_id);
	list=reqGoodDao.getReqGood_req_id(reqInfo.getReq_id());
	user=userDao.getUser_int(reqInfo.getReq_uid());
	DelnoteDao delnoteDao=new DelnoteDao();
	Delnote delnote=new Delnote();
	delnote.setDem_id(dem_id);
	delnote.setReq_uid(reqInfo.getReq_uid());
	delnote.setUid(uid);
	int i=delnoteDao.save(delnote);
	MessageDao messageDao=new MessageDao();
	Message message=new Message();
	message.setDem_id(dem_id);
	message.setReq_id(0);
	message.setUid(reqInfo.getReq_uid());
	messageDao.save(message);
	}
int countaid = list.size();
int i=0;
String temp="";
        while(i<countaid){
        	GoodDao goodDao=new GoodDao();
        	ReqGood rgood=list.get(i);
        	Good good=goodDao.getGood_gid(rgood.getGid());
        	int now_num=good.getGnum();
        	good.setGnum(now_num-rgood.getReq_num());
        	goodDao.update_gnum(good);
        }
        response.sendRedirect("index_Knight.jsp");
        %>

</body>
</html>