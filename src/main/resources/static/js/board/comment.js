	function selectlist(){
		$.ajax({
			type:"get",
			url:"/selectcomment",
			data : "b_no=" + $(".b_no").val(),
			dataType: "json",
			success:function(data){
				
				if(data.length !=0){
					$("#comment_tb").append("<tr class='tr2'> <th class='th2'>내용</th> <th class='th2'>작성자</th> <th class='th2'>작성일</th></tr>");
				
					for(var i =0; i<data.length; i++){
						$("#comment_tb").append("<tr class='tr2' id='tr2"+i+"'><td class='td2'><input type='hidden' id='c_comment"+i+"' value='"+data[i].c_comment+"'>"+ data[i].c_comment+"</td> <td class='td2'>"+ data[i].id+"</td><td class='td2'>"+data[i].regdate+"</td></tr>");
						
						if($(".id").val() == data[i].id){
							$("#tr2"+i).append("<td class='td2'><button class='button' id='alter_btn"+i+"' onclick='alter("+i+")'>수정</button></td>"
							 + "<td class='td2'><button class='button' id='delete_btn"+i+"' onclick='remove("+i+")'>삭제</button></td>");
						}
						
						$("#list_div").append("<input type='hidden' id='c_index"+i+"' name='c_index' value='"+ data[i].c_index+"'><div class='alter_div' id='alter_div"+i+"'></div>");
					};
				}
				
			}
		});
	}
	
		
	function insert(){
		$.ajax({
			type:"post",
			url:"/insertcomment",
			data : {"id" : $(".id").val(), "c_comment" : $("#c_comment").val(), "b_no" : $(".b_no").val()},
			success:function(){
				$("#c_comment").val("");
				$("#comment_tb").empty();
				selectlist();
			}
		});
	}
	
	function alter(i){
		$("#alter_div"+i).append("<form class='calter_div'><h3 class='comment_h'>'"+$("#c_comment"+i).val()+"'을<br>수정중입니다.</h3>"
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
			success:function(){
				$(".alter_div").empty();
				$("#comment_tb").empty();
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
			success:function(){
				$(".comment").empty();
				selectlist();
			}
		});
	}