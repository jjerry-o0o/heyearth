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
				
				$("#comment_tb").html("<tr class='tr2'> <th class='th2'>내용</th> <th class='th2'>작성자</th> <th class='th2'>작성일</th></tr>");
				
				for(var i =0; i<data.length; i++){
					if(data[i].c_order == 0){						
						$("#comment_tb").append("<tr class='tr2' id='tr2"+i+"'><td class='td2'><input type='hidden' id='c_comment"
						+i+"' value='"+data[i].c_comment+"'>"+ data[i].c_comment+"</td> <td class='td2'>"+ data[i].id+
						"</td><td class='td2'>"+data[i].regdate+"</td></tr><tr class='tr3' id='tr3"+i+"'></tr>");
						
						$("#tr2"+i).append("<td class='td2'><button class='button' id='alter_btn"+i+"' onclick='alter("+i+")'>수정</button></td>"
							 + "<td class='td2'><button class='button' id='delete_btn"+i+"' onclick='remove("+i+")'>삭제</button></td>");
						
						$("#tr3"+i).append("<td class='td3' colspan='5'><input type='hidden' id='c_index"+i+"' name='c_index' value='"+ data[i].c_index+"'><div class='alter_div' id='alter_div"+i+"'></div></td>");
						$("#alter_div"+i).hide();
						$("#tr3"+i).hide();
					}
				};
			}
		});
	}
	
	function alter(i){
		$("#alter_div"+i).html("<form class='calter_div'>"
		+ "<textarea class='a_comment' id='a_comment"+i+"' name='c_comment' placeholder='"+ $("#c_comment"+i).val() +"' rows='1' cols='50'></textarea>"
		+ "<input type='hidden' id='a_index"+i+"' name='c_index' value='"+ $("#c_index"+i).val() +"'>"
		+ "<input type='button' class='button' id='alter"+i+"' value='수정등록' onclick='update("+i+")'>"
		+ "</form>");
		$("#alter_div"+i).show();
		$("#tr3"+i).show();
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

