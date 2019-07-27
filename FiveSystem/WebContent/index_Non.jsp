
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="cn.five.testsys.function.Login_Func" %>
        <%@ page import="cn.five.testsys.entity.Message" %>
        <%@ page import="cn.five.testsys.entity.User" %>
        <%@ page import="cn.five.testsys.entity.ReqInfo" %>
        <%@ page import="cn.five.testsys.entity.Delnote" %>
        <%@ page import="cn.five.testsys.dao.MessageDao" %>
        <%@ page import="cn.five.testsys.dao.UserDao" %>
        <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
        <%@ page import="cn.five.testsys.dao.DelnoteDao" %>
        <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/index.css" type="text/css" media="screen" />
<title>欢迎<%=(String)session.getAttribute("uname") %></title>
</head>
<%
Login_Func login_Func=new Login_Func();
if(session.getAttribute("power")==null){
	response.sendRedirect("login.jsp");
}else{
	if(session.getAttribute("power")!="Non"){
		response.sendRedirect(login_Func.check_power((String)session.getAttribute("power")));
	}
%>

<body>
<div class="head" style="background-image: url(images/head_1.jpg); scrollshow='true';" >
		<div class="nav-menu">
          <div class="blur-bg" style="background-image: url(images/head_1.jpg);"></div>
          <div class="nav-mask"></div>
          <div class="nav-wrapper clearfix wrapper">
              <div class="nav-con fr">
                  <ul class="fr">
                      <li class="nav-item">
                          <a href="index_Non.jsp" target="_self" class="t"><%=(String)session.getAttribute("uname") %></a>
                      </li>
                      <li class="nav-item">
                          <a href="out.jsp" target="_self" class="t">登出</a>
                      </li>
                  </ul>
              </div>
          </div>
      	</div>
</div>
	<div class="main-body">
		
		<div class="nav-tab-bar">
			<a href="index_Non.jsp" target="_self" class="tab-item on" style="background-image: url(images/log.jpg);height: 29.23px;">
    		</a>
    		<a href="index_Non.jsp" target="_self" class="tab-item on">
      			<span>首页</span>
    		</a>
    		<a href="check_goods.jsp" target="_blank" class="tab-item  ">
      			<span>查询物资库</span>
    		</a>
    		<a href="new_requisition.jsp" target="_blank" class="tab-item  ">
      			<span>填写申请单</span>
    		</a>
    		<a href="select_requisition.jsp" target="_blank" class="tab-item  ">
      			<span>查询历史单</span>
    		</a>
    	</div>
    	
    	<div class="page-content">
    	
    		<div class="partitio-name">
        		<label>待办事宜</label>
      		</div>
      		
      		<div class="message-list">
      		
      		<%
      		MessageDao messageDao=new MessageDao();
      		UserDao userDao=new UserDao();
      		User user=userDao.getUser_string((String)session.getAttribute("uname"));
      		List<Message> list = messageDao.getMessage_uid(user.getUid()) ;
      		
      		int countaid = list.size();
      		double total = countaid;
      		double nowpage;
      		double allpages=Math.ceil(total/10);
      		if(request.getParameter("page")==null){
                nowpage=1;
            }else {
                nowpage=Double.parseDouble(request.getParameter("page"));
            }
      		countaid -= 10*(nowpage-1) ;
      		
      		%>
      		<div class="message-list-holder">
      		<%
      		
      		for(int i=0;i<10&&countaid>0;i++,countaid--){
      			Message message = list.get(countaid-1);
      			int mes_id=message.getMes_id();
      			int req_id=message.getReq_id();
      			int dem_id=message.getDem_id();
      			ReqInfoDao reqInfoDao=new ReqInfoDao();
      			ReqInfo reqInfo=new ReqInfo();
      			DelnoteDao delnoteDao=new DelnoteDao();
      			Delnote delnote=new Delnote();
      			String status="";
      			String date="";
      			if(req_id!=0)	{
      				reqInfo=reqInfoDao.getReqInfo_req_id(req_id);
      				if(reqInfo.getManage_id()==404||reqInfo.getDep_id()==404)
      					status="已退回";
      				else if(reqInfo.getManage_id()!=0&&reqInfo.getDep_id()!=0){
      					status="已通过";
      				}
      				else
      					status="待审核";
      				date=reqInfo.getTime();
      			}
      			if(dem_id!=0)	{
      				delnote=delnoteDao.getDelnote_dem_id(dem_id);
      				if(delnote.getEvaluation().equals("")||delnote.getEvaluation().equals(null))
      					status="待评价";
      				else
      					status="已评价";
      				date=delnote.getDel_date();
      			}
      			
      			%>
      			
      			
            
                <div class="message-item" data-id=“<%=mes_id %>”>
                    <div class="item-holder">
                        <div class="message-content">
                        		<%if(req_id!=0){ %>
                                <a href="select_requisition.jsp?req_id=<%=req_id %>" target="_blank" class="message-title-holder">
                                    <span class="message-title" title=标题><%=reqInfo.getTit() %></span>
                                </a>
                                <%} %>
                                <%if(dem_id!=0){ %>
                                <a href="check_delnote.jsp?dem_id=<%=dem_id %>" target="_blank" class="message-title-holder">
                                    <span class="message-title" title=标题>送货时间：<%=date %></span>
                                </a>
                                <%} %>
                            <div class="blank"></div>
                                <div class="message-info-bar">
                                    <a class="up-content">
                                        <span class="font">申请人：</span>
                                        <span class="nick-name"><%=user.getUname() %></span>
                                    </a>
                                    <span class="font">状态：</span>
                                    <span class="status"><%=status %></span>
                                    <span class="font">申请时间：</span>
                                    <span class="time"><%=date %></span>
                                </div>
                        	</div>
                    	</div>
                	</div>
    		
    		<%
    		} 
    		%>
    		
    		
    		
      		
            </div>
    	</div>
    	
    	<% if (total>10.0){%>
            <div class="pages">
                <a href="index_Non.jsp?page=1" >首页</a>
                <%if (total-countaid != 10){%>
                <a href="index_Non.jsp?page=<%=nowpage-1%>">上一页</a>
                <%}%>
                <% if (nowpage != allpages){%>
                    <a href="index_Non.jsp?page=<%=nowpage+1%>">下一页</a>
                    <a href="index_Non.jsp?page=<%=allpages%>">末页</a>
                <% } %>
                <form action="index_Non.jsp">
                    <h4 align="center">共<%=allpages%>页
                        <input type="text" value="<%=nowpage%>" name="page" size="1">页
                        <input type="submit" value="go">
                    </h4>
                </form>
            </div>
            <%}%>
    	
   </div>
</body>
<%} %>
</html>