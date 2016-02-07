<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Amazing | 数据标记平台</title>
<meta name="description" content="Amazing是一个，，。">
<meta name="keywords" content="深度学习 大数据 数据标记">



 

<style type='text/css'>body{font-family:'Microsoft Yahei', 'Helvetica Neue', Helvetica, Arial, sans-serif;}</style>
<link type='text/css' rel='stylesheet' href='css/all.css'>

<link type='text/css' rel='stylesheet' href='css/icon.css'>


<script type="text/javascript">
// Google Anlytics


//   var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
//   document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F2e25a5f27e6a91adc897f5760b9f753f' type='text/javascript'%3E%3C/script%3E"));

var isIE=!!window.ActiveXObject;
var isIE6=isIE&&!window.XMLHttpRequest;
if(isIE6){
	window.location.href="/browser_not_support";
}
</script>

<link type='text/css' rel='stylesheet' href='css/home.css'/>

</head>
<body>
<div>
<div class="banner-left"></div>
<div class="banner-right"></div>
<div alt="one" class="banner banner1 active">
	<div class="banner-main">
	  <div class="banner-main-parent">
	    <div class="banner-main-parent">
	      <label class="banner-title">免费标记数据</label>
	      <div class="banner-content" style="width:270px;"> 我们。。。。介绍<br/>
	       一段介绍。
	        <div class="banner-op" style="bottom:-75px;"> <a href="login.jsp" class="button green banner-btn">登录</a>&nbsp;&nbsp;&nbsp; <a href="signup.jsp" class="button default banner-btn">注册</a> </div>
          </div>
	      <div class="banner-image" style="right:-200px;top:80px;"> <img alt="Amazing" style="width:680px;height:400px;src="images/banner4.jpg"/> </div>
        </div>
	  </div>
	</div>
</div>
<div alt="two" class="banner banner2">
	<div class="banner-main">
		<div class="banner-main-parent">
			<label class="banner-title" style="color:#fff;">发现更多知识</label>
			<div class="banner-content" style="color:#fff;float:right;">
				<br>介绍！没错！这里还要介绍！！！
				<div style="bottom:-30px;" class="banner-op">
					<a target="_blank" href="login.jsp" class="button green banner-btn">发现</a>&nbsp;&nbsp;&nbsp;
					<a href="signup.jsp" class="button default banner-btn">注册</a>
				</div>
			</div>
			<div class="banner-image" style="left:-200px;top:80px;">
				<img style="width:790px;height:340px;" src=""/>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div alt="three" class="banner banner3">
	<div class="banner-main">
		<div class="banner-main-parent">
			<label class="banner-title">更方便快捷</label>
			<div class="banner-content" style="width:300px;">
				这里还是一段介绍
				<div class="banner-op">
					<a href="login.jsp" class="button green banner-btn">立即登录</a>&nbsp;&nbsp;&nbsp;
					<a href="signup.jsp" class="button default banner-btn">注册</a>
				</div>
			</div>
			<div class="banner-image" style="right:-200px;top:10px;">
				<img style="width:700px;height:400px" src="images/banner4.jpg"/>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
</div>
<div class="banner-slider">
	<div class="banner-slider-op">
		<span onclick="home.toChange('one')" tit="one" class="active"></span>
		<span onclick="home.toChange('two')" tit="two" class=""></span>
		<span onclick="home.toChange('three')" tit="three" class=""></span>
	</div>
</div>
<div class="home-header-main">
	<div class="home-header">
		<img id="logo1" style="width:150px;vertical-align: middle;" src="images/logo1.png"/>
	
		<div  class="home-header-content">
			<a href="" target="_blank" class="home-header-content-items">关于我们</a>
			<a href="" target="_blank" class="home-header-content-items">发现</a>
			<a href="" target="_blank" class="home-header-content-items">服务</a>
<!-- 			<a href="/events" target="_blank" class="home-header-content-items"> -->

<!-- 			</a> -->
			
		</div>
		<div class="home-buttons">
				<a href="login.jsp" class="button">登录</a>&nbsp;&nbsp;
				<a href="signup.jsp" class="button">注册</a>
		</div>
	</div>
</div>

<div name="tool" id="tool" class="content">
<div  class="content-center">
	<div  style="margin:45px 0px;">
		<div class="content-center-items">
			<div class="content-center-items-title">高效免费的数据标记平台</div>
			<div class="content-center-items-content">
				Amazing是基于深度学习的。。。。。。。一大段介绍
			</div>
		</div>
		<div style="margin-left:60px;" class="content-center-image">
			<img style="width:550px;" alt='数据标记平台' class="content-image"
				src=".png"/>
		</div>
		<div style="clear:both;"></div>
	</div>

	<div style="margin:95px 0px;">
		<div class="content-center-items">
			<div class="content-center-items-title">实时协作</div>
			<div class="content-center-items-content">
				您可以随时邀请您的同事写作、一同标记。。。。。
			</div>
		</div>
		<div style="margin-left:50px;" class="content-center-image">
			<img class="content-image" style="width:560px;"
				src=".png"/>
		</div>
		<div style="clear:both;"></div>
	</div>

	<div style="margin:120px 0px 36px 0px;">
		<div style="float:left;width:580px;">
			<img class="content-image" style="width:580px;" src=".png"/>
		</div>
		<div style="width:240px;margin-left:56px;float:left;font-size:16px;">
			<div style="font-size:26px;color:#525252;">强大的深度学习模型</div>
			<div class="content-center-items-content">
	我们保证您的文件在Amazing是安全的。
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div style="margin:95px 0px;">
		<div style="float:left;width:270px;">
			<div style="font-size:26px;color:#525252;">建立模型</div>
			<div class="content-center-items-content">
			在Amazing您不仅可以建立模型。还可以。。。。。。
			</div>
		</div>
		<div style="width:580px;margin-left:46px;float:left;font-size:16px;">
			<img class="content-image" style="width:580px;" src="/themes/default/images/home/personal_network.png"/>
		</div>
		<div style="clear:both;"></div>
	</div>

	<div style="margin:95px 0px;">
		<div class="content-center-items">
			<div class="content-center-items-title">创建小组</div>
			<div class="content-center-items-content">
				您可以加入上传文件到小组。。。大家一起协作标记数据。
			</div>
		</div>
		<div style="margin-left:40px;" class="content-center-image">
			<img class="content-image" style="width:570px;"
				src=".png"/>
		</div>
		<a name="useing"></a>
		<div style="clear:both;"></div>
	</div>
	
	<div style="clear:both;"></div>
	
<div id="p-bottom">
	<div class="global_footer_content">
	
		<div>Amazing基于深度学习的数据标记平台 &copy;2016&nbsp; 展示专用版</div>
	
		<ul class="footer_items">
			
			<li><a href="signup.jsp">注册</a></li>
			<li><a href="login.jsp">登录</a></li>
			
			<li><a href="/about">关于我们</a></li>
			<li><a href="/tour">功能</a></li>
			<li><a href="/privacy">隐私权政策</a></li>
			<li><a href="/tos">服务条款</a></li>
		</ul>
		
		</div>
		</div>
	</div>
</div>

</body>
</html>