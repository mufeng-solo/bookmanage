<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>电子书下载</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/favicon.png" type="image/x-icon" />
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	.login1{
		margin-top:13px;
		margin-left: 4px;
	}
	.part1{
		float:right;
	}
	.breadcrumb{
		margin-left: 190px;
	}
	body {
	 	height: 1500px;
	}
	.wrap-outer {  
	    margin-left: calc(100vw - 100%);  
	} 
    .ad{
        position: fixed;
        right: 0;
        bottom: 0;
        display: none;
    }
    .ad>span{
        display: inline-block;
        width: 30px;
        height: 20px;
        background: #b8daff;
        position: absolute;
        top: 0;
        right: 0;
        font-size: 14px;
        text-align: center;
    }
    .container{
    	position:relative;
    }
    .warning{
    	width:600px;
    	margin:auto;
    	position:absolute;
		display: none;
		float: right;
    }
    
</style>
</head>
<body>
<!-- wrap-outer指的是居中定宽主体的父级解决滚动条出现后的内容跳动问题 -->
<div class="wrap-outer">
	<!-- 导航条 -->
	<%String name = (String)session.getAttribute("user"); %>
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top:1" role="navigation">
			<div class="container-fluid">
	            <div class="navbar-header">
	                <img src="${pageContext.request.contextPath }/images/header.png"/>
	            </div>
	            <div class="collapse navbar-collapse">
	                <ul id="mytab" class="nav navbar-nav">
	                    <li	><a href="${pageContext.request.contextPath }/views/result.jsp">首页</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/query/book/0">图书借阅</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/<%if(name!=null){ %>return/book?username=<%=name %><%}else{%>views/book_returning.jsp<%}%>">图书归还</a> </li>
	                    <li class="active"><a href="#">电子书下载</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
					<%
						String info = (String)session.getAttribute("info");
						if(info!=null){
							if(info.equals("login")){
					%>			
								<li><span class="glyphicon glyphicon-user login1"></span></li>
								<li class="login1">欢迎您！</li>
								<li class="login1"><%=name%></li>
								<li class="login1"><form action="${pageContext.request.contextPath }/sign_out_contro/userSignOut3?uname=<%=name %>" method="post"><button type="submit" class="btn btn-danger btn-xs">退出</button></form></li>
					<%
							}else if(info.equals("null")){ 
								session.removeAttribute("info");
								session.removeAttribute("user");
								%>
									<li><a href="${pageContext.request.contextPath }/user_login.jsp">登录</a></li>
						            <li><a href="${pageContext.request.contextPath }/user_register.jsp">注册</a></li>
								<%	
							}
						}else{		
					%>
						<li><a href="../user_login.jsp">登录</a></li>
			            <li><a href="../user_register.jsp">注册</a></li>
					<%		
						}
					%>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	
	<!-- 下载 -->
    <div class="container">
    	<!-- 提示 -->
  		<div class="alert alert-danger col-md-6 warning" role="alert">
			请先登录!
			<button type="button" class="close" data-dismiss="alert">
				<span>&times;</span>
			</button>
		</div>
    	<div class="panel panel-info">
            <div class="panel-heading">
                	电子书下载
            </div>
            
            <table class="table">
                <tbody>
                	<%String username = (String)session.getAttribute("user"); %>
                    <tr>
                        <td>
                        	<img src="${pageContext.request.contextPath }/images/book1.png"/>
                        	完美世界
				            <form class="part1" <%if(username!=null) {%>action="${pageContext.request.contextPath }/download/book"<%}else{ %>action="javascript:;"<%} %>>
								<input type="hidden" name="filename" value="book.txt">
								<span class="glyphicon glyphicon-download-alt"></span>
								<input class="btn btn-info download" type="submit" <%if(username==null){%>onclick="clickEvent()"<%} %> value="下载">	
							</form>
                        </td>
                    </tr>
                    <tr class="success">
                        <td>
                        	<img src="${pageContext.request.contextPath }/images/book2.jpg"/>
                        	永生
				            <form class="part1" <%if(username!=null) {%>action="${pageContext.request.contextPath }/download/book"<%}else{ %>action="javascript:;"<%} %>>
								<input type="hidden" name="filename" value="book2.txt">
								<span class="glyphicon glyphicon-download-alt"></span>
								<input class="btn btn-info download" type="submit" <%if(username==null){%>onclick="clickEvent()"<%} %> value="下载">
							</form>
						</td>
                    </tr>
                    <tr>
                        <td>
							<img src="${pageContext.request.contextPath }/images/book3.jpg"/>
                        	C语言从入门到精通
				            <form class="part1" <%if(username!=null) {%>action="${pageContext.request.contextPath }/download/book"<%}else{ %>action="javascript:;"<%} %>>
								<input type="hidden" name="filename" value="book3.txt">
								<span class="glyphicon glyphicon-download-alt"></span>
								<input class="btn btn-info download" type="submit" <%if(username==null){%>onclick="clickEvent()"<%} %> value="下载">
							</form>
						</td>
                    </tr>
                    <tr class="success">
                        <td>
                        	<img src="${pageContext.request.contextPath }/images/book4.png"/>
                        	斗罗大陆
				            <form class="part1" <%if(username!=null) {%>action="${pageContext.request.contextPath }/download/book"<%}else{ %>action="javascript:;"<%} %>>
								<input type="hidden" name="filename" value="book4.txt">
								<span class="glyphicon glyphicon-download-alt"></span>
								<input class="btn btn-info download" type="submit" <%if(username==null){%>onclick="clickEvent()"<%} %> value="下载">
							</form>
						</td>
                    </tr>
                    <tr>
                        <td>
							<img src="${pageContext.request.contextPath }/images/book5.png"/>
                        	基础心理学
				            <form class="part1" <%if(username!=null) {%>action="${pageContext.request.contextPath }/download/book"<%}else{ %>action="javascript:;"<%} %>>
								<input type="hidden" name="filename" value="book5.txt">
								<span class="glyphicon glyphicon-download-alt"></span>
								<input class="btn btn-info download" type="submit" <%if(username==null){%>onclick="clickEvent()"<%} %> value="下载">
							</form>
						</td>
                    </tr>
                </tbody>
            </table>
            
        </div>
    </div>

	<!-- 弹窗广告 -->
	<a href="http://www.baidu.com" class="ad">
        <img src="${pageContext.request.contextPath }/images/弹窗广告.png">
        <span>关闭</span>
    </a>
</div>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script>
	$(function () {
	    //jQuery相关代码
	    $(".ad>span").click(function () {
	       $(".ad").remove();
	       return false;
	    });
	    //动画队列
	    $(".ad").stop().slideDown(1000).fadeOut(1000).fadeIn(1000);
	    
	    
	    
	 });
	function clickEvent(){
		$(".warning").fadeIn();
    	/* $(".warning").css({
            "display": "block",
        }); */
    	return false;
	}
	
	
</script>
</body>
</html>