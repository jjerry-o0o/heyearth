<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 수정 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/board/boardview.css" />

<script src="jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		selectlist();
		
		$("#comment_btn").on("click", function(){
			alert("댓글이 작성되었습니다.");
			
			insert();
		});
	});
		
	function selectlist(){
		$.ajax({
			type:"get",
			url:"/selectcomment",
			data : "b_no=" + $(".b_no").val(),
			dataType: "json",
			success:function(data){
				
				for(var i =0; i<data.length; i++){
					$("#list_div").append("<div id='comment'"+i+" class='comment_div'>");
					if(data[i].c_order ==0){
						$("#comment"+i).append("<textarea id='c_comment"+i+"' class='c_comment' name='c_comment' readonly='readonly' value='"+data[i].c_comment+"'>"+data[i].c_comment+"</textarea>");
						
						
					}
					$("#comment_tb").append("<tr class='tr2' id='tr2"+i+"'><td class='td2'><input type='hidden' id='c_comment"+i+"' value='"+data[i].c_comment+"'>"
							+ data[i].c_comment+"</td> <td class='td2'>"+ data[i].id+"</td><td class='td2'>"+data[i].regdate+"</td>"
							+ "<td class='td2'><button class='button' id='recomment_btn"+i+"' onclick='recomment("+i+")'>대댓글</button></td>");
					
					if($(".id").val() == data[i].id){
						$("#tr2"+i).append("<td class='td2'><button class='button' id='alter_btn"+i+"' onclick='alter("+i+")'>수정</button></td>"
						 + "<td class='td2'><button class='button' id='delete_btn"+i+"' onclick='remove("+i+")'>삭제</button></td></tr>");
					}
					else{
						$("#tr2"+i).append("</tr>");
					}
					
					$("#list_div").append("<input type='hidden' id='c_index"+i+"' name='c_index' value='"+ data[i].c_index+"'><div class='alter_div' id='alter_div"+i+"'></div>");
				};
			}
		});
	}
	
	function insert(){
		$.ajax({
			type:"post",
			url:"/insertcomment",
			data : {"id" : $(".id").val(), "c_comment" : $("#c_comment").val(), "b_no" : $(".b_no").val()},
			success:function(data){
				$("#comment_tb").empty();
				selectlist();
			}
		});
	}
	
	function recommentinsert(i){
		alert("대댓글이 작성되었습니다.");
		$.ajax({
			type:"post",
			url:"/insertcomment",
			data : {"id" : $(".id").val(), "c_comment" : $("#recomment_comment"+i).val(), "b_no" : $(".b_no").val(), "c_order" : $("#recomment_index"+i).val()},
			success:function(data){
				$("#comment_tb").empty();
				$("#alter_div"+i).empty();
				selectlist();
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
			success:function(){
				$(".comment").empty();
				$("#alter_div"+i).empty();
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
				$("#alter_div"+i).empty();
				selectlist();
			}
		});
	}
	
	function recomment(i){
		$("#alter_div"+i).append("<h2>'"+ $("#c_comment" + i).val() +"' 댓글에 대댓글을 달고 있습니다.</h2><form class='recomment_div'>"
			+ "<textarea class='recomment' id='recomment_comment"+i+"' name='c_comment' placeholder='댓글을 입력해주세요.' rows='3' cols='50'></textarea>"
			+ "<input type='hidden' id='recomment_index"+i+"' name='c_order' value='"+ $("#c_index"+i).val() +"'>"
			+ "<input type='button' class='button' id='recomment"+i+"' value='등록' onclick='recommentinsert("+i+")'>"
			+ "</form>");
	}
</script>

</head>

<body>

	<div class="cinput_div">
		<textarea id="c_comment" name="c_comment" placeholder="댓글을 입력해주세요"></textarea>
		<button id ="comment_btn" class="button">작성</button>
		<input type="hidden" class="id" name="id" value="yina">
		<input type="hidden" class="b_no" name="b_no" value="1">
	</div>
	
	<div id="list_div">
		<input type="hidden" class="id" name="id" value="yina">
		<input type="hidden" class="b_no" name="b_no" value="1">
		
	</div>

</body>

</html>