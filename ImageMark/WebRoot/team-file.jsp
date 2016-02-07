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

<meta charset="utf-8">
<style type='text/css'>body{font-family:'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial, sans-serif;}</style>
<link type='text/css' rel='stylesheet' href='css/icon.css'>
<link  type='text/css' rel='stylesheet' href="css/maintest.css">
<link  type='text/css' rel='stylesheet' href="css/all.css">
<link  type='text/css' rel='stylesheet' href="css/sty.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type='text/javascript'  src='js/team-file.js'></script>
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
		<div class="content-left"  id="content-left-unclick" style="margin-right: 200px;width:75%">
		<div class="network-nav">

				<div tit="diagrams" onClick="" class="network-nav-items active ">
					<a href="team-file.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons myfile"></span>
					<span class="nav-item-title">小组文件</span></a>
				</div>
			<!--	<div tit="notes" onclick="" class="network-nav-items">
					<span class="nav-icons notes"></span>
					<span class="nav-item-title">小组文档</span>
				</div>
                !-->

				<div tit="members" onClick="" class="network-nav-items" href="/team-member">
					<a href="team-member.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons myteamfile"></span>
					<span class="nav-item-title">小组成员</span></a>
				</div>
                <div tit="setting" onClick="" class="network-nav-items">
                    <a href="team-setting.do?teamid=${teamid}&teamname=${teamname}"><span class="nav-icons setting"></span>
						<span class="nav-item-title">小组设置</span></a>
					</div>
               </div>
     <div class="network-content">
     <div class="dir">
	<a href="team-file.do?teamid=${teamid}&teamname=${teamname}" folderid="root" onClick="">小组文件</a>
	
			<span class="split">&gt;</span>
			<a href="javascript:;" folderid="" onClick="">.</a>
	
</div>
  <div class="main_btns">
	
	<div class="btn_group">
		<span class="button" id="btn_uploadimage" >
			<span class="ico bt dm_add" ></span>
			上传文件
		</span><span style="color:red;font-size:10px;">${result}</span>
		<!-- 暂且注释
		<span class="button" onClick="diagrams.showTitleEdit('new')">
			<span class="ico bt folder_add"></span>
			新建文件夹
		</span>
		 -->
	</div>
<!--  暂且注释
	<span id="file-edit" tit="edit" class="button btn_operation" onClick="" style="display: none;">
		<span class="ico bt edit"></span>
		编辑
	</span>
	<span id="file-view" class="button btn_viewer btn_operation" onClick="" style="display: none;">
		<span class="ico bt view"></span>
		浏览
	</span>
	<span id="file-open" class="button btn_viewer btn_operation" onClick="diagrams.openFolder()" style="display:none;">
		打开
	</span>
	
	<span id="file-del" class="button btn_operation" onClick="diagrams.deleteConfirm()" style="display: none;">
		<span class="ico bt delete"></span>
		删除
	</span>
	<span id="file-more" class="button btn_operation" onClick="diagrams.showMoreMenu(this)" style="display: none;">
		更多<span class="drop"></span>
	</span>
	
	<ul class="right">
		<li>
			<span class="button" onClick="">
				排序
				<span class="drop"></span>
			</span>
		</li>
		<li>
			<div class="viewtype">
				<span class="list current" onClick="" original-title="List view"></span>
				<span class="icon " onClick="" original-title="Icon view"></span>
			</div>
		</li>
	</ul>
	-->
</div>
<div class="content_container" style="height: 358px;">

	
	<ul class="content_layout content_main item_list" id="content-list" style="padding: 10px 0px 10px 10px;">
		<li class="header">
			<div class="title">编号</div>
			<div class="owner">上传者</div>
			<div class="modefied">路径</div>
		</li>
		
		
	</ul>
	<div id="page" style="text-align:center;">
	         总页数:<span id="totalpage"></span> 第<span id="pagenow"></span>页
         <input type="button" id="firstpage"  value="首页"/>
         <input type="button" id="previouspage" value="上一页"/>
         <input type="button" id="nextpage" value="下一页"/>
         <input type="button" id="lastpage" value="尾页"/>
		</div>
		<!-- page结束 -->    
	
<!-- 	****************Preview Details***************	 -->
	<div class="clear"></div>

</div>
     </div>
          
		
				<div class="clear"></div>
			</div>
<!-- 文件上传，开始 -->
 <div class="content-left" id="imageupload" style="margin-right: 200px;width:75%;display:none;">
 <div class="network-nav">

				<div tit="diagrams"  class="network-nav-items active ">
					<span class="backmyteam"></span>
					<span class="nav-item-title" id="back-team-file">返回小组文件</span>
				</div>
			</div>
    <h1 style="color:#666">上传文件</h1>
    <hr>
    <form action="smartupload.do?teamid=${teamid}&teamname=${teamname}" method="post" enctype="multipart/form-data">
                             请选择文件：<input type="file" name="myfile1"/><br>
                             请选择文件：<input type="file" name="myfile2"/><br>
                            请选择文件：<input type="file" name="myfile3"/><br>
                             请选择文件：<input type="file" name="myfile4"/><br>
                             请选择文件：<input type="file" name="myfile5"/><br>             
         <input type="submit" value="提交"/><input type="button" id="cancel-upload" value="取消"/><br>
           <span style="color:red;">${result}</span>
    </form>
 </div>
 <!-- 文件上传，结束-->
  <div class="content-right" style="width:25%">
			<div class="network-right-team" style="display: none;">
				<div>
					<img src="/images/default/network/team.png">
				</div>
				<div style="margin-top:5px;">
						<a class="network-right-team-name" href="#">lll</a>
					</div>
				<div style="margin:8px 25px 0px 25px;border-bottom:1px solid #eee;box-shadow:0px 0px 2px #fff inset;"></div>
			</div>
			<div class="content-right-box" style="display: none;">





    

<div class="content-right-title">
	最新公告
	
</div>
<div id="suggestusers">
	
	小组文档中暂时没有内容
	
</div>
</div>
			<div class="team-content-right transition_2" style="display: block;">







<div class="file-thumb">
	<img id="thumb_img" src="images/main/files.png">
</div>
<!-- <div class="file-split"></div> -->

<span class="button btn_publish" onClick="diagrams.showPublish()" style="margin: 10px 30px 0px; display: none;">
	发布
</span>
<div class="file-split btn_publish" style="display: none;"></div>

<div class="file-pre-box">
	<h3>文件信息</h3>
	<ul id="preview_box">
		
		<li class="noover" >
							文件编号：<span id="file-id"></span>
							<span id="file_info_title"></span>
						</li>
                        <li >
							最小标记次数：<span id="file-min"></span>
						</li>
						
						<li >
							状态：<span id="file-status"></span>
						</li>
						<li >
							被标记次数：<span id="file-now"></span>
						</li>
                        
						<li >
							正确率：<span id="file-accuracy"></span>
						</li>
					    	<li >
							标记结果：<span id="file-result"></span>
						</li>
						<li class="noover"  >
						    <span id="delete-file" class="button" style="display:none;">删除</span>
						</li>
						
					
	</ul>
</div>
<div id="colla_items" class="pre-box"></div>
</div>
		</div>
				
				
				
			</div>
		
</div>
           

</body>
</html>