<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="cn.five.testsys.function.Login_Func" %>
     <%@ page import="cn.five.testsys.entity.Good" %>
    <%@ page import="cn.five.testsys.dao.GoodDao" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填写申请单</title>
<script type="text/javascript">
function not_empty(){
	var tit=form1.tit.value;
	if(tit==""){
		alert("标题不能为空");
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
    body
    {
        background: url(./images/new_requisition.jpg);
        background-color: black;
        background-size: 100% 100%;
        position: absolute;
        width: 100%;
        height: 100%;
    }
    .div{
        font-size: 20px;
        position: absolute;
        left: 50%;
        top:20%; 
      transform: translate(-50%,0%);
    } 
    p{
        font-size: 20px;
        
    
        
    }
    .test{
        transform: translate(-50%,0%);
        position: absolute;
        left: 50%;
        top:25%;
    }

    </style>
</head>
<%
Login_Func login_Func=new Login_Func();
if(session.getAttribute("power")==null){
	response.sendRedirect("login.jsp");
}else{
	if(session.getAttribute("power")!="Non"){
		response.sendRedirect(login_Func.check_power((String)session.getAttribute("power")));
	}
	GoodDao goodDao=new GoodDao();
	List<Good> list=goodDao.getGood_allwait("waiting");
	int countaid = list.size();
	int i=0;
%>
<body>
<form action="new_requisition_test.jsp" method="POST" target="_self" accept-charset="UTF-8" name="form1" onsubmit="return not_empty();">
        <div class="div" style="text-align:center">
                单名:
                <input type="text" value="" name="tit" placeholder="标题" maxlength="50" autocomplete="off" class="">
            </div>
        <div class="test">
        <%
        while(i<countaid){
        	Good good=list.get(i);
        	i +=1;
        	%>
        	<p><%=good.getGname()%>:余<%=good.getGnum()%><input name="<%=good.getGid()%>"></p>
        	<%
        }
        %>
                <p>备注:</p>
                <p><textarea name="note" style="height: 200px;float: right;"></textarea></p>
                <p>   <input type="submit" class="btn btn-login" value="提交">  </p>   
                
        </div>
</form>
<%} %>
</body>
</html>