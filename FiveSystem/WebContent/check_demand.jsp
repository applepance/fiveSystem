<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Demand" %>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="cn.five.testsys.dao.DemandDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>需求单调配</title>
 <script type="text/javascript">
function not_empty(){
	var dem_id=form1.dem_id.value;
	if(dem_id==""){
		alert("不能为空");
		form1.dem_id.focus();
		return false;
		}
	return true;
}
</script>
<style>
    html{
        height: 100%;
    }
    body{
        background: url(./images/check_demand.jpg);
        background-color: black;
        background-size: 100% 100%;
        position: absolute;
    }
.test{
    font-size: 20px;
    left: 50%;
    position:fixed;

}
</style>
</head>

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
	req_id=demandDao.getDemand_dem_id(dem_id).getReq_id();
	reqInfo=reqInfoDao.getReqInfo_req_id(req_id);
	list=reqGoodDao.getReqGood_req_id(reqInfo.getReq_id());
	user=userDao.getUser_int(reqInfo.getReq_uid());
	}
int countaid=0;
if(list==null)
	countaid = 0;
else 
	countaid = list.size();
int i=0;
String temp="";
%>
<body>
    <div class="test">
    <form action="check_demand.jsp" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
    	<p>需求单单号：
    	<input type="text" value="<%=dem_id %>" name="dem_id" placeholder="单号" maxlength="50" autocomplete="off" class="">
       	 </p>
       	 <input type="submit" class="btn btn-login" value="查询">
    </form>
    <p>单名：<%=reqInfo.getTit() %></p>
    <p>申请人：<%=user.getUname()%></p>
    <p>备注：<%=reqInfo.getNote() %></p>
    <%
        while(i<countaid){
        	GoodDao goodDao=new GoodDao();
        	ReqGood rgood=list.get(i);
        	Good good=goodDao.getGood_gid(rgood.getGid());
        	i +=1;
        	%>
        	<p><%=good.getGname()%>:<%=good.getGnum()%></p>
        	<%
        }
        %>
        <%if(dem_id==0){
        	
        }
        else{
        	%>
        	<a href="check_demand_ok.jsp?dem_id=<%=dem_id%>">配送准备</a>
        	<%
        }
        %>
        
    </div>
</body>
</html>