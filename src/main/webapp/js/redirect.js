var url = window.location.href;
var host = window.location.host;
var path = "www.96811.com";
if(host.indexOf(path) == -1){//非path的url都转到96811.com
	var redirectUrl = url.replace(host,"www.96811.com");
	window.location = redirectUrl;
} 
	
