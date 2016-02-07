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
    
    <title>Amazing | 我的信息</title>
    

	<link type='text/css' rel='stylesheet' href='css/icon.css'>
    <link  type='text/css' rel='stylesheet' href="css/maintest.css">
   <link  type='text/css' rel='stylesheet' href="css/all.css">
   <link  type='text/css' rel='stylesheet' href="css/sty.css">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/myinformation.js"></script>
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
	<a href="myteam.jsp" id="d3" class="network-menu">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons teams ac"></span>
			<span class="network-menu-title">我的群组</span>
		</span>
	</a>
	<a href="myinformation.jsp" id="d4" class="network-menu  active">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons message"></span>
			<span class="network-menu-title">我的信息</span>
		</span>
	</a>
</div>

<div class="contaniar-right" style="height:565px">
		<div class="content-left" style="margin-right: 200px;width:75%">
		  <div class="network-nav">
				<div id="passwordModify"  class="network-nav-items active">
					
					<span class="nav-item-title">密码修改</span>
                </div>
           </div>
       <form id="about-edit-form" action="/profile/saveedit" method="post" style="position:absolute;left:10%;top:40px">
         <div style="margin-bottom:4px;" class="setting-box">
			<div style="margin-bottom:4px;margin-left:20px">
			<li class="worker freelancer student" style="display: block;">
								<dl>
									<dd class="profile-dd-label">
										<label>用户名：</label>
									</dd>
									<dd>
										<input id="full_name" disabled="true" type="text"  name="fullName" class="txt" value="<sec:authentication property="name"/>"/ >
									</dd>
								</dl>
							</li>
            <li class="worker freelancer student" id="modifyPasswordInput" style="display: none;">
								<dl>
									<dd class="profile-dd-label">
										<label>请输入旧密码:</label>
									</dd>
									<dd>
										<input id="oldPassword" type="password" class="txt" value="" />
									</dd>
								</dl>
								
								<dl>
									<dd class="profile-dd-label">
										<label>请输入新密码:</label>
									</dd>
									<dd>
										<input id="newPassword" type="password" class="txt" value="" />
									</dd>
								</dl>
								<dl>
									<dd class="profile-dd-label">
										<label>再次输入密码:</label>
									</dd>
									<dd>
										<input id="newPasswordAgain" type="password" class="txt" value="" />
									</dd>
								</dl>
								<input type="button" id="passwordChange" value="修改"/>
								<input type="button" id="cancelChange" value="取消"/>
							</li>
       	            </div>
       	            <!--  
        <div class="identity_tabs">
						<a href="#"><span class="identity_tab worker" source="worker" onClick="changeIdentity('worker')">
							<span class="identity_tab_icon worker"></span>
							<span class="title">企业 </span>
						</span></a>
						<a href="#"><span class="identity_tab freelancer" source="freelancer" onClick="changeIdentity('freelancer')">
							<span class="identity_tab_icon freelancer"></span>
							<span class="title">个人 </span>
						</span></a>
						<a href="#"><span class="identity_tab student" source="student" onClick="changeIdentity('student')">
							<span class="identity_tab_icon student"></span>
							<span class="title">科研机构 </span>
						</span></a>
						<div class="identity_split_line">
							<div class="identity_split_tip">身份相关信息 </div>
						</div>
					</div>
                    <div class="identity_item">
					
							<li class="study" style="display:block;">
								<dl>
									<dd class="profile-dd-label">
										<label>机构全称</label>
									</dd>
									<dd>
										<input name="schoolName" type="text" class="txt" value="">
									</dd>
								</dl>
							</li>
							<li class="study" style="display: block;">
								<dl>
									<dd class="profile-dd-label">
										<label>所在行业</label>
									</dd>
									<dd>
										<input name="specialty" type="text" class="txt" value="">
									</dd>
								</dl>
							</li>
							<li class="worker freelancer student" style="display: block;">
								<dl>
									<dd class="profile-dd-label">
										<label>简单介绍</label>
									</dd>
									<dd>
										<textarea class="txt" name="introduction"></textarea>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
                    <div class="profile-group profile-items">
					<ul>
					
						<li style="padding-top:10px;position:absolute;left:20%">
							<a id="about_edit_submit" href="" class="button green" onclick="">保存个人信息</a>
						</li>
					</ul>
					-->
				</div>
				
<!-- 	****************Preview Details***************	 -->
	<div class="clear"></div>
    </form>
    </div>
          
		
				
		</div>
		
</div>
            </div>

</body>
</html>