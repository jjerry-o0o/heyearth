	function selectlist(){
		$.ajax({
			type:"get",
			url:"/selectcomment",
			data : "b_no=" + $(".b_no").val(),
			dataType: "json",
			success:function(data){
				
				for(var i =0; i<data.length; i++){
					$("#list_div").append("<div class='comment'>"
						+ "<table class='comment_tb' class='comment'> " 
						+ "<tr class='tr2'> <th class='th2'>내용</th> <th class='th2'>작성자</th> <th class='th2'>작성일</th></tr>"
						+ "<tr class='tr2'><td class='td2'><input type='hidden' id='c_comment"+i+"' value='"+data[i].c_comment+"'>"+ data[i].c_comment+"</td> <td class='td2'>"+ data[i].id+"</td><td class='td2'>"+data[i].regdate+"</td></tr>"
						+ "</table>"
						+ "<input type='hidden' id='c_index"+i+"' name='c_index' value='"+ data[i].c_index+"'></div>");
					
					if($(".id").val() == data[i].id){
						$("#list_div").append("<div class='btn_div'><button class='button' id='alter_btn"+i+"' onclick='alter("+i+")'>수정</button>"
						 + "<button class='button' id='delete_btn"+i+"' onclick='remove("+i+")'>삭제</button></div>");
					}
					
					$("#list_div").append("<div class='alter_div' id='alter_div"+i+"'></div>");
				};
			}
		});
	}
	
	function alter(i){
		$("#alter_div"+i).append("<form class='calter_div'>"
		+ "<textarea class='a_comment' id='a_comment"+i+"' name='c_comment' placeholder='"+ $("#c_comment"+i).val() +"' rows='3' cols='50'></textarea>"
		+ "<input type='hidden' id='a_index"+i+"' name='c_index' value='"+ $("#c_index"+i).val() +"'>"
		+ "<input type='button' class='button' id='alter"+i+"' value='수정등록' onclick='update("+i+")'>"
		+ "</form>");
	}
	
	function update(i){
		alert("댓글이 수정되었습니다.");
		
		$.ajax({
			type:"post",
			url:"/updatecomment",
			data : {"c_index" : $("#a_index"+i).val(), "c_comment" : $("#a_comment"+i).val()},
			success:function(data){
				$("#list_div").empty();
				selectlist();
			}
		});
	}

	
	function remove(i){
		alert("댓글이 삭제되었습니다.");
		
		$.ajax({
			type:"post",
			url:"/deletecomment",
			data : {"c_index" : $("#c_index"+i).val()},
			success:function(data){
				$("#list_div").empty();
				selectlist();
			}
		});
	}