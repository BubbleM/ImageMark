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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type='text/css'>body{font-family:'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial, sans-serif;}</style>
<link type='text/css' rel='stylesheet' href='css/icon.css'>
<link  type='text/css' rel='stylesheet' href="css/maintest.css">
<link  type='text/css' rel='stylesheet' href="css/all.css">
<link  type='text/css' rel='stylesheet' href="css/sty.css">
<link  type='text/css' rel='stylesheet' href="css/main.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/myfile.js"></script>
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
	<a href="myfile.jsp" id="d2" class="network-menu active" onclink>
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons files ac"></span>
			<span class="network-menu-title">我的文件</span>
		</span>
	</a>
	<a href="myteam.jsp" id="d3" class="network-menu">
		<span style="display:block;padding-top:40px;">
			<span class="nav-icons teams"></span>
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
				<div id="all" onClick="" class="network-nav-items active">
					<span class="nav-icons myfile"></span>
					<span class="nav-item-title">我的文件</span>
                </div>
            
            <!--暂且注释
                <div id="coopearation"  class="network-nav-items">
					<span class="nav-icons mycola"></span>
					<span class="nav-item-title">与我协作的</span>
				</div>
            <div tit="trash" class="network-nav-items">
					<span class="nav-icons mytrash"></span>
					<span class="nav-item-title">回收站</span>
				</div>
			 -->
            	<div class="clear"></div>
			</div>
            
            <div class="network-content">
            <div class="dir">
            <a href="#">我的文件</a>
            <input id="diagrams_title" name="diagrams_title" type="text" class="search_input" placeholder="文件搜索" value="">
            </div>
            
            <div class="main_btn">
            <div class="btn_group" >
            <!--  暂且注释
       <span class="button" onClick="">
			<span class="ico if if-import"></span>
			新建文件夹
		</span>
		
        <span class="button" id="upload-image">
			<span class="ico if if-import"></span>
			文件导入
		</span>
		-->
        
            </div> 
            <!--  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div class="btn_group" >
            <span class="button" id="delete-file"  >
			<span class="ico if if-import"></span>
			删除
		</span>
            </div>
            -->
            
            </div>
            <div id="content_image" class="content_container" style="height: 358px;">
            <div id="pic"></div>
    
	<div id="empty_imagefile" class="empty_tip">
		您的文件为空
		<div>
			您可以进入“我的群组”，先“新建群组”，然后，“上传”文件！
		</div>
		
	</div> 
	    <div id="page" style="text-align:center;">
	         总页数:<span id="totalpage"></span> 第<span id="pagenow"></span>页
         <input type="button" id="firstpage"  value="首页"/>
         <input type="button" id="previouspage" value="上一页"/>
         <input type="button" id="nextpage" value="下一页"/>
         <input type="button" id="lastpage" value="尾页"/>
		</div>
		<!-- page结束 -->      
    </div>
   </div>
 </div>
       
  <div class="content-right" style="width:25%">
			<div class="file-thumb">
				<img id="thumb_img" src="images/main/files.png"/>
			</div>
			<div id="preview_container">
				<div class="file-pre-box">
					<h3>信息</h3>
					<ul id="preview_box">
						<li class="noover" >
							文件编号：<span id="file-id"></span>
							<span id="file_info_title"></span>
						</li>
                        <li >
							最小标记次数：<span id="file-min"></span>
						</li>
						<!--
						<li >
							权限设置：
						</li>
						 <li>
							文件数：
							<span id="file_info_item"></span>
						</li> -->
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
					</ul>
					<!--  
                    <div class="fileModify-btn" id="submit">
                    <input class="button" type="button" value="设置" onClick=""></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" type="button" value="保存" onClick=""></input>
				    </div>
				    -->
                </div>
				<div id="colla_items" class="file-pre-box"></div>
			</div>
   
    <div id="import_file_window" title='选择本地文件'>
	<form action="" enctype="multipart/form-data" method="post" name="import_visio_file" id="import_visio_file">
		<div class="import_content">
			<div id="selectfile_btn" class="selectfile_btn button">
				<div class="ico"></div>
				选择文件
				<input type="file" name="importFilepath" id="importVisiopath" onChange="" />
				<input type="hidden" name="teamId" id="teamId" value="" />
			</div>
			<div class="only_file">请上传一个需要标记的文件</div>
			<div class="import_file_wraper">
				<label>文件名:</label><input type="text" class="txt" name="fileName" id="fileName"/>
			</div>
			<div id="import_error" class="alert error"></div>
			<div id="import_success" class="alert success"></div>
		</div>
		<div class="import_file_btns">
			<span class="button default submit_btn" >导入 </span>
			<span class="button" id="cancel-upload">取消 </span>
		</div>
	</form>
</div>
     <div id="dlg_new_folder" style="width:350px;display:none">
	<div class="dlg_content">
		<label>名称：</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="folder_new_title" type="text" class="txt">
	</div>
	<div class="dlg_buttons">
		<input type="button" id="btn_submit_folder" class="button default" value="确定">&nbsp;&nbsp;
		<input type="button" class="button" onClick="$('#dlg_new_folder').dialog('close')" value="取消">
	</div>
</div>

   
        
            </div>

</body>
</html>
