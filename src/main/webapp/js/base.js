var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath+"/";
var baseVesion = "v1.0.0.1";

$.ajaxSetup({
	type : 'post',
	cache : false,
	contentType : 'application/json',
	statusCode : {
		200 : function() {
			// alert("操作成功");
		},
		550 : function() {
			//alert("系统内部错误...");
		},
		400 : function() {
			// alert("请检查你的输入...");
		},
		403 : function() {
			//alert("没有该资源的权限...");
		},
		404 : function() {
			//alert("没有找到资源...");
		},
		500 : function() {
			//alert("系统内部错误...");
		}
	}
});
jQuery.axs=function(path,params, successfn,errorfn) {	
	
    $.ajax({
        data: params,
        contentType : 'application/json',
        dataType:"json",
        url : basePath+path,
        success: function(d){
        	
        	switch(d.code){
        	case 404:
        		successfn(d);
        		break;
        	case 400:
        		successfn(d);
        		break;
    		case 200:
        		successfn(d);
        		break;
    		case 100:
    			successfn(d);
    			//jAlert("请登录！","警告");
//    			window.location.href="login.html?backurl="+window.location.href;
    			break;
    		case 101:
//    			window.location.href=PortalLoginPath+"/login.html";
    			break;
    		case 102:
//    			window.location.href=PortalLoginPath+"/login.html";
    			break;
    		case 103:
//    			jAlert("请求无效","警告");
    			break;	
    		case 104:
//    			jAlert("系统异常","警告");
    			break;	
    		case 105:
//    			jAlert("请求不合法","警告");
    			break;		
    		case 605://email已存在register_usermax
//    			jAlert("email已被占用，请更换其他邮箱","警告");
    			break;	
    		case 606://机构成员
//    			jAlert(writelanguageinfotitle("register_usermax"),writelanguageinfotitle("basic_dictionary_warn_title"));
    			break;		
    		default:
    			successfn(d);
//    			jAlert("请求失败","警告");
    	}
        },
    	error:function(e){
    		
    		try{
    			if(e!=null && e!=undefined){
	    			var msg = stringToJson(e.responseText);
	    			var data = msg.data[0].constraint;
    			}else{
    			}
	        }catch(e){
	        }
    	}
    });
};


/**
 * 封装弹出框 info
 * @param msg
 */
function eAlertInfo(msg){
	var msgbox="<div style='text-align:center;font-weight:bold;z-index:99999999'>"+msg+"</div>";
	$.messager.alert('提示', msgbox);
}
/**
 * 时间毫秒 格式化时间yyyy-MM-dd HH:mi:ss
 * @param date
 * @param row
 * @param index
 * @returns {String}
 */
function formattimess(date, row, index) {
	if (date != null) {
		if (date == null) {
			return "";
		}
		date = new Date(date);
//		date = new Date(date.time);
		var y = date.getFullYear();
		var M = date.getMonth() + 1;
		var d = date.getDate();
		var h = date.getHours();
		var m = date.getMinutes();
		var s = date.getSeconds();
		var html = y + "-";
		if (M < 10) {
			html += "0";
		}
		html += M + "-";

		if (d < 10) {
			html += "0";
		}
		html += d + " ";
		if (h < 10) {
			html += "0";
		}
		html += h + ":";
		if (m < 10) {
			html += "0";
		}
		html += m + ":";
		if (s < 10) {
			html += "0";
		}
		html += s;
		return html;
	}else {
		return "";
	}
}

function formatStatus(data,row,index){
	if(data==0||data=="0"){
		return "无效";
	}else if(data==1||data=="1"){
		return "有效";
	}
}
