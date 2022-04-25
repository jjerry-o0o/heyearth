
//진행미션, 종료미션 버튼
function register(number){
	if(number =='1'){
		document.getElementById("ing_div").style.display = "";
		document.getElementById("end_div").style.display = "none";
		document.getElementById("ing").style.backgroundColor = "#1A271D";
		document.getElementById("end").style.backgroundColor = "#F6F5F0";
		document.getElementById("ing").style.fontWeight = "bold";
		document.getElementById("ing").style.color = "#F6F5F0";
		document.getElementById("end").style.color = "#1A271D";
		document.getElementById("end").style.fontWeight = "normal";
		document.getElementById("solo").style.display = "";
		document.getElementById("group").style.display = "";
	}else{
		document.getElementById("end_div").style.display = "";
		document.getElementById("ing_div").style.display = "none";
		document.getElementById("end").style.backgroundColor = "#1A271D";
		document.getElementById("ing").style.backgroundColor = "#F6F5F0";
		document.getElementById("end").style.fontWeight = "bold";
		document.getElementById("end").style.color = "#F6F5F0";
		document.getElementById("ing").style.color = "#1A271D";
		document.getElementById("ing").style.fontWeight = "normal";
		document.getElementById("solo").style.display = "none";
		document.getElementById("group").style.display = "none";
	}
}
//단체미션, 상시미션 버튼
function group(number){
	if(number =='1'){
		document.getElementById("group_div").style.display = "";
		document.getElementById("solo_div").style.display = "none";
		document.getElementById("e_group_div").style.display = "";
		document.getElementById("group").style.backgroundColor = "#1A271D";
		document.getElementById("solo").style.backgroundColor = "#F6F5F0";
		document.getElementById("group").style.fontWeight = "bold";
		document.getElementById("group").style.color = "#F6F5F0";
		document.getElementById("solo").style.color = "#1A271D";
		document.getElementById("solo").style.fontWeight = "normal";
	}else{
		document.getElementById("solo_div").style.display = "";
		document.getElementById("group_div").style.display = "none";
		document.getElementById("e_group_div").style.display = "";
		document.getElementById("solo").style.backgroundColor = "#1A271D";
		document.getElementById("group").style.backgroundColor = "#F6F5F0";
		document.getElementById("solo").style.fontWeight = "bold";
		document.getElementById("solo").style.color = "#F6F5F0";
		document.getElementById("group").style.color = "#1A271D";
		document.getElementById("group").style.fontWeight = "normal";
	}
}