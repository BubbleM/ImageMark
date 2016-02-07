<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Amazing</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 
<meta charset="utf-8">
<style type='text/css'>body{font-family:'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial, sans-serif;}</style>
<link type='text/css' rel='stylesheet' href='css/icon.css'>
<link  type='text/css' rel='stylesheet' href="css/maintest.css">
<link  type='text/css' rel='stylesheet' href="css/all.css">
<link  type='text/css' rel='stylesheet' href="css/sty.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type='text/javascript'  src='js/team-member.js'></script>
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
	<a href="mark.jsp" id="d1" class="network-menu">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons  "></span>
			<span class="network-menu-title">开始标记</span>
		</span>
	</a>
	<a href="myfile.jsp" id="d2" class="network-menu " onclink>
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons files"></span>
			<span class="network-menu-title">我的文件</span>
		</span>
	</a>
	<a href="myteam.jsp" id="d3" class="network-menu active">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons teams ac"></span>
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

<div class="contaniar-right" style="height:565px">
		<div class="content-left" style="margin-right: 200px;width:75%">
		<div class="network-nav">

				<div tit="diagrams" onClick="" class="network-nav-items ">
					<a href="team-file.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons myfile"></span>
					<span class="nav-item-title">小组文件</span></a>
				</div>
			<!--	<div tit="notes" onclick="" class="network-nav-items">
					<span class="nav-icons notes"></span>
					<span class="nav-item-title">小组文档</span>
				</div>
                !-->

				<div tit="members" onClick="" class="network-nav-items active">
					<a href="team-member.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons myteamfile"></span>
					<span class="nav-item-title">小组成员</span></a>
				</div>
                <div tit="setting" onClick="" class="network-nav-items ">
						<a href="team-setting.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons setting"></span>
						<span class="nav-item-title">小组设置</span></a>
					</div>
          </div>
          <div class="main_btns">
          <!--  
	<a href="javascript:" class="button" >
		添加成员
	</a>
	-->
</div>
<div class="content_container member_list" style="height: 452px;">
	<ul class="member_header">
		<li class="member_name"><span style="margin-left: 10px;">姓名</span></li>
		<li class="member_role"><span style="margin-left: 4px;">角色</span></li>
		<li class="member_op">操作</li>
	</ul>
	<div id="member_list_items">

	 <c:forEach items="${users}" var="mt">
       <ul class="contacts-items" id="${mt.userid }">
		<li class="member_name">
			<img userid="${mt.userid }" class="radius3 avat_photo user_quickinfo" src="images/main/person.png">
			<span id="memberName${mt.userid}">${mt.username }</span>
		</li>
		<li class="member_role">
			
				<span style="margin-left: 4px;">${mt.descn }</span>
			
		</li>
		<li class="member_op">
			
			<a href="removeuser.do?userid=${mt.userid }&teamid=${teamid}&teamname=${teamname}">
			<span title="移出小组" style="float:none;padding:0px 8px;"  class="button remove" >移出小组</span>
			</a>
		<!--  暂且注释
			<span title="设为管理" style="float:none;padding:0px 8px;dispaly:block;" class="button" onClick="">修改权限</span>
		-->
		</li>
	</ul>
    </c:forEach>
</div>
<!--  暂且注释掉更多
	<div id="showMore" style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
		<span style="padding-left: 120px;padding-right: 120px;" class="button">更多</span>
	</div>
	-->
</div>		
				<div class="clear"></div>
			</div>
 
  <div class="content-right" style="width:25%">
			<div class="network-right-team">
				<div>
					<img src="images/main/team.gif">
				</div>
				<div style="margin-top:5px;">
				       
						<a class="network-right-team-name" href="#">${teamname}</a>
					</div>
				<div style="margin:8px 25px 0px 25px;border-bottom:1px solid #eee;box-shadow:0px 0px 2px #fff inset;"></div>
			</div>
			<div class="content-right-box">


<div class="content-right-title">
	用户标记信息
	
</div>
<div id="suggestusers">
	
	<div class="file-pre-box">
	
	<ul id="preview_box">
		
		<li style="display: list-item;">
			用户名：
			<span id="user-name"></span>
		</li>
		
		<li style="display:list-item;">
			用户标记数量：
			<span id="mark-sum"></span>
		</li>
		
	</ul>
</div>
	
</div>
</div>
</div>
            </div>

</body>
</html>