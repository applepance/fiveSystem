<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.Recovery" %>
    <%@ page import="cn.five.testsys.entity.Demand" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.RecoveryDao" %>
    <%@ page import="cn.five.testsys.dao.DemandDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
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
int dem_id=Integer.parseInt(request.getParameter("dem_id"));
String evaluation=request.getParameter("evaluation");
int star=Integer.parseInt(request.getParameter("radioLOVE"));
RecoveryDao recoveryDao=new RecoveryDao();
Recovery recovery=new Recovery();
recovery.setDem_id(dem_id);
recovery.setEvaluation(evaluation);
recovery.setStar(star);
recoveryDao.save(recovery);

DemandDao demandDao=new DemandDao();
Demand demand=demandDao.getDemand_dem_id(dem_id);
int req_id=demand.getReq_id();
ReqGoodDao reqGoodDao=new ReqGoodDao();
List<ReqGood> list=reqGoodDao.getReqGood_req_id(req_id);
int countaid = list.size();
int i=0;

while(i<countaid){
	GoodDao goodDao=new GoodDao();
	ReqGood rgood=list.get(i);
	Good good=goodDao.getGood_gid(rgood.getGid());
	int gnum=good.getGnum();
	good.setGnum(gnum+rgood.getReq_num());
	goodDao.update_gnum(good);
	i +=1;
	
}
response.sendRedirect("check_goods.jsp");

%>

</body>
</html>