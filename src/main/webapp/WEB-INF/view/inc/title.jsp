<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
	
	
	/* SockJS */
	/* var socket = null;
	
	function connectSockJS(){
		var sock = new SockJS("ws://localhost:8083/websocket");
		
		sock.onopen = function(){
			console.log('Info : connection opened by SockJS.');
			sock.send("hi SockJS");
			
			sock.onmeesage = function(event){
				console.log(event.data+'\n');
			};
			
			sock.onclose = function(event){
				console.log('Info : connection closed by SockJS');
			};
		};
	} */
	
	
	
	/* 아래는 표준 webSocket */
	var socket = null;
	
	$(document).ready( function () {
		connectWS();
		/* connectSockJS(); */
	});
	
	function connectWS(){
		
		/* 로컬 경로( 자동으로 127.0.0.1 ) */
		var ws = new WebSocket("ws://localhost:8083/websocket");
		/* 웹 경로( 공인 ip ) */
		/* var ws = new WebSocket("ws://115.85.180.249:8080/websocket") */
		
		socket=ws;
		
		ws.onopen = function (){
			console.log('Info : connection opened.');
			
		};
		
		ws.onmessage = function(){
			console.log("ReceiveMessage : "+event.data+'\n');
			/* document.getElementById("socketAlert").style.display='block'; */
			var msg = event.data;
			
			if(msg.indexOf('1') == 0){
				
				let $socketAlert = $('div#socketAlert');
				/* $socketAlert.text(event.data); *//* 텍스트로감 */
				/* $socketAlert.html(event.data); */
				$socketAlert.html(event.data.substr(1,event.data.length));
				$socketAlert.css('display', 'block');
				
				setTimeout( function(){
					$socketAlert.css('display', 'none');	
				},6000);
				
			}else if(msg.indexOf('2') == 0){
				
				/* let $chatArea = $('textarea#chatArea'); */
				/* $chatArea.text(event.data.substr(1,event.data.length)); */
				let $chatArea = $('div#chatArea');
				var chatArea = document.getElementById("chatArea");
				chatArea.innerHTML = chatArea.innerHTML + "<br>" + event.data.substr(1,event.data.length);
				$chatArea.css('display', 'block');
				$chatArea.css('width', '80%');
				$chatArea.css('hight', '30%');
				
			}
			
			
		} 
		
		ws.onclose = function (event) { 
			console.log('Info : connection closed.');
			/* setTimeout( function(){ connect(); }, 1000); */
			};
			
		ws.onerror = function (err) { console.log('Error : ', err);};	
	}
	
</script>