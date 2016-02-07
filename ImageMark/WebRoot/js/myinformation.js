$().ready(function() {
	
	//显示修改密码的选项
	  $("#passwordModify").click(function(){
		  $("#modifyPasswordInput").show("slow");
	  });  
	  
	  // 修改密码的判断
	  $("#passwordChange").click(function(){
		  var oldPassword= $("#oldPassword").val();
		  var newPassword= $("#newPassword").val();
		  var newPasswordAgain= $("#newPasswordAgain").val();
		  if(oldPassword == "" || oldPassword == null){
			  alert("请输入旧密码！");
			  return false;
		  }
		  if(newPassword == "" || newPassword == null){
			  alert("请输入新密码！");
			  return false;
		  }
		  if(newPasswordAgain == "" || newPasswordAgain == null){
			  alert("请再次输入新密码！");
			  return false;
		  }
		  
		  if(newPassword != newPasswordAgain){
			  alert("两次输入的密码不匹配！");
			  return false;
		  }
		  
		  $.post("getUserPassword.do",function(data){
			  if(data != oldPassword){
				  alert("旧密码输入错误！");
				  return false;
			  }else{
				  $.ajax({
					  url:"modifyPassword.do",
					  type:"POST",
					  async:false,
					  data:{password:newPassword},
					  success:function(){
						  alert("修改密码成功！");
						  $("#modifyPasswordInput").hide("slow");
					  }
					  
				  });
//				  $.post("modifyPassword.do",{password:newPassword},function(){
//					  alert("修改密码成功！");
//				  });
			  }
		  });
		  
		  
	  });
	  
	  //取消密码修改
	  $("#cancelChange").click(function(){
		  $("#modifyPasswordInput").hide("slow");
	  });
	  
});
	