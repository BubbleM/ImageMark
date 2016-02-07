<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<style type='text/css'>
body {
	font-family: 'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
}
</style>
<link type='text/css' rel='stylesheet' href='css/icon.css'>
<link type='text/css' rel='stylesheet' href="css/maintest.css">
<link type='text/css' rel='stylesheet' href="css/all.css">
<link type='text/css' rel='stylesheet' href="css/sty.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type='text/javascript'  src='js/team-setting.js'></script>
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

		<div class="contaniar-left">
			<a href="myfile.jsp" id="d1" class="network-menu"> <span
				style="display:block;padding-top:40px;"> <span
					class="nav-icons  "></span> <span class="network-menu-title">开始标记</span>
			</span>
			</a> <a href="myfile.jsp" id="d2" class="network-menu " > <span
				style="display:block;padding-top:40px;"> <span
					class="nav-icons files"></span> <span class="network-menu-title">我的文件</span>
			</span>
			</a> <a href="myteam.jsp" id="d3" class="network-menu active"> <span
				style="display:block;padding-top:40px;"> <span
					class="nav-icons teams ac"></span> <span class="network-menu-title">我的群组</span>
			</span>
			</a> <a href="myinformation.jsp" id="d4" class="network-menu"> <span
				style="display:block;padding-top:40px;"> <span
					class="nav-icons message"></span> <span class="network-menu-title">我的信息</span>
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

					<div tit="members" onClick="" class="network-nav-items"
						href="/team-member">
						<a href="team-member.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons myteamfile"></span>
							<span class="nav-item-title">小组成员</span></a>
					</div>
					<div tit="setting" onClick="" class="network-nav-items active">
						<a href="team-setting.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons setting"></span>
							<span class="nav-item-title">小组设置</span></a>
					</div>


				</div>
				<div class="network-content">

					<div class="content_container teams-setting" style="height: 452px;">
						<div class="teams-setting-container">
							<div
								style="position:relative;width:160px;margin:0 auto;margin-top:5px;">
								<div class="teams-setting-logo-edit">
									<form id="upload_logo_form" action="/network/upload_img"
										method="post" enctype="multipart/form-data">
										<input onChange="teams.uploadLogo()" id="upload_logo_file"
											name="img" type="file"> <input name="bucket"
											type="hidden" value="team_logo"> <input type="hidden"
											id="logoFileName" name="logoFileName">
									</form>
								</div>
								<img id="team-logo" title="小组logo，建议尺寸200*200"
									style="width:150px;border-radius:50%;border:1px solid #ddd;"
									src="images/main/team.gif">
							</div>
							<div style="margin-bottom:4px;">
								<div class="teams-setting-title">小组名称</div>
								
								<input style="width:400px;" id="team-setting-name" type="text"
									class="txt" value="${team.getTeamName()} " disabled="true">
						        <span style="color:#999;font-size:10px;" >tag:小组名称暂不提供修改</span>
						       
							</div>
							<div style="margin-bottom:4px;">
								<div class="teams-setting-title">邀请码</div>
								<input style="width:400px;" id="team-setting-password" type="text"
									class="txt" value="${team.getTeamPassword()}">
									<!-- 直接team.id ,取不到值的原因是，id在team里面是私有的，需要借助get方法来获取值-->
								<input type="hidden" name="data_teamId" id="data_teamId" value="${team.getTeamId()}"/>
							</div>
							<!--  暂且注释
							<div style="margin-bottom:4px;" class="setting-box">
								<div class="teams-setting-title">小组简介</div>
								<textarea id="team-setting-des" style="width:400px;" rows="2"
									class="txt"></textarea>
							</div>
							<div style="margin-bottom:4px;" class="setting-box">
								<div class="teams-setting-title" style="padding-bottom:5px;">成员默认身份</div>
								<span id="default-role-span" tit="" class="teams-role radius3"
									onClick=""> 成员<span class="drop"></span>

								</span> <input type="hidden" id="default-role-value" value="4_author">
							</div>
							<br>
							<div style="margin-bottom:4px;" class="setting-box">
								<input type="checkbox" id="team-safe-setting" checked="checked">
								<label for="team-safe-setting">允许文件对外发布</label>
							</div>
							
							<div style="margin-bottom:4px;" class="setting-box">
								<input type="checkbox" id="team-addJoinStream" checked="checked">
								<label for="team-addJoinStream">显示成员加入的动态</label>
							</div>
							<div style="margin-bottom:4px;" class="setting-box">
								<input type="checkbox" id="team-setting-public"> <label
									for="team-setting-public">公开您的小组，其他人可以浏览并申请加入。</label>
							</div>
							<div id="joinType" style="margin-bottom: 4px; margin-top: 3px;"
								class="setting-box">
								<div class="teams-setting-title">小组成员加入方式</div>
								<input value="true" type="radio" id="team-setting-jointype1"
									name="team-setting-jointype"> <label
									for="team-setting-jointype1">管理员审核</label> <input
									checked="checked" type="radio" value="false"
									id="team-setting-jointype2" name="team-setting-jointype">
								<label for="team-setting-jointype2">直接加入无需审核</label>
							</div>
							 -->
							<div style="padding:8px 0px;">
								<span id="btn_saveteam" class="button green">保存</span>&nbsp;&nbsp; 
								<span id="btn_deleteteam" class="button" >删除小组</span>


							</div>
						</div>
					</div>

					<div class="clear"></div>
				</div>

				<div class="content-right" style="width:25%">
					<div class="network-right-team" style="display: block;">
						<div>
							<img src="images/main/team.gif">
						</div>
						<div style="margin-top:5px;">
							<a class="network-right-team-name" href="#">${team.getTeamName()}</a>
						</div>
						<div
							style="margin:8px 25px 0px 25px;border-bottom:1px solid #eee;box-shadow:0px 0px 2px #fff inset;"></div>
					</div>
					<div class="content-right-box" style="display: block;">


						<div class="content-right-title">最新公告</div>
						<div id="suggestusers">小组文档中暂时没有内容</div>
					</div>
					<div class="team-content-right transition_2" style="display: none;"></div>
				</div>



			</div>

		</div>
	</div>

</body>
</html>