$().ready(function() {
	$.ajax({
				url : "imageFirst.do",
				type : "POST",
				dataType : "json",				
				success : function(data) {
					if(data[0] != null){
						for (var i = 0; data[i] != null; i++) {
							$(".imageMarking").attr("id", data[i].image_id);
							$(".imageMarking").attr("src", data[i].image_path);
						}
					}else{
						
						$("#finish").show("slow");
						$("#unfinish").hide();
					}
					
				},
				error : function() {
					alert : error;
				}
			});

	// 标记功能
	$("#mark_yes").click(function() {
				var content = $("#mark_content").val();
				var image_id = $(".imageMarking").attr("id");
				if(content == null || content == ""){
					alert("请输入标记信息！");
					return false;
				}
				$.ajax({
							url : "mark.do",
							type : "POST",
							data : {
								imageId : image_id,
								markContent : content
							},
							success : function() {
								alert("标记成功！");
								 $("#mark_content").val("");
								 
								 //标记成功后刷新图片
								 $.ajax({
										url : "imageFirst.do",
										type : "POST",
										dataType : "json",				
										success : function(data) {
											if(data[0] != null){
												for (var i = 0; data[i] != null; i++) {
													$(".imageMarking").attr("id", data[i].image_id);
													$(".imageMarking").attr("src", data[i].image_path);
												}
											}else{
												alert("暂时没有新的标记任务！");
												$("#finish").show("slow");
												$("#unfinish").hide();
											}
										},
										error : function() {
											alert : error;
										}
									});
							},
							error : function(XMLHttpRequest, textStatus,
									errorThrown) {
								alert(XMLHttpRequest.status);
								alert(XMLHttpRequest.readyState);// 4
								alert(textStatus);// parsererror
							}
						});
			   
	});
				
});
