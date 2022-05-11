window.onload = function() {
	
	const joinbtn = document.getElementById('joinbtn');
	const loginbtn = document.getElementById('loginbtn');
	

	joinbtn.onclick = join;
	loginbtn.onclick = login;
	
	function join() {
		location.href = '/join';
	}

	function login(){
		location.href = '/login';
	}
	
	
}