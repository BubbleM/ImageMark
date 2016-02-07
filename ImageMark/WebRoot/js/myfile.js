$().ready(function() {
	
	
	 $("body").delegate(".img","click",function(){
			     	            
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
		                     
		  });
			    	           
	  $.ajax({
				    	   url:"image.do",
				    	   type:"POST",
				    	   dataType:"json",
				    	   data:{pageNum:1},
				    	   success:function(data){
				    		  // alert("success");
				    		   var image = "";
				    		   $("#totalpage").text(data.totalPage);
				    		   $("#pagenow").text(data.currentPage);
				    		   if(data.dataList[0]==null){
				    		   	$("#empty_imagefile").show();
				    		   	$("#page").hide();
				    		   	
				    		   }else{
				    		   	$("#empty_imagefile").hide();
				    		   	$("#page").show();
				    		   for(var i=0;data.dataList[i]!=null;i++){
				    			   image+=" <div id="+data.dataList[i].image_id+" class="+"img"+"><img style="+"width:240px;margin:5px;height:130px "+"src="+data.dataList[i].image_path+"></div> ";
				    		       
				    		   }
				    		   $("#pic").html(image);
				    		   }
				    		   
				    	   },
				    	   error:function(){
				    		   alert:error;
				    	   }
				       });
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
				    		   if(data.dataList[0]==null){
				    		   	$("#empty_imagefile").show();
				    		   	$("#page").hide();
				    		   }else{
				    		   	$("#empty_imagefile").hide();
				    		   	$("#page").show();
				    		   for(var i=0;data.dataList[i]!=null;i++){
				    			   image+=" <div id="+data.dataList[i].image_id+" class="+"img"+"><img style="+"width:240px;margin:5px;height:130px "+"src="+data.dataList[i].image_path+"></div> ";
				    		       
				    		   }
				    		   $("#pic").html(image);
				    		   }
				    		   
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
				   
				  //显示上传窗口
				 $("#upload-image").click(function(){
					 $("#import_file_window").show();
				 });
				 
				 //取消上传
				 $("#cancel-upload").click(function(){
					 $("#import_file_window").hide();
				 });
});
