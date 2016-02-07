$().ready(function() {
	
	 $("body").delegate(".list_item","click",function(){
			     	            
		                       var image_id = this.id;
		                       
		                       $.ajax({
		                    	   url:"selectImage.do",
		                    	   type:"POST",
		                    	   dataType:"json",
		                    	   data:{
		                    		   imageId:image_id
		                    	   },
		                           success:function(data){
		                        	    $("#file-id").text(data[0].image_id);
		                        	    $("#file-min").text(data[0].image_min);
		                        	    $("#file-now").text(data[0].image_now);
		                        	    $("#thumb_img").attr("src",data[0].image_path);
		                        	    if(data[0].image_now <= 0){
		                        	    	 $("#file-status").text("未被标记");
		                        	    }else{
		                        	    	if(data[0].image_now < data[0].image_min){
		                        	    		$("#file-status").text("正在被标记");
		                        	    	}else{
		                        	    		$("#file-status").text("标记完成");
		                        	    	}
		                        	    }
		                           },
		                           error: function(XMLHttpRequest, textStatus, errorThrown) {
		                               alert(XMLHttpRequest.status);
		                               alert(XMLHttpRequest.readyState);//4
		                               alert(textStatus);//parsererror
		                           }
		                       });
		                       $.ajax({
		                    	   url:"selectimageresult.do",
		                    	   type:"POST",
		                    	   dataType:"json",
		                    	   data:{
		                    		   imageId:image_id
		                    	   },
		                    	   success:function(data){
		                    		   $("#file-accuracy").text(data.markAccuracyOne*100+"%");
		                    		   if(data.markResult != null){
		                    			   $("#file-result").text(data.markResult);
		                    		   }else{
		                    			   $("#file-result").text("");
		                    		   }
		                    	   }
		                       });
		                     
		                                     $("#delete-file").fadeIn("slow");
		  });
	//获取超链接中的值
	function getUrlParam(name) {  
	       var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");  
	       var r = window.location.search.substr(1).match(reg);  
	       if (r!=null)   
	           return unescape(r[2]);   
	       return null;  
	         
	}  
      	           
	  $.ajax({
				    	   url:"team-file-page.do",
				    	   type:"POST",
				    	   dataType:"json",
				    	   data:{pageNum:1,teamid:getUrlParam("teamid"),teamname:getUrlParam("teamname")},
				    	   success:function(data){
				    		  // alert("success");
				    		  
				    		   var image = "";
				    		   $("#totalpage").text(data.totalPage);
				    		   $("#pagenow").text(data.currentPage);
				    		   if(data.dataList[0]==null){
				    		   
				    		   	$("#page").hide();
				    		   }else{
				    		  
				    		   	$("#page").show();
				    		   for(var i=0;data.dataList[i]!=null;i++){
				    			   image+=" <li class='list_item' tp='folder' id="+data.dataList[i].image_id+" img="+data.dataList[i].image_path+" >";
					    		   image+="<div class='title'><span class='ico folder_list'></span><a href='#'>"+data.dataList[i].image_id+"</a></div>";
					    		   image+=" <div class='owner'>"+data.userName+"</div><div class='modefied'>"+data.dataList[i].image_path+"</div></li>";
				    		   }
				    		   $("#content-list").html(image);
				    		   }
				    		   
				    	   },
				    	   error:function(){
				    		   alert("error");
				    	   }
				       });
	 function submit(pageNum){
			    	   $.ajax({
				    	   url:"team-file-page.do",
				    	   type:"POST",
				    	   dataType:"json",
				    	   data:{pageNum:pageNum,teamid:getUrlParam("teamid"),teamname:getUrlParam("teamname")},
				    	  success:function(data){
				    		  // alert("success");
				    		   var image = "";
				    		   $("#totalpage").text(data.totalPage);
				    		   $("#pagenow").text(data.currentPage);
				    		   if(data.dataList[0]==null){
				    		  
				    		   	$("#page").hide();
				    		   }else{
				    		  
				    		   	$("#page").show();
				    		   for(var i=0;data.dataList[i]!=null;i++){
				    			image+=" <li class='file_item list_item' tp='folder' id="+data.dataList[i].image_id+" img="+data.dataList[i].image_path+" >";
				    			image+="<div class='title'><span class='ico folder_list'></span><a href='#'>"+data.dataList[i].image_id+"</a></div>";
				    			image+=" <div class='owner'>"+data.userName+"</div><div class='modefied'>"+data.dataList[i].image_path+"</div></li>";
				    		
				    		   }
				    		   $("#content-list").html(image);
				    		   }
				    		   
				    	   },
				    	   error:function(){
				    		   alert("error");
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
				   
			//显示上传窗口
		    $("#btn_uploadimage").click(function(){
		    	$("#content-left-unclick").hide();
		    	$("#imageupload").show();
		    	
		    });
		    
		    //隐藏上传窗口
		    $("#back-team-file").click(function(){
		    	$("#imageupload").hide();
		    	$("#content-left-unclick").show();
		    });
		    
		    $("#cancel-upload").click(function(){
		    	$("#imageupload").hide();
		    	$("#content-left-unclick").show();
		    });
		    
		    //删除图片
		    $("#delete-file").click(function(){
		    	var choice = confirm("图片，以及与其相关的标记信息将会被删除！");
		    	var imageId = $("#file-id").text();
		    	if(choice){
		    		window.location.href="deleteImage.do?teamId="+getUrlParam("teamid")+"&teamName="+getUrlParam("teamname")+"&imageId="+imageId;
		    	}else{
		    		return false;
		    	}
		    });
});
