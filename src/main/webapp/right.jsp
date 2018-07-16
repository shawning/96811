<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-xs-3 pull-right">
					<div class="page-news">
						<h5><i class="fa fa-bell-o"></i>新闻中心</h5>
						<ul id="news">
						</ul>
					</div>
					<div class="page-yy">
						<h5><i class="fa fa-comments-o"></i>在线预约</h5>
						<div class="dz-code">
							<span>
								<img src="${pageContext.request.contextPath}/img/wx-code.jpg" alt="">
								<p>扫一扫 关注微信</p>
							</span>
							<span>
								<img src="${pageContext.request.contextPath}/img/app-code.jpg" alt="">
								<p>扫码下载APP</p>
							</span>
						</div>
					</div>
				</div>
<script type="text/javascript">
	$(function(){
		getNews();
    });
	/**
		新闻中心
	**/
	function getNews(){
		$.ajax({
		    url:'${pageContext.request.contextPath}/news/search',
		    type:'get', //GET
		    async:true,    //或false,是否异步
		    data:{
		        page:1,rows:3
		    },
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data,textStatus,jqXHR){
		    	if(data!=null){
		    		var obj = data.rows;
		    		var html = '';
		    		for(var i=0;i<obj.length;i++){
		    			html+='<li>'
		    			+'<a href="${pageContext.request.contextPath}/news/newsDetail?id='+obj[i].id+'">' 
		    			+'<span>'+formattime(obj[i].createDate)+'</span>'
		    			+'<p style="width: 240px;">'+obj[i].title+'</p>'
		    			+'</a>'
		    			+'</li>';
		    		}
		    		$("#news").empty().append(html);
		    	}
		    },
		    error:function(xhr,textStatus){
		    },
		})
	}
	function formattime(date) {
		if (date != null) {
			if (date == null) {
				return "";
			}
			date = new Date(date);
			var y = date.getFullYear();
			var M = date.getMonth() + 1;
			var d = date.getDate();
			var h = date.getHours();
			var m = date.getMinutes();
			var s = date.getSeconds();
			var html = y + "/";
			if (M < 10) {
				html += "0";
			}
			html += M + "/";

			if (d < 10) {
				html += "0";
			}
			html += d + " ";
			return html;
		}else {
			return "";
		}
	}
</script>