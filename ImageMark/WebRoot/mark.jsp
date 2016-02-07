<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Amazing</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/mark.js"></script>

  

<style type='text/css'>body{font-family:'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial, sans-serif;}</style>
<link type='text/css' rel='stylesheet' href='css/icon.css'>
<link  type='text/css' rel='stylesheet' href="css/maintest.css">
<link  type='text/css' rel='stylesheet' href="css/all.css">
<link  type='text/css' rel='stylesheet' href="css/sty.css">
<script type="text/javascript">

</script>

</head>
<body>
<header>
	<div id="header_nav">
		<div class="header_nav_items">
			<a class="logo" href="index.jsp"> <img width=150px height=42px
				src="images/logo2.png" />
			</a> 
			<a class="header_nav_link" href="myfile.jsp"></span>我的文件</a>
			<!--  
			<a class="header_nav_link" href="/popular">推荐</a>
			<a class="header_nav_link" href="/explore">发现</a>
			-->
			<a class="header_nav_link" href="myteam.jsp">群组</a>
			


		</div>
		<div class="header_search">
			<form id="global_form" action="/search" method="get"
				onSubmit=" Header.doSearch();">
				<input type="text" id="search_input" name="q" value=""
					placeholder='搜索' />
			</form>
		</div>

		<div class="header_right">
			<div id="header-user" class="header-user">
				欢迎登陆，<sec:authentication property="name"/> 
				<img src="images/main/person.png" style="width:40px;height:25px;" class="radius3" /> 
				<span class="header-drop"></span> 
				<a href="javascript:void(0)" class="notification_badge"></a>
				<ul id="header_user_menu">
				<!--  
					<li><a class="noover" href="/notification">通知中心
					<span class="badge warning global-tip"></span></a></li>
				-->
					<li><a class="noover" href="myinformation.jsp">账户设置</a></li>
					<li><a class="noover" href="#">帮助（反馈）</a></li>
					<li><a href="j_spring_security_logout">退出</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script type='text/javascript' charset='UTF-8'
		src='/scripts_bin/zh/global/header.js?1451899120'></script> 
</header>
<div id="header_clear" style="width:100%;clear:both;height:42px;"></div>
<div id="bg-content" style="background-image:url(images/bg.jpg)"></div>

<div class="contaniar">
	
<div class="contaniar-left" >
	<a href="mark.jsp" id="d1" class="network-menu active">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons home ac "></span>
			<span class="network-menu-title">开始标记</span>
		</span>
	</a>
	<a href="myfile.jsp" id="d2" class="network-menu " >
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons files"></span>
			<span class="network-menu-title">我的文件</span>
		</span>
	</a>
	<a href="myteam.jsp" id="d3" class="network-menu ">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons teams "></span>
			<span class="network-menu-title">我的群组</span>
		</span>
	</a>
	<a href="myinformation.jsp" id="d4" class="network-menu">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons message"></span>
			<span class="network-menu-title">我的信息</span>
		</span>
	</a>
</div>
<div class="contaniar-right" id="finish" style="display:none; text-align:center; font-size:20px;height:565px;" > 
  <div class="content-left" style="margin-right: 200px;width:100%">
                  暂没有新的标记任务！<br>
    <span style="font-size:14px;color:red;">  小提示：若需要加入群组，请在我的群组中加入相应的群组！</span>
  </div>
</div>
<div class="contaniar-right" id="unfinish" style="height:565px;">
		<div class="content-left" style="margin-right: 200px;width:75%">
	<div class="img-mark">
    <img class="imageMarking" id="" src="" width="500px" height="300px" />
    </div>
         </div>
		 
          <div class="content-right" style="width:25%">
        
        <div style="margin-bottom:4px;" class="setting-box" id="mark">
			<div class="mark font">请根据图片输入标记信息:</div>
        <textarea  style="width:200px;margin-top:15px" id="mark_content" type="textarea" class="txt" rows="6"value=""></textarea>
 
        </div>
        <!--  暂且注释
        <div class="control" >
        <input id="up" class="button"type="button" value="上一张"></input>
        <input id="down" class="button"type="button" value="下一张"></input>
        </div>
        -->
        <div class="sub">
        <input id="mark_yes" class="button green"type="button" value="标记"></input> 
        </div> 
</div>
            </div>
 </div>

</body>
</html>