$().ready(function(){
	//显示标记情况
	 $("body").delegate(".teams-item","click",function(){
	 	$(".team-content-right").show();
	 	$("#file_info_name").text(this.id);
	 	
	 	$.ajax({
	 		url:"getteaminfo.do",
	 		type:"POST",
	 		dataType:"json",
	 		data:{teamName:this.id},
	 		success:function(data){
	 			$("#file_info_num").text(data.imageSum);
	 			$("#file_info_partner").text(data.userSum);
	 			if(data.markProgress != null){
	 				$("#file_info_progress").text(data.markProgress*100+"%");
	 			}else{
	 				$("#file_info_progress").text("");
	 			}
	 			
	 			if(data.markAccuracy != null){
	 				$("#file_info_accuracy").text(data.markAccuracy*100+"% ");
	 			}else{
	 				$("#file_info_accuracy").text("");
	 			}
	 			
	 		}
	 	    
	 	});
	 	
	 });
	//显示现有的小组
$.ajax({
	   url:"teamlist.do",
	   dataType:"json",
	   async:false,
	   success:function(data){
	   	for(var i=0;data[i]!=null;i++){
			  var list="";
			  list+="<div class= 'teams-item' id='"+data[i].teamName+"'><img src='images/main/team.gif'>";
			  list+="<div class='team-tab tab-star' style='display: none; margin-left: 111px; margin-top: -131px;'>";
			  list+="<a class='f' team_id='"+data[i].teamId+"' href='team-member.do?teamid="+data[i].teamId+"&teamname= "+data[i].teamName+"'></a></div>";
		      list+="<div class='teams-item-title'><a  href='team-member.do?teamid="+data[i].teamId+"&teamname= "+data[i].teamName+"'>"+data[i].teamName+"</a></div></div>";
			//  list+="<tr> <td>"+data[i].teamId+"</td> <td>"+data[i].teamName+"</td> </tr>";
			  $("#teamlist").append(list);
		  }
	   }
	 });
	//显示参加的小组
     
	 //显示添加小组
	 $("#teams-addbutton").click(function(){
	 	$("#teams-add").show();
	 	$("#backallteams").show();
	 	$("#teams-join").hide();
	 });
	 //显示加入小组
	 $("#teams-joinbutton").click(function(){
	 	$("#teams-join").show();
	 	$("#backallteams").show();
	 	$("#teams-add").hide();
	 	$(".team-content-right").show();
	 	$("#team-mark-result").hide();
	 	$("#team-joined").show();
	 	
	 	$.ajax({
	 		url:"getteam-notjoin.do",
	 		type:"POST",
	 		dataType:"json",
	 		success:function(data){
	 			for(var i=0;data[i]!=null;i++){
	 				var option="";
	 				 option+="<option value='"+data[i].teamId+"' >"+data[i].teamName+"</option>";
	 				 $("#team-join").append(option);
	 			}
	 		},
	 		error:function(){
	 			alert("出现错误！");
	 		}
	 	});
	 	
	 	//用以显示已经加入的小组
	 	$.ajax({
	 		url:"teamlistJoined.do",
	 		type:"POST",
	 		dataType:"json",
	 		success:function(data){
	 			for(var i=0;data[i]!=null;i++){
	 				var option="";
	 				 option+="<li>"+data[i].teamName+"</li>";
	 				 $("#team-joined-box").append(option);
	 			}
	 		},
	 		error:function(){
	 			alert("出现错误！");
	 		}
	 	});
	 });
	 
	 //返回全部小组
	 $("#backallteams").click(function(){
//	    $("#teams-add").hide();
//	 	$("#backallteams").hide();
//	 	$("#teams-join").hide();
	 	window.location.href="myteam.jsp";
	 });
	 
	 $(".backteams").click(function(){
//	    $("#teams-add").hide();
//	 	$("#backallteams").hide();
//	 	$("#teams-join").hide();
	 	 window.location.href="myteam.jsp";
	 });
	 
	//判断teamname是否已经存在
			$("#team-setting-name").focusout(function(){
				var teamname = $("#team-setting-name").val();
				$.post("isteamexist.do",{teamName:teamname},function(data){
					if(data == true){
						alert("用户名已存在！");
						return false;
					}
					
				});
			});
			
			
			//新建team
			$("#btn_editteam").click(function(){
				var teamname = $("#team-setting-name").val();
				var teampassword = $("#team-setting-password").val();
				if(teamname == ""){
					alert("请填写用户名！");
					return false;
				}else{
					if(teampassword == ""){
						alert("群组口令不能为空！");
						return false;
					}
				}
				$.post("isteamexist.do",{teamName:teamname},function(data){
					if(data == true){
						alert("用户名已存在！");
						return false;
					}else{
						$.post("addteam.do",{teamName:teamname,teamPassword:teampassword},function(data){
							if(data == "success"){
							
								$("#team-setting-name").val("");
								$("#team-setting-password").val("");
							    alert("新建小组成功！");
							}
						});
					}
					
				});
				
			});
			
			//加入群组
			$("#join").click(function(){
				var teamid = $("#team-join").val();
				var teampassword = $("#team-password").val();
				if("" == teamid){
					alert("请选择要加入的群组");
					return false;
				}else{
					if(teampassword == ""){
						alert("请输入邀请码！");
						return false;
					}else{
						$.post("getteampassword.do",{teamId:teamid},function(data){
							if(teampassword != data){
								$("#team-password").val("");
								alert("邀请码不正确，请重新输入!");
							}else{
								$.post("jointeam.do",{teamId:teamid},function(data){
									if(data == "success"){
										alert("加入群组成功！");
										//用以显示已经加入的小组
									 	$.ajax({
									 		url:"teamlistJoined.do",
									 		type:"POST",
									 		dataType:"json",
									 		success:function(data){
									 			 $("#team-joined-box").empty();
									 			for(var i=0;data[i]!=null;i++){
									 				var option="";
									 				 option+="<li>"+data[i].teamName+"</li>";
									 				 $("#team-joined-box").append(option);
									 			}
									 		},
									 		error:function(){
									 			alert("出现错误！");
									 		}
									 	});
									}else{
										alert("加入群组失败！");
									}
									
								});
							}
						});
						
					}
				}
			});
	 
});



     
   