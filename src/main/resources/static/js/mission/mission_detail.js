//단체 미션 참가 모달창
function groupdetail(code){
	$.ajax({
		url : "/groupdetail",
		type : "get",
		data : {"m_code" : code},
		success : function(group){
			document.getElementById("modal").style.display = "flex";
			$('html').scrollTop(0);
			$("#modalh2").text(group.m_name);
			$("#register_contents").html("날짜 : " + group.m_date + "<br>");
			$("#register_contents").append("모집중인 인원 : " + group.m_personnel + "명<br>");
		}
	});
}

//상시 미션 참가&인증 모달창
function solodetail(code){
	$.ajax({
		url : "/solodetail",
		type : "get",
		data : {"m_code" : code},
		success : function(solo){
			document.getElementById("modal2").style.display = "flex";
			$('html').scrollTop(0);
			$("#modalh22").text(solo.m_name);
			$("#register_contents2").html("사진을 찍고 미션을 완료해주세요.<br><br>");
			$("#register_contents2").append("포인트 획득: " + solo.m_point + "<br>");
			$("#register_contents2").append("탄소배출 감소량 : " + solo.m_carbon + "g<br>");
			$("#register_contents2").append("미션방법 : " + solo.m_inform + "<br>");
			$("#register_contents2").append("<span style='color:orange'>인증 사진을 올려주세요!</span><br>");
			$("#register_contents2").append("<img class=p_img id=previewimg><br>");
			$("#p_photo").val(solo.p_photo); 
		}
	});
}


//이미지 로드
function readImage(input){
	if(input.files && input.files[0]){
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		
		// 이미지가 로드된 경우
		reader.onload = e =>{
			const previewImage = document.getElementById("previewimg")
			previewImage.src = e.target.result
		}
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}


//모달창 닫기
$(document).ready(function(){
$("#modalclose").on("click",function(){
	document.getElementById("modal").style.display = "none";
});
$("#modalclose2").on("click",function(){
	document.getElementById("modal2").style.display = "none";
});
modal.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay")) {
    	modal.style.display = "none";
	}
});
modal2.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay2")) {
    	modal2.style.display = "none";
	}
});


//이미지 업로드
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})


//리뷰 신고하기	
	$(".redcard").on("click",function(){
		var result = confirm('이 인증사진을 신고하시겠습니까?'); 
			if(result) { 
				alert("신고되었습니다.");
			} else { 
			}
	});
}); //document ready end


