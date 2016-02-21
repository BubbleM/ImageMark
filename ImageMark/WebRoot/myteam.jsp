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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<style type='text/css'>body{font-family:'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial, sans-serif;}</style>
<link type='text/css' rel='stylesheet' href='css/icon.css'>
<link  type='text/css' rel='stylesheet' href="css/maintest.css">
<link  type='text/css' rel='stylesheet' href="css/all.css">
<link  type='text/css' rel='stylesheet' href="css/sty.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/team.js"></script>
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
		
			<div class="network-right-top">
				<b>我的小组</b>
				<div class="network-right-top-right">
					<span id="teams-addbutton" class="teams-add" title="新建小组">
						<span class="nav-icons addteam1"></span>
						<span style="vertical-align:middle;">新建小组</span>
					</span>
                    <span id="teams-joinbutton" class="teams-add" title="加入小组">
						<span class="nav-icons addteam1"></span>
						<span style="vertical-align:middle;">加入小组</span>
					</span>
					 <span id="backallteams" class="teams-add" title="返回全部小组" style="display:none;">
						<span class="backmyteam"></span>
						<span style="vertical-align:middle;"> 返回全部小组</span>
					</span>
				</div>
			</div>
			<div class="teams-all-list"><div id="all_teams">
		
         <div class="teams-title"><label>我的小组</label></div>
		   <!-- 创建这个div是使其容易被选中 -->
		   <div id="teamlist">
			<!--  
			<div class="teams-item">
				<a class="team_list_logo" href=""><img src=""></a>
					<div class="team-tab tab-star" style="display: none; margin-left: 111px; margin-top: -131px;">
					<a class="f" team_id="" href=""></a>
				</div>
				<div class="teams-item-title"><a href="">群组名</a></div>
			</div>
			-->
			
		  </div>
		  <!-- teamlist结束 -->
		<div style="clear: both"></div>
	</div>
		
        <div class="transition_2 teams-setting-div" id="teams-add" style="margin-top:40px;width: 70%;display:none">

<div class="content_container teams-setting" >

	<div class="teams-setting-container">
		<div style="position:relative;width:160px;margin:0 auto;margin-top:5px;">
			<div class="teams-setting-logo-edit">
				<form id="upload_logo_form" action="/network/upload_img" method="post" enctype="multipart/form-data">
					<input onChange="" id="upload_logo_file" name="img" type="file">
					<input name="bucket" type="hidden" value="team_logo">
					<input type="hidden" id="logoFileName" name="logoFileName">
				</form>
			</div>
			<img id="team-logo" title="小组logo，建议尺寸200*200" style="width:150px;border-radius:50%;border:1px solid #ddd;" src="images/main/team.gif">
		</div>
		<div style="margin-bottom:4px;">
			<div class="teams-setting-title">小组名称</div>
			<input style="width:400px;" id="team-setting-name" type="text" class="txt" value="">
	   	</div>
		<div style="margin-bottom:4px;" class="setting-box">
			<div class="teams-setting-title">邀请码</div>
			<input style="width:400px;" id="team-setting-password" type="text" class="txt" value="">
		<!-- 
		<div style="margin-bottom:4px;" class="setting-box">
			<div class="teams-setting-title" style="padding-bottom:5px;">成员默认身份</div>
			<span id="default-role-span" tit="null" class="teams-role radius3" onClick="">
				
					创建者<span class="drop"></span>
				
			</span>
			<input type="hidden" id="default-role-value" value="4_author">
		</div>
		<br>
		<div style="margin-bottom:4px;" class="setting-box">
			<input type="checkbox" id="team-safe-setting">
    		<label for="team-safe-setting">允许文件对外发布</label>
		</div>
<!-- 		<div style="margin-bottom:4px;" class="setting-box">


<!-- 		</div> 
		<div style="margin-bottom:4px;" class="setting-box">
			<input type="checkbox" id="team-addJoinStream" checked="checked">
    		<label for="team-addJoinStream">显示成员加入的动态</label>
		</div>
		<div style="margin-bottom:4px;" class="setting-box">
			<input type="checkbox" id="team-setting-public">
    		<label for="team-setting-public">公开您的小组，其他人可以浏览并申请加入。</label>
		</div>
		<div id="joinType" style="display:none;margin-bottom:4px;margin-top:3px;" class="setting-box">
			<div class="teams-setting-title">小组成员加入方式</div>
			<input checked="checked" value="true" type="radio" id="team-setting-jointype1" name="team-setting-jointype">
    		<label for="team-setting-jointype1">管理员审核</label>
    		<input type="radio" value="false" id="team-setting-jointype2" name="team-setting-jointype">
    		<label for="team-setting-jointype2">直接加入无需审核</label>
		</div>
		-->
		<div style="padding:8px 0px;">
			<span id="btn_editteam" class="button green" >保存</span>&nbsp;&nbsp;
			
			<span class="button backteams" id="" >取消</span>
			
		</div>
	</div>
</div>
<ul id="roles_menu" class="popmenu shadow_1 radius3" style="z-index: 222;  top: 32px;">
    <li title_pos="right" title="小组的创建者可以设定管理员、创建、编辑小组文件、文档" onClick="">创建者</li>
	<li title_pos="right" title="小组的管理员可以创建、编辑小组文件、文档" onClick="">管理员</li>
	<li title_pos="right" title="成员仅拥有对小组内部数据标记的权限" onClick="">成员</li>
</ul>
</div>

 </div>
 <!-- teams-join开始 -->
 <div class="transition_2 teams-setting-div" id="teams-join" style="margin-top:40px;width: 70%;display:none">

   <div class="content_container teams-setting" >
	<div class="teams-setting-container">
		
		<div style="margin-bottom:4px;" class="setting-box">
		<h2>加入小组</h2>
			<div class="teams-setting-title">小组名称</div>
			<select id="team-join" class="txt" style="width:400px;" >
			  <option value="" selected="selected"></option>
			</select>
	   	
		
			<div class="teams-setting-title">邀请码</div>
			<input style="width:400px;" id="team-password" type="text" class="txt" value="">
		

		<div style="padding:8px 0px;">
			<span id="join" class="button green" >加入</span>&nbsp;&nbsp;
			
			<span class="button backteams" >取消</span>
			
		</div>
	     </div>
</div>
</div>

 </div>
  <!-- teams-join结束-->
   </div>    
  <div class="content-right" style="width:25%">
			
<div class="team-content-right transition_2" >

<div id="team-joined" style="display: none;">
   <div class="file-thumb">
	<img id="thumb_img" src="images/main/team.gif">
   </div>
   <div class="file-pre-box">
      <h3>已经加入的小组</h3>
        <ul id="team-joined-box">
          
        </ul>
   </div>
   
</div>

<div id="team-mark-result">
<div class="file-thumb">
	<img id="thumb_img" src="images/main/files.png">
</div>
<!-- <div class="file-split"></div> -->

<div class="file-pre-box">
	<h3>信息</h3>
	<ul id="preview_box">
		<li style="display: list-item;">
			标题：
			<span id="file_info_title">
					
					小组文件
				</span>
		</li>
		<li style="display: list-item;">
			小组名称：
			<span id="file_info_name"></span>
		</li>
		<li style="display: list-item;">
			文件数：
			<span id="file_info_num"></span>
		</li>
		<li style="display:list-item;">
			成员数：
			<span id="file_info_partner" ></span>
		</li>
		<li style="display: list-item;">
			完成情况：
			<span style="font-size:12px;" id="file_info_progress"></span>
		</li>
		<li style="display: list-item;">
			准确度：
			<span style="font-size:12px;" id="file_info_accuracy"></span>
		</li>
	</ul>
</div>
<div id="colla_items" class="pre-box"></div>


</div>   
            </div>
</div>

</body>
</html>