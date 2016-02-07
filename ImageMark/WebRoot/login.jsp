<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">-->
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="css/login.css" ></link>
<link type="text/css" rel="stylesheet" href="css/all.css" ></link>

<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>Amazing | 登录</title>
<script type="text/javascript">

	
</script>


</head>
<body style="background:url(image_need/bg.jpg);" >
	<div class="signin-bg">
		<div class="signin-container">
			<div style="margin:170px 0px 30px 45px">
				<div style="display:inline-block;width:340px;float:left;">
					<div style="margin-bottom:8px">
						<a href="/"><img style="width:200px" src="image_need/logo.png"
							border="0"></a>
					</div>
					<div class="error ${param.error == true ? '' : 'hide'}">
					      <span style="color:red;"> 登陆失败!用户名或密码不正确！<br></span> 
                       ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
					</div>
						<form name="loginform" id="loginform" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
							<div style="margin-top:25px">
								<input name="j_username" id="login_id" value="" class="signin-txt"
									type="text" placeholder='用户名' />
							</div>
							<div style="margin-top:20px">
								<input name="j_password" id="login_password" value=""
									class="signin-txt" type="password" placeholder='密码' />
							</div>
							<div style="margin-top:20px">
							  <span id="signin-btn" onclick="document:loginform.submit();" class="button default signin-btn">立即登录</span>
								<a href="" class="signin-forget">忘记密码</a>
							</div>
							<div style="margin-top:38px;color:#222;">
								还没有账户？您可以在此&nbsp;<a href="signup.jsp">注册</a>
							</div>
						</form>
					
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
