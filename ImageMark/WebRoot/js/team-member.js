$().ready(function(){

	$(".contacts-items").click(function(){
		var userId = this.id;
		$.post("selectMarkTimes.do",{userId:userId},function(data){
			$("#mark-sum").text(data);
			var id = "memberName"+userId;
			$("#user-name").text($("#"+id).text());
		});
	});
	
});



     
   