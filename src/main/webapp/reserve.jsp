<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>首页-上海大众运行物流股份有限公司</title>
<link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
<script type="text/javascript">
function addOrder(){
	 var param = new Object();
	 var bookDate = $("#bookDate").val();
	 var name = $("#name").val();
	 var addressFrom = $("#addressFrom").val();
	 var phone = $("#phone").val();
	 var addressTo = $("#addressTo").val();
	 var description = $("#description").val();
	 param.name =name;
	 param.bakstr1 = description;
	 if(bookDate!=null&&bookDate!=""){
		 var date = new Date();
		 var now = date.getFullYear() + "-";
		 now = now + (date.getMonth() + 1) + "-"; //取月的时候取的是当前月-1如果想取当前月+1就可以了
		 now = now + date.getDate() + " ";
		 now = now + date.getHours() + ":";
		 now = now + date.getMinutes() + ":";
		 now = now + date.getSeconds() + "";
		 var bb = daysBetween(bookDate,now);
		 if(72>=bb){
			 alert("只能预约3天后的时间");
			 return;
		 }
		 param.bookDate = bookDate;
	 }else{
		 alert("请输入预定时间");
		 return;
	 }
	 if(phone!=null&&phone!=""){
		 param.phone = phone;
	 }else{
		 alert("请输入联系电话");
		 return;
	 }
	 if(addressFrom!=null&&addressFrom!=""){
		 param.addressFrom = addressFrom;
	 }else{
		 alert("请输入起运地");
		 return;
	 }
	 if(addressTo!=null&&addressTo!=""){
		 param.addressTo = addressTo;
	 }else{
		 alert("请输入目的地");
		 return;
	 }
	 var params = JSON.stringify(param);
	$.ajax({
	    url:'${pageContext.request.contextPath}/order/add',
	    type:'post', //GET
	    data:params,
	    async:true,    //或false,是否异步
	    timeout:5000,    //超时时间
	    contentType : 'application/json',
	    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
	    success:function(data,textStatus,jqXHR){
	    	if(data!=null){
	    		alert(data.msg);
	    	}
	    },
	    error:function(xhr,textStatus){
	    },
	})
} 
function daysBetween(DateOne,DateTwo)  
{
var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));

//计算两个时间相差几天时用的语句
//var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);
var OneDay = DateOne.substring(DateOne.lastIndexOf('-') + 1, DateOne.indexOf(' '));
var OneYear = DateOne.substring(0, DateOne.indexOf('-'));
var OneHouse = DateOne.substring(DateOne.indexOf(' ') + 1, DateOne.indexOf(':'));  
  
var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));
var TwoDay = DateTwo.substring(DateTwo.lastIndexOf('-') + 1, DateTwo.indexOf(' '));
var TwoYear = DateTwo.substring(0, DateTwo.indexOf('-'));
var TwoHouse = DateTwo.substring(DateTwo.indexOf(' ') + 1, DateTwo.indexOf(':'));

//计算两个时间相差几个小时
var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000 * 24 + (OneHouse - TwoHouse));

//计算两个时间相差几天
//var cha = Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)/ 86400000;             
return cha;
}
</script>
</head>
<div class="top">
		<%@include file="header.html"%>
</div>
<div id="reserve" class="page">
	<section>
		<div class="container">
			<div class="banner">
				<img src="${pageContext.request.contextPath}/img/shineibanchang/1060x400/snbc-banner-3.jpg" alt="">
			</div>
			<ol class="breadcrumb">
			  <li><i class="fa fa-truck" aria-hidden="true"></i></li>
			  <li><a href="${pageContext.request.contextPath}">首页</a></li>
			  <li class="active"><a href="javascript:void(0)">在线预约</a></li>
			</ol>
			<div class="reserve middle-content">
				<h3 class="dz-title">在线预约<small>ONLINE RESERVATIONS</small></h3>
				<div class="reserve-content">
					<form role="form">
						<div class="row">
							<div class="col-xs-6">
							  	<div class="form-group">
								    <label><span style="color:red">* </span>预订时间</label>
								    <input type="text" value="" id="bookDate" class="form-control" id="datetimepicker">
							  	</div>
							</div>	
						</div>	
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
								    <label>姓名</label>
								    <input type="text" id="name" class="form-control" placeholder="请输入您的姓名">
							  	</div>
							  	<div class="form-group">
								    <label><span style="color:red">* </span>搬家地址(出发地)</label>
								    <input type="text" id="addressFrom" class="form-control" placeholder="请输入您的目的地">
							  	</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
								    <label><span style="color:red">* </span>联系电话</label>
								    <input type="tel" id="phone" class="form-control" placeholder="请输入您的联系电话">
							  	</div>
							  	<div class="form-group">
								    <label><span style="color:red">* </span>搬家地址(目的地)</label>
								    <input type="text" id="addressTo" class="form-control" placeholder="请输入您的目的地">
							  	</div>
							</div>
						</div>
						<div class="form-group">
						    <label>搬运物品</label>
						    <textarea class="form-control" id="description" rows="5"></textarea>
					  	</div>
					  	<button type="button" onclick="addOrder()" class="btn btn-warning">提交</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>
<%@include file="onfooter.jsp"%>
<script src="${pageContext.request.contextPath}/datetimepicker/build/jquery.datetimepicker.full.js"></script>
<script src="${pageContext.request.contextPath}/js/json.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
<script type="text/javascript">
 
$.datetimepicker.setLocale('ch');
$('#bookDate').datetimepicker({
	format:'Y-m-d H:i:s',
	dayOfWeekStart : 1,
	step : 30,
	todayButton:false 
});
</script>