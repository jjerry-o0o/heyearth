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
							"<div class='c_commentdiv' id='c_commentdiv"+i +"'>"+
								"<button class='button1' id='comment_btn"+i +"' onclick='comment("+i+")'>답글</button>"+
							"</div>"+
							"<div class='c_mod' id='c_mod"+i+"'></div>"+
							"<div class='c_recommentdiv' id='c_recommentdiv"+i+"'></div>"+
						"</div>");
							
						
						
						$("#c_mod"+i).append("<input type='hidden' id='c_index"+i+"' name='c_index' value='"+ data[i].c_index+"'><div class='alter_div' id='alter_div"+i+"'></div>");
						$("#alter_div"+i).hide();
						$("#c_mod"+i).hide();
						$("#c_recommentdiv"+i).hide();
					}
				};
			}
		});
	}
	
	function alter(i){
		$("#alter_div"+i).html("<form class='calter_div'>"
		+ "<div class='a_comment_title'>댓글 수정중..</div>"
		+ "<input class='a_comment' id='a_comment"+i+"' name='c_comment' placeholder='"+ $("#c_comment"+i).val()+"'>"
		+ "<input type='hidden' id='a_index"+i+"' name='c_index' value='"+ $("#c_index"+i).val() +"'>"
		+ "<input type='button' class='altbutton' id='alter"+i+"' value='수정등록' onclick='update("+i+")'>"
		+ "<input type='button' class='altbutton' id='back"+i+"' value='수정취소' onclick='updateback("+i+")'>"
		+ "</form>");
		$("#alter_div"+i).show();
		$("#c_mod"+i).show();
		$("#c_recommentdiv"+i).hide();
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
				selectlist();
			}
		});
	}
	
	function comment(i){
		if($("#c_recommentdiv"+i).css("display") == "none"){
			$("#c_recommentdiv"+i).show();
			$("#alter_div"+i).hide();
			$("#c_mod"+i).hide();
			$.ajax({
				type:"post",
				url:"/adminrecomment",
				data : {"c_index" : $("#c_index"+i).val()},
				success:function(data){
					$("#c_recommentdiv"+i).empty();
					$("#c_recommentdiv"+i).html("<div class='recommentlist'>");
					for(let k=0;k<data.length;k++){
						$("#c_recommentdiv"+i).append("<div class='c_img'><img src='/img/commentarrow.png'></div>"+
						"<div class='recomment' id='recomment"+k+"'>"+
							"<div id='rec_writer"+k+"' class='rec_writer'>"+data[k].id+"</div>&nbsp; | &nbsp;"+
							"<div id='rec_date+"+k+"' class='rec_date'>"+data[k].regdate + "</div>"+
							"<div id='rec_btn"+k+"' class='rec_btn'>"+
								"<button class='rebutton' id='realter_btn"+k+"' onclick='realter("+k+","+i+")'>수정</button>"+
								"<button class='rebutton' id='redelete_btn"+k+"' onclick='reremove("+k+","+i+")'>삭제</button>"+
							"</div>"+
							"<div class='rec_content' id='rec_content"+k+"'>"+
								"<input type='hidden' id='rec_comment"+k+"' value='"+data[k].c_comment+"'>"+ data[k].c_comment+
							"</div>"+
							"<div class='rec_mod' id='rec_mod"+k+"'></div>"+
						"</div>");
						
						$("#rec_mod"+k).append("<input type='hidden' id='rec_index"+k+"' name='c_index' value='"+ data[k].c_index+"'><div class='realter_div' id='realter_div"+k+"'></div>");
						$("#realter_div"+k).hide();
						$("#rec_mod"+k).hide();
					}
					$("#c_recommentdiv"+i).append("<hr id='recommenthr'>"+
						"<div class='re_comment_title'>대댓글 작성중..</div>" +
						"<div class='rec_insert'>"+
						"<input class='rec_newcomment' type='text' id='rec_newcomment"+i+"' placeholder='대댓글을 입력해주세요' required='required'>"+
						"<input class='reid type='id' type='hidden' id='reid"+i+"' value='"+$("#id").val()+"'>"+
						"<input class='reb_no' type='hidden' id='reb_no"+i+"' value='"+$("#b_no").val()+"'>"+
						"<input class='rec_order' type='hidden' id='rec_order"+i+"' value='" + $("#c_index"+i).val() +"'>"+
						"<input class='rec_insertbtn' type='button' id='recinput_btn' value='작성' onclick=recinput("+i+")>"+
					"</div>");			
					
					
				}
			});
		}else{
			$("#c_recommentdiv"+i).hide();
		}
	}
	
	function recinput(i){
		
		if($("#rec_newcomment"+i).val() != null){
			alert("대댓글이 작성되었습니다.");
			$.ajax({
				type:"post",
				url:"/adminrecommentinsert",
				data : {"c_comment" : $("#rec_newcomment"+i).val(),"id":$("#reid"+i).val(),"b_no" : $("#reb_no"+i).val(),"c_order":$("#rec_order"+i).val()},
				success : function(){
					$("#rec_newcomment"+i).empty();
					comment(i);
				}
			})
		}
	}
	
	function reremove(k,i){
		alert("대댓글이 삭제되었습니다.");
		
		$.ajax({
			type:"post",
			url:"admincommentdelete",
			data : {"c_index" : $("#rec_index"+k).val()},
			success:function(){
				comment(i);
			}
		});
	}
	
	function realter(k,i){  // 대댓글번호, 댓글번호
		$("#realter_div"+k).show();
		$("#rec_mod"+k).show();
		$("#realter_div"+k).html("<form class='recalter_div'>"
		+ "<div class='re_comment_title2'>대댓글 수정중..</div>"
		+ "<input class='rea_comment' id='rea_comment"+k+"' name='c_comment' placeholder='"+ $("#rec_comment"+k).val()+"'>"
		+ "<input type='hidden' id='rea_index"+k+"' name='c_index' value='"+ $("#rec_index"+k).val() +"'>"
		+ "<input type='button' class='realtbutton' id='realter"+k+"' value='수정등록' onclick='reupdate("+k+","+i+")'>"
		+ "<input type='button' class='realtbutton' id='reback"+k+"' value='수정취소' onclick='reupdateback("+k+")'>"
		+ "</form>");
		
	}
	
	function reupdate(k,i){
		alert("대댓글이 수정되었습니다.");
		$.ajax({
			type:"post",
			url:"/admincommentupdate",
			data : {"c_index" : $("#rea_index"+k).val(), "c_comment" : $("#rea_comment"+k).val()},
			success:function(){
				$("#rea_comment"+k).val("");
				$("#realter_div"+k).hide();
				comment(i);
			}
		});
	}
	
	function reupdateback(k){
		$("#realter_div"+k).hide();
		$("#rec_mod"+k).hide();
	}

