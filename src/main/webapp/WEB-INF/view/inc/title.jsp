<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	/* 로컬 경로( 자동으로 127.0.0.1 ) */
	var ws = new WebSocket("ws://localhost:8083/replyEcho");
	/* 웹 경로( 공인 ip ) */
	
	
	ws.onopen = function (){
		console.log('Info : connection opened.');
		
	};
	
	ws.onmessage = function(){
		console.log("ReceiveMessage : "+event.data+'\n');
	}
	
	ws.onclose = function (event) { 
		console.log('Info : connection closed.');
		/* setTimeout( function(){ connect(); }, 1000); */
		};
	ws.onerror = function (err) { console.log('Error : ', err);};
		
	
	$('#sendBtn').on('click', function(evt){
		evt.preventDefault();
		if(socket.readyState !== 1) return;
		let msg = $('input#message').val();
		ws.send(msg);
	})
	
	function sendMessage(){
		var msg = document.getElementById("message").value;
		ws.send(msg);
	}
	
</script>