$().ready(function(){
	//修改小组信息
	 $("#btn_saveteam").click(function(){
				var teamid = $("#data_teamId").val();
				var teampassword = $("#team-setting-password").val();
				if(teampassword == ""){
					alert("群组口令不能为空！");
					return false;
				}else{
						$.post("alterteam.do",{teamId:teamid,teamPassword:teampassword},function(data){
							if(data == "success")
							      alert("修改小组成功！");
							else
							    alert("修改小组失败！");
						});
				}
					
			 });
			 
		  $("#btn_deleteteam").click(function(){
			  var teamid = $("#data_teamId").val();
			  $.post("ifUserDeleteTeam.do",{teamId:teamid},function(data){
				  if(data == false){
					  alert("请选择自己新建的小组！");
					  return false;
				  }else{
					  $.post("isTeamNull.do",{teamId:teamid},function(data){
						  if(data == false){
							 var choice = confirm("小组不为空！是否删除所有的图片和标记信息！");
							 if(choice){
								 window.location.href="deleteTeam.do?teamId="+teamid;
//								$.ajax({
//									url:"deleteTeam.do",
//									data:{teamId:teamid},
//									async:false,
//									success:function(data){
//										if(data)
//										 window.location.href="myteam.jsp";
//									}
//								});
								 
							 }else{
								 return false;
							 }
							 
						  }else{
							  var choice = confirm("小组将会被删除！");
								 if(choice){
									 window.location.href="deleteTeam.do?teamId="+teamid;
//									 $.post("deleteTeam.do",{teamId:teamid}); 
									 
								 }else{
									 return false;
								 }
								 
						  }
					  });
				  }
			  });
			 
		  });
	 });


     
   