<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.five.testsys.entity.ReqInfo" %>
    <%@ page import="cn.five.testsys.entity.ReqGood" %>
    <%@ page import="cn.five.testsys.entity.User" %>
    <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
    <%@ page import="cn.five.testsys.dao.ReqGoodDao" %>
    <%@ page import="cn.five.testsys.dao.UserDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>查询历史单</title>
 <script type="text/javascript">
function not_empty(){
	var tit=form1.tit.value;
	if(tit==""){
		alert("不能为空");
		form1.tit.focus();
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
        background: url(./images/select_requisition.jpg);
        background-color: black;
        background-size: 100% 100%;
        position: absolute;
    }
    p{
        font-size: 20px; color:white;
    }
    .test{
        margin: 0 auto;
        height: 100px;
        width: 400px;
        border: 1px solid black;
        transform: translate(0%,-20%);
        position: absolute; 
    }
    
    
    
    </style>
    <%
    request.setCharacterEncoding("utf-8");
    String tit="";
    int req_id;
    ReqInfoDao reqInfoDao=new ReqInfoDao();
    ReqGoodDao reqGoodDao=new ReqGoodDao();
    ReqInfo reqInfo=new ReqInfo();
    List<ReqGood> list=null;
    UserDao userDao=new UserDao();
    User user=new User();
    user.setUname("");
    if(request.getParameter("req_id")!=null){
    	req_id=Integer.parseInt(request.getParameter("req_id"));
    	reqInfo=reqInfoDao.getReqInfo_req_id(req_id);
    	list=reqGoodDao.getReqGood_req_id(reqInfo.getReq_id());
    	user=userDao.getUser_int(reqInfo.getReq_uid());
    	}
    if(request.getParameter("tit")!=null){
    	tit=request.getParameter("tit");
    	reqInfo=reqInfoDao.getReqInfo_tit(tit);
        list=reqGoodDao.getReqGood_req_id(reqInfo.getReq_id());
        user=userDao.getUser_int(reqInfo.getReq_uid());
    }
    int countaid;
    if(list==null)
    	countaid=0;
    else
    	countaid = list.size();
    int i=0;
    String temp="";
    
    
    %>
</head>
<body>
	<div>
    <form action="select_requisition.jsp" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
    	<p>单名：<input type="text" value="<%=reqInfo.getTit() %>" name="tit" placeholder="单名" maxlength="50" autocomplete="off" class="">
       	 </p>
       	 <input type="submit" class="btn btn-login" value="查询">
    </form>
    </div>
    <div>
    <p>申请人:<%=user.getUname() %></p>
    <p>申请时间:<%=reqInfo.getTime() %></p>
    
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
    </div>
    <div>
    <%if(reqInfo.getDep_id()==0){ temp="未审核"; %>
    	<p>部门领导：<%=temp %>></p>
    <%}
    else{
    	%>
    	<p>部门领导：<%=reqInfo.getDep_id() %>></p>
    	<%
    }
    %>
    
    <%if(reqInfo.getManage_id()==0){ temp="未审核"; %>
    	<p>归口领导：<%=temp %>></p>
    <%}
    else{
    	%>
    	<p>归口领导：<%=reqInfo.getManage_id() %></p>
    	<%
    }
    %>
    
    
    </div>
    
    <p>备注：<%=reqInfo.getNote() %></p>
    <div class="test">
    </div>

</body>
</html>