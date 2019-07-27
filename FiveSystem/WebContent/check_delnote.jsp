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
    <%@ page import="cn.five.testsys.entity.Delnote" %>
    <%@ page import="cn.five.testsys.dao.DelnoteDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申请人收货并评价</title>
 <script type="text/javascript">
function not_empty(){
	var evaluation=form1.evaluation.value;
	if(evaluation==""){
		alert("不能为空");
		form1.evaluation.focus();
		return false;
		}
	var radioLOVE=form1.radioLOVE.value;
	if(radioLOVE==""){
		alert("不能为空");
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
        background: url(./images/check_delnote.jpg);
        background-color: black;
        background-size: 100% 100%;
        position: absolute;
    }
a{
    top: 150%;
    position: absolute;
    font-size: 20px;

}
p{
    font-size: 20px;
}
</style>

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
Delnote delnote=new Delnote();
if(request.getParameter("dem_id")!=null){
	dem_id=Integer.parseInt(request.getParameter("dem_id"));
	req_id=demandDao.getDemand_dem_id(dem_id).getReq_id();
	reqInfo=reqInfoDao.getReqInfo_req_id(req_id);
	list=reqGoodDao.getReqGood_req_id(reqInfo.getReq_id());
	user=userDao.getUser_int(reqInfo.getReq_uid());
	DelnoteDao delnoteDao=new DelnoteDao();
	delnote=delnoteDao.getDelnote_dem_id(dem_id);
	}
int countaid = list.size();
int i=0;
String temp="";
%>

</head>
<body>
    <div>
    
    <h1>申请人操作</h1>
    <h2>申请人对归口部门调配的资源作出评价</h2>
    
    <p>单号：<%=dem_id %></p>
    <p>单名：<%=reqInfo.getTit() %></p>
    <p>申请人：<%=user.getUname()%></p>
    <p>备注：<%=reqInfo.getNote() %></p>
    <p>送货时间：<%=delnote.getDel_date()%></p>
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
    <form action="check_delnote_pass.jsp?dem_id=<%=dem_id %>" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
    	<p>评价：
    	<textarea name="evaluation" placeholder="评价" class=""></textarea>
       	 </p>
       	 <input type="radio" name="radioLOVE" value="1">非常不满意
    	<input type="radio" name="radioLOVE" value="2">不满意
    	<input type="radio" name="radioLOVE" value="3">一般
  	  	<input type="radio" name="radioLOVE" value="4">满意
    	<input type="radio" name="radioLOVE" value="5">非常满意
       	 <input type="submit" class="btn btn-login" value="收货确认">
    </form>
   
    </div>
</body>
</html>