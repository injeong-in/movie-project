<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
<style>
.progBarWrapper {
	width: 464px;
	height: 80px;
	background-color: #c7e3ed;
	position: relative;
}

#seek-bar {
	width: 250px;
	height: 5px;
	background-color:gray;
	display: flex;
	border-radius: 50px;
	margin-left: 25px;
	cursor: pointer;
}

#fill {
	height: 5px;
	background-color: purple;
	border-radius: 20px;
}

#handle {
	width: 8px;
	height: 8px;
	background-color: purple;
	border-radius: 50%;
	margin-left: -5px;
	transform: scale(2);
}

#currentTime {
	font-family: monospace;
	font-size: 14px;
	position: relative;
	transfrom: translate(-50%,-50%);
}
</style>
	

</head>
<body>
	<section>
		<img name="igg" onmouseover="chImg(this,'over')"
			onmouseout="chImg(this,'out')" src="on.png"
			onclick="playOrPouseSong()" style="width: 50px; height: 50px;">
		<audio id="audio" src="kiss.mp3"></audio>
		
		<div id="seek-bar" onclick="seekSong()">
			<div id="fill" ></div>
			<div id="handle"></div>
		</div>
		<div id="currentTime">00:00<%for(int i=0; i<32; i++){ %>&nbsp;<%}%>00:00</div>
		<input id="songSlider" type="range" min="0" step="1" />
	</section>
</body>

<script type="text/javascript">

var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
	
	/* window.onload = function() {
		
		function fnc1() {
			document.getElementyById("igg").src="on3.png";
			
			var audio = document.getElementById("audio");
		    
			if (audio.paused) { 
		        audio.play();
		    } else { 
		        audio.pause(); 
		        audio.currentTime = 0 
		    }
		}
		function fnc2() {
			document.getElementyById("on_img").src="on.png";
		}
		
		var myBtn = document.getElementById("on_image");
		var attr = myBtn.getAttribute('src');
		
		if(attr == 'on.png') {
			myBtn.addEventListener("click",fnc1,false);
		} else {
			myBtn.addEventListener("click",fnc2,false);
		}
		
		
	} */
	
	/*클릭 이벤트 이미지 변경*/
	var audio = document.getElementById("audio");
	
	var fillBar = document.getElementById("fill");
	var songSlider = document.getElementById("handle");
	var barSize = 250;
	var totalBar = document.getElementById("seek-bar");
	
	var currentSong = 0;
	var song = new Audio();
	var songs = ["kiss.mp3"];
	var currentTime = document.getElementById("currentTime");
	
	//재생시에 핸들 움직이기
	var updateSongSlider = function() {
		var c = Math.round(audio.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
		songSlider.value = c; //재생타임값을 핸들에 바인딩
		if(audio.ended){
			next();
		}
	}
	
	//음악 구간 바꾸기
	var clickedBar = function(e) {
		if(!audio.ended) {
			var mouseX = e.pageX - totalBar.offsetLeft;
			var newtime = mouseX*audio.duration/barSize;
			
			audio.currentTime = newtime;
			fillBar.style.width = mouseX + 'px';
		}
	};
	
	totalBar.addEventListener('click',clickedBar,false);
	
	
	
	setInterval(updateSongSlider, 1000); //1초마다 updateSongSlider 호출
	
	function seekSong() {
		audio.currentTime = songSlider.value;
		currentTime.textContent = convertTime(audio.currentTime);
		
		//var size = parseInt(audio.currentTime*barSize/audio.duration);
		
	}
	
	function playOrPouseSong() {
		var attr = document.getElementsByName("igg");
		
		if(attr[0].getAttribute('src') == "on2.png") {
		//재생버튼 첫클릭 이미지변경 + 음악재생
        document.igg.src = "on3.png";
		audio.play();
		}
		else {
		//재생버튼 첫클릭 이미지변경 + 일시정지
		document.igg.src = "on2.png";
		audio.pause(); 
        //audio.currentTime = 0
		}
	}
	
	
	function next() {
		currentSong++;
		if(currentSong >2) {
			currentSong = 0;
		}
		playSong();
	}
	
	//재생막대 진행
	 audio.addEventListener('timeupdate',function(){ 
         
         var position = audio.currentTime / audio.duration;
         
         fillBar.style.width = position * 100 +'%';
         
         convertTime(Math.round(audio.currentTime));
     });
	
	
	
	function chImg(obj, state) {
		var attr = document.getElementsByName("igg");
		audio.playbackRate = 1;
		if(state == "over") {
			if(attr[0].getAttribute('src') == "on.png")
			document.igg.src = "on2.png";
		} 
		
		if(state =="out" && attr[0].getAttribute('src') == "on2.png") {
			document.igg.src = "on.png";
		}
	}
	
	//시간표시
	function convertTime(seconds) {
		var min = Math.floor(seconds/60);
		var sec = seconds % 60;
		min = (min<10)? "0" + min : min;
		sec = (sec<10)? "0" + sec : sec;
		currentTime.textContent = min + ":" + sec;
		
		totalTime(Math.round(audio.duration));
	}
	
	
	
	function totalTime(seconds) {
		var min = Math.floor(seconds/60);
		var sec = seconds % 60;
		min = (min<10)? "0" + min : min;
		sec = (sec<10)? "0" + sec : sec;
		currentTime.textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
	}
	
	
	window.onload = function() {
		document.getElementById("seek-bar").onclick = function() {
			
		}
	}
</script>
</html>