<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="cn.five.testsys.function.Login_Func" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/login_register.css" type="text/css" media="screen" />
<script type="text/javascript">
function not_empty(){
	var uname=form1.uname.value;
	var pwd=form1.pwd.value;
	if(uname==""){
		alert("用户名不能为空");
		form1.uname.focus();
		return false;
		}
	if(pwd==""){
		alert("密码不能为空");
		form1.pwd.focus();
		return false;
		}
	
	var power=document.getElementsByName("power");
    for(var i=0;i<power.length;i++){
         if(power[i].checked==true){
             temp=1;
             break;
         }else{
             temp=0;
        }
    }
    if(temp==0){
    	alert("职位必选");
    	return false;
    }
	
	return true;
}
function fomrReset()
{
     document.getElementById("form1").reset();
}
</script>
<%
Login_Func login_Func=new Login_Func();
if(session.getAttribute("power")!=null){
	response.sendRedirect(login_Func.check_power((String)session.getAttribute("power")));
} %>
<title>孤儿注册</title>
</head>
<body>
<div>
	<div class="title-line">
		<span class="tit" style="font-size: 38px;">注册</span>
	</div>
	<div class="form-login">
		<div class="input-box">
		<form action="register_test.jsp" method="POST" target="_self" accept-charset="UTF-8" id="form1" name="form1" onsubmit="return not_empty();">
			<ul>
				<li class="item username status-box">
					<input type="text" value="" placeholder="用户名" name="uname" id="login-username" maxlength="50" autocomplete="off" class="">
					<div class="text clearfix">
						<p class="tips"></p>
					</div>
				</li>
				<li class="item password status-box">
					<input type="password" placeholder="密码" name="pwd" id="login-passwd" class="">
					<div class="text clearfix">
						<p class="tips"></p>
					</div>
				</li>
				
				<li class="item password status-box">
					<input type="radio" name="power" value="Non" style="width: 14px;" >一般职员&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="radio" name="power" value="Knight" style="width: 14px;">资产管理&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="radio" name="power" value="Queen" style="width: 14px;">部门领导&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="radio" name="power" value="King" style="width: 14px;">归口领导&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="text clearfix">
						<p class="tips"></p>
					</div>
				</li>
				
				<li class="btn-box">
					<input type="submit" class="btn btn-login" value="注册">
					<input type="button" class="btn btn-reg" value="重置" onclick="fomrReset()">
				</li>
			</ul>
			</form>
		</div>
	</div>
</div>
</body>
</html>