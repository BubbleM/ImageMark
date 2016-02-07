
$().ready(function() {
	          //获取群组列表信息
			  $.post("teamlist.do",function(data){
				  for(var i=0;data[i]!=null;i++){
					  var list="";
					  list+="<tr> <td>"+data[i].teamId+"</td> <td>"+data[i].teamName+"</td> </tr>";
					  $("#myteams").append(list);
				  }
			  },"json");
			  
			  
			  
					$("#btn01").click(function() {
						var username = $("#username").val();
						if (username.length == 0) {
							alert("请输入用户名 ");
						} else {
							$.post("select.do", {
								username : username
							}, function(data) {
								alert(data);
							});
						}
					});

					$("#btn02").click(function() {
								var userid = $("#userid").val();

								$.post("ajaxuser.do", {
									userid : userid
								}, function(data) {
									alert(data.userid + "---" + data.username
											+ "---" + data.password);
								}, "json");

							});
				
		});
		$().ready(function() {
			
			//判断teamname是否已经存在
			$("#teamName").focusout(function(){
				var teamname = $("#teamName").val();
				$.post("isteamexist.do",{teamName:teamname},function(data){
					if(data == true){
						alert("用户名已存在！");
						return false;
					}
					
				});
			});
			//新建team
			$("#submitTeam").click(function(){
				var teamname = $("#teamName").val();
				var teampassword = $("#teamPassword").val();
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
							if(data == "success")
							       alert("新建小组成功！");
						});
					}
					
				});
				
			});
			
			       $.ajax({
			    	   url:"image.do",
			    	   type:"POST",
			    	   dataType:"json",
			    	   data:{pageNum:1,currentPage:1},
			    	   success:function(data){
			    		  // alert("success");
			    		   var image = "";
			    		   $("#totalpage").text(data.totalPage);
			    		   $("#pagenow").text(data.currentPage);
			    		   for(var i=0;data.dataList[i]!=null;i++){
			    			   image+=" <div class="+"img"+"><img style="+"width:300px;margin:5px;height:200px "+"src="+data.dataList[i].image_path+"><span class="+"name"+" >最小标记次数："+data.dataList[i].image_min+"---已经被标记的次数："+data.dataList[i].image_now+"</span> ";
			                   image+="<input class= mark_text id= mark_text_"+data.dataList[i].image_id+" type= text  /><input class= mark_btn id=  "+data.dataList[i].image_id+" type= button value= 提交 /></div>";  
			                  
			    		   }
			    		   $("#pic").html(image);
			    		   
			    	   },
			    	   error:function(){
			    		   alert:error;
			    	   }
			       });
			       
			       //保存标记结果
			     $("body").delegate(".mark_btn","click",function(){
			     	            
		                      // var mark_content = $("imput").val();
			    	          //获取添加值
			    	           var image_id = this.id;
		                       var content = $("#mark_text_"+this.id).val();
		                       
		                       $.ajax({
		                    	   url:"mark.do",
		                    	   type:"POST",
		                    	   data:{
		                    		   imageId:image_id,
		                    		   markContent:content
		                    	   },
		                           success:function(){
		                        	   alert("标记成功！");
		                           },
		                           error: function(XMLHttpRequest, textStatus, errorThrown) {
		                               alert(XMLHttpRequest.status);
		                               alert(XMLHttpRequest.readyState);//4
		                               alert(textStatus);//parsererror
		                           }
		                       });
			    	           
			    	            
		                          
		                           
		                        
	                })	;
			       	
			     function submit(pageNum){
			    	   $.ajax({
				    	   url:"image.do",
				    	   type:"POST",
				    	   dataType:"json",
				    	   data:{pageNum:pageNum},
				    	   success:function(data){
				    		  // alert("success");
				    		   var image = "";
				    		   $("#totalpage").text(data.totalPage);
				    		   $("#pagenow").text(data.currentPage);
				    		   for(var i=0;data.dataList[i]!=null;i++){
				    			   image+=" <div class="+"img"+"><img style="+"width:300px;margin:5px;height:200px "+"src="+data.dataList[i].image_path+"><span class="+"name"+" >最小标记次数："+data.dataList[i].image_min+"---已经被标记的次数："+data.dataList[i].image_now+"</span> ";
				                   image+="<input class= mark_text id= mark_text_"+data.dataList[i].image_id+" type= text  /><input class= mark_btn id=  "+data.dataList[i].image_id+" type= button value= 提交 /></div>";  
				                  
				    		   }
				    		   $("#pic").html(image);
				    		   
				    	   },
				    	   error:function(){
				    		   alert:error;
				    	   }
				       });
			       }
				    
			     //第一页
				   $("#firstpage").click(function(){
					   var currentPage = $("#pagenow").text();
						var total = $("#totalpage").text();
					   
					    if(currentPage == 1){
							   alert("已经是第一页！");
							   return false;
						   }else{
							   submit(1);
							   return true;
						   }
				   });
				   
				   //上一页
				   $("#previouspage").click(function(){
					   var currentPage = $("#pagenow").text();
						var total = $("#totalpage").text();
					 
					    if(currentPage == 1){
							   alert("已经是第一页！");
							   return false;
						   }else{
							  submit(currentPage-1);
							   return true;
						   }
				   });
				   
				   //下一页
				   $("#nextpage").click(function(){
					   var currentPage = $("#pagenow").text();
						var total = $("#totalpage").text();
					    if(currentPage == total){
							   alert("已经是最后一页！");
							   return false;
						   }else{
							   submit(currentPage-(-1));
							   return true;
						   }

				   });
				   
				   //尾页
				   $("#lastpage").click(function(){
					   var currentPage = $("#pagenow").text();
						var total = $("#totalpage").text();
					  
					    if(currentPage == total){
							   alert("已经是最后一页！");
							   return false;
						   }else{
							    submit(total);
							   return true;
						   }
				   });
				   
			
		});
	