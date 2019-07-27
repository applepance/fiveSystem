<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Demand" %>
    <%@ page import="cn.five.testsys.entity.Delnote" %>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.DemandDao" %>
    <%@ page import="cn.five.testsys.dao.DelnoteDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int dem_id;
if(request.getParameter("dem_id").equals("")){
	GoodDao goodDao=new GoodDao();
	Good good=new Good();
	good.setGname(request.getParameter("gname"));
	good.setGnum(Integer.parseInt(request.getParameter("gnum")));
	good.setGtype(request.getParameter("gtype"));
	good.setGstatus("waiting");
	goodDao.save(good);
}
else{
	dem_id=Integer.parseInt(request.getParameter("dem_id"));
	GoodDao goodDao=new GoodDao();
	Good good=new Good();
	String gname=request.getParameter("gname");
	good.setGname(request.getParameter("gname"));
	good.setGnum(Integer.parseInt(request.getParameter("gnum")));
	good.setGtype(request.getParameter("gtype"));
	good.setGstatus("in-use");
	goodDao.save(good);
	good=goodDao.getGood_gname_use(gname);
	DemandDao demandDao=new DemandDao();
	Demand demand=demandDao.getDemand_dem_id(dem_id);
	int req_id=demand.getReq_id();
	ReqGoodDao reqGoodDao=new ReqGoodDao();
	ReqGood reqGood=new ReqGood();
	reqGood.setGid(good.getGid());
	reqGood.setReq_id(req_id);
	reqGood.setReq_num(good.getGnum());
	reqGoodDao.save(reqGood);
}
response.sendRedirect("index_Knight.jsp");
%>

</body>
</html>