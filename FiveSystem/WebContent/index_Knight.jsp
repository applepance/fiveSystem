<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="cn.five.testsys.function.Login_Func" %>
        <%@ page import="cn.five.testsys.entity.Message" %>
        <%@ page import="cn.five.testsys.entity.User" %>
        <%@ page import="cn.five.testsys.entity.Demand" %>
         <%@ page import="cn.five.testsys.entity.ReqInfo" %>
        <%@ page import="cn.five.testsys.dao.MessageDao" %>
        <%@ page import="cn.five.testsys.dao.UserDao" %>
        <%@ page import="cn.five.testsys.dao.DemandDao" %>
        <%@ page import="cn.five.testsys.dao.ReqInfoDao" %>
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
	if(session.getAttribute("power")!="Knight"){
		response.sendRedirect(login_Func.check_power((String)session.getAttribute("power")));
	}
%>
<body>
<div class="head" style="background-image: url(images/head_3.jpg); scrollshow='true';" >
		<div class="nav-menu">
          <div class="blur-bg" style="background-image: url(images/head_3.jpg);"></div>
          <div class="nav-mask"></div>
          <div class="nav-wrapper clearfix wrapper">
              <div class="nav-con fr">
                  <ul class="fr">
                      <li class="nav-item">
                          <a href="index_Knight.jsp" target="_self" class="t"><%=(String)session.getAttribute("uname") %></a>
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
			<a href="index_Knight.jsp" target="_self" class="tab-item on" style="background-image: url(images/log.jpg);height: 29.23px;">
    		</a>
    		<a href="index_Knight.jsp" target="_self" class="tab-item on">
      			<span>首页</span>
    		</a>
    		<a href="check_goods.jsp" target="_blank" class="tab-item  ">
      			<span>查询物资库</span>
    		</a>
    		<a href="check_demand.jsp" target="_blank" class="tab-item  ">
      			<span>查询需求单</span>
    		</a>
    		<a href="new_goods.jsp" target="_self" class="tab-item  ">
      			<span>采购</span>
    		</a>
    		<a href="recovery.jsp" target="_blank" class="tab-item  ">
      			<span>回收</span>
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
            	int dem_id=message.getDem_id();
            	DemandDao demandDao=new DemandDao();
            	Demand demand=demandDao.getDemand_dem_id(dem_id);
            %>
                <div class="message-item">
                    <div class="item-holder">
                        <div class="message-content">
                                <a href="check_demand.jsp?dem_id=<%=dem_id %>" target="_blank" class="message-title-holder">
                                    <span class="message-title" title=标题>新的调配单：<%=dem_id %>（单号）</span>
                                </a>
                            <div class="blank"></div>
                                <div class="message-info-bar">
                                    <a class="up-content">
                                        <span class="font"> </span>
                                        <span class="nick-name"> </span>
                                    </a>
                                    <span class="font">状态：</span>
                                    <span class="status"><%if(demand.getUid()==0){%>待调配<% } else{%>已调配<%} %></span>
                                    
                                </div>
                        </div>
                    </div>
                </div>
    		<%} %>
    		</div>
    	</div>
    	
    	<% if (total>10.0){%>
            <div class="pages">
                <a href="index_Knight.jsp?page=1" >首页</a>
                <%if (total-countaid != 10){%>
                <a href="index_Knight.jsp?page=<%=nowpage-1%>">上一页</a>
                <%}%>
                <% if (nowpage != allpages){%>
                    <a href="index_Knight.jsp?page=<%=nowpage+1%>">下一页</a>
                    <a href="index_Knight.jsp?page=<%=allpages%>">末页</a>
                <% } %>
                <form action="index_Knight.jsp">
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