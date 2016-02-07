<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

 <!DOCTYPE html> 
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<html>
<head>
<base href="<%=basePath%>">



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>Amazing | 注册</title>
<style type='text/css'>
body {
	font-family: 'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
}
</style>
<link type='text/css' rel='stylesheet' href='css/all.css' />
<link type='text/css' rel='stylesheet' href='css/login.css' />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
    $().ready(function(){
    	
    	$("#signin-btn").mouseover(function(){
    		var username = $("#login_id").val();
    		var password = $("#login_password").val();
    		var password2 = $("#login_password_again").val();
    		if(username.length<=0){
    			alert("请输入用户名！");
    		}else{
    			if(password.length<=0){
    				alert("请输入密码！");
    			}else{
    				if(password2.length<=0){
    					alert("请再次输入，密码！");
    				}else{
    					if(password != password2){
    						alert("两次输入的密码不一致！");
    					}
    						/*
    						else{
    						$.ajax({
    							url:"adduser.do",
    							data:{user:username,password:password},
    							type:"POST",
    							async:false,
    							success:function(){
    								alert(success);
    							}
    						});
    						}
    						*/
    						
    					
    				}
    			}
    		}
    		
    		
    	});
    });
    	
</script>
</head>
<body style="background:url(image_need/bg.jpg);">
	<div class="signin-bg">
		<div class="signin-container">
			<div style="margin:170px 0px 30px 45px">
				<div style="display:inline-block;width:340px;float:left;">
					<div style="margin-bottom:8px">
						<a href="/"><img style="width:200px" src="image_need/logo.png"
							border="0"></a>
					</div>
					<form name="signupform" id="signupform" action="adduser.do" method="post">
						<div style="margin-top:25px">
							<input name="login_id" id="login_id" value="" class="signin-txt"
								type="text" placeholder='用户名' />
						</div>
						<div style="margin-top:20px">
							<input name="login_password" id="login_password" value=""
								class="signin-txt" type="password" placeholder='密码' />
						</div>
						<div style="margin-top:20px;">
							<input name="login_password_again" id="login_password_again" class="signin-txt"
								type="password" value="" placeholder='再次输入密码' />
						</div>
						<div style="margin-top:20px">
							<span id="signin-btn" onclick="document:signupform.submit();"
								class="button default signin-btn">立即注册</span>
								

						</div>
						<div style="margin-top:38px;color:#222;">
							已有账户？ 点此&nbsp;<a href="login.jsp" style="color:#E4573D;">登录</a>
						</div>
					</form>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
