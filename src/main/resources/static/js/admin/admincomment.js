$(document).ready(function(){
	
	selectlist();
	
	$("#boardback").one('click',function(){
		location.href = "adminboard";
	});
	
	$("#cinput_btn").on("click", function(){
		if($("#c_comment").val() != null){
			alert("댓글이 작성되었습니다.");
			$.ajax({
				type:"post",
				url:"/admincommentinsert",
				data : {"c_comment" : $("#c_comment").val(),"id" : $("#id").val(),  "b_no" : $("#b_no").val()},
				success:function(){
					$("#c_comment").val("");
					$("#comment_tb").empty();
					selectlist();
				}
			});
		}
	});
	
	

})

	function selectlist(){
		$.ajax({
			type:"get",
			url:"/admincommentlist",
			data : {"b_no" : $("#b_no").val()},
			success:function(data){
				
				$("#list_div").empty();
				
				for(var i =0; i<data.length; i++){
					if(data[i].c_order == 0){						
						$("#list_div").append("<div class='comment' id='comment"+i+"'>"+
							"<div id='c_writer"+i+"' class='c_writer'>"+data[i].id+"</div>&nbsp; | &nbsp;"+
							"<div id='c_date+"+i+"' class='c_date'>"+data[i].regdate + "</div>"+
							"<div id='c_btn"+i+"' class='c_btn'>"+
								"<button class='button' id='alter_btn"+i+"' onclick='alter("+i+")'>수정</button>"+
								"<button class='button' id='delete_btn"+i+"' onclick='remove("+i+")'>삭제</button>"+
							"</div>"+
							"<div class='c_content' id='c_content"+i+"'>"+
								"<input type='hidden' id='c_comment"+i+"' value='"+data[i].c_comment+"'>"+ data[i].c_comment+
							"</div>"+
							"<div class='c_mod' id='c_mod"+i+"'></div>"+
						"</div>");
							
						
						
						$("#c_mod"+i).append("<input type='hidden' id='c_index"+i+"' name='c_index' value='"+ data[i].c_index+"'><div class='alter_div' id='alter_div"+i+"'></div>");
						$("#alter_div"+i).hide();
						$("#c_mod"+i).hide();
					}
				};
			}
		});
	}
	
	function alter(i){
		$("#alter_div"+i).html("<form class='calter_div'>"
		+ "<div class='a_comment_title'>댓글 수정중..</div>"
		+ "<input class='a_comment' id='a_comment"+i+"' name='c+comment' placeholder='"+ $("#c_comment"+i).val()+"'>"
		+ "<input type='hidden' id='a_index"+i+"' name='c_index' value='"+ $("#c_index"+i).val() +"'>"
		+ "<input type='button' class='altbutton' id='alter"+i+"' value='수정등록' onclick='update("+i+")'>"
		+ "<input type='button' class='altbutton' id='back"+i+"' value='수정취소' onclick='updateback("+i+")'>"
		+ "</form>");
		$("#alter_div"+i).show();
		$("#c_mod"+i).show();
	}
	
	function update(i){
		alert("댓글이 수정되었습니다.");
		$.ajax({
			type:"post",
			url:"/admincommentupdate",
			data : {"c_index" : $("#a_index"+i).val(), "c_comment" : $("#a_comment"+i).val()},
			success:function(){
				$("#a_comment"+i).val("");
				$("#alter_div"+i).hide();
				$("#tr3"+i).hide();
				$("#comment_tb").empty();
				selectlist();
			}
		});
	}
	
	function updateback(i){
		$("#alter_div"+i).hide();
		$("#c_mod"+i).hide();
	}

	
	function remove(i){
		alert("댓글이 삭제되었습니다.");
		
		$.ajax({
			type:"post",
			url:"admincommentdelete",
			data : {"c_index" : $("#c_index"+i).val()},
			success:function(){
				$("#comment_tb").empty();
				selectlist();
			}
		});
	}

