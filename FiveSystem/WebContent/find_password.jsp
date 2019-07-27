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
<title>孤儿从来不记密码</title>
</head>
<body>
<div>
	<div class="title-line">
		<span class="tit" style="font-size: 38px;">孤儿</span>
	</div>
	<div class="form-login">
		<div class="input-box">
			<form action="chang_pwd.jsp" method="POST" target="_self" accept-charset="UTF-8" id="form1" name="form1" onsubmit="return not_empty();">
			<ul>
				<li class="item username status-box">
					<input type="text" value="" name="uname" placeholder="用户名" id="login-username" maxlength="50" autocomplete="off" class="">
					<div class="text clearfix">
						<p class="tips"></p>
					</div>
				</li>
				<li class="item password status-box">
					<input type="password" name="pwd" placeholder="新密码" id="login-passwd" class="">
					<div class="text clearfix">
						<p class="tips"></p>
					</div>
				</li>
				<li class="btn-box">
					<input type="submit" class="btn btn-login" value="更改密码">
					<input type="button" class="btn btn-reg" value="重置" onclick="fomrReset()">
				</li>
			</ul>
			</form>
		</div>
	</div>
</div>
</body>
</html>