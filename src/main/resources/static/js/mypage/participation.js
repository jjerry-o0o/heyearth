//캔버스 이미지 위에 complete 문구 띄우기
window.onload = function(){
    var imageArr = []; 
    var contextArr = []; 
	
    for(let i=0; i<100; i++){
    var canvas = document.getElementById("myCanvas"+i);
    if(canvas != null){
    var context = canvas.getContext("2d");
    contextArr.push(context);
    
    var imageObj = new Image();
   
    imageObj.src = document.getElementById("hiddenphoto"+i).value;
    imageArr.push(imageObj);
	}
	}
    for(let i=0; i<100; i++){
    		 let contexts = contextArr[i];
    	 imageArr[i].onload = function(){
				console.dir(contexts);
    	        contexts.drawImage(imageArr[i], 0, 0, 250, 250);
    	        contexts.font = "bold 45px 'IBM Plex Sans KR'";
    	        contexts.fillStyle="#F6F5F0";
    	        contexts.fillText("COMPLETE", 10, 130);
    	        
    	        contexts.strokeStyle = '#1A271D';
    	        contexts.lineWidth = 3;
    	        contexts.strokeText("COMPLETE", 10, 130);
    	    }
	}
};


//이미지 업로드
$(document).ready(function(){
	$(".back").one('click',function(){
		location.href = "participation";
	});
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})

	
});

//이미지 프리뷰 로드
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


//미션 인증 모달창
function mymissiondetail(code){
	$.ajax({
		url : "/mymissiondetail",
		type : "get",
		data : {"p_code" : code},
		success : function(mymission){
			document.getElementById("modal").style.display = "flex";
			$("#modalh2").text("미션인증하기");
			$('html').scrollTop(0);
			$("#register_contents").html("<span style='font-weight:700;font-size:18px;'>" + mymission.m_name + "</span><br>");
			$("#register_contents").append("미션방법 : " + mymission.m_inform + "<br>");
			$("#register_contents").append("탄소배출감소량 : <span style='font-weight:700;font-size:18px;'>" + mymission.m_carbon + "g</span><br>");
			$("#register_contents").append("획득 포인트 : <span style='font-weight:700;font-size:18px;'>" + mymission.m_point + "p</span><br>");
			$("#register_contents").append("<br><span style='color:olive;font-weight:700;font-size:18px;'>인증 사진을 올려주세요!</span><br>");
			$("#register_contents").append("<img class=p_img id=previewimg><br>");
			$("#p_code").val(mymission.p_code);
			$("#id").val(mymission.id);
			$("#point").val(mymission.point);
			$("#m_code").val(mymission.m_code);
		 	$("#m_point").val(mymission.m_point);
			$("#carbon").val(mymission.carbon);
			$("#m_carbon").val(mymission.m_carbon);
			$("#m_personnel").val(mymission.m_personnel);
			$("#p_friends").val(mymission.p_friends); 
			$("#p_complete").val(mymission.p_complete); 
			$("#p_photo").val(mymission.p_photo); 
		}
	});
}

//미션 리뷰 모달창
function mymissiondetail2(code){
	$.ajax({
		url : "/mymissiondetail",
		type : "get",
		data : {"p_code" : code},
		success : function(myreview){
			document.getElementById("modal3").style.display = "flex";
			$("#modalh4").text("리뷰작성하기");
			$('html').scrollTop(0);
			$("#register_contents2").html("<span style='font-weight:700;font-size:18px;'>" +myreview.m_name+"</span> 미션은 어떠셨나요?<br>");
			$("#register_contents2").append("<span style='font-weight:700;font-size:18px;'>"+myreview.id+"</span>님의 후기가 궁금해요!<br>");
			$("#p_code2").val(myreview.p_code); 
			$("#p_star").val(myreview.p_star); 
			$("#p_review").val(myreview.p_review);
			
		}
	});
}

//모달창 닫기
$(document).ready(function(){
$("#modalclose").on("click",function(){
	document.getElementById("modal").style.display = "none";
});
modal.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay")) {
    	modal.style.display = "none";
	}
});
$("#modalclose2").on("click",function(){
	document.getElementById("modal3").style.display = "none";
});
modal3.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay2")) {
    	modal3.style.display = "none";
	}
});

//리뷰쓰기 최대 test 조정
$('#p_review').on('keyup', function() {
        if($(this).val().length > 200) {
	 alert("글자수는 200자로 제한됩니다!");  
            $(this).val($(this).val().substring(0, 200));
        }
    });
    
}); // document ready end

