<%@page import="com.java.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/favicon.png" type="image/x-icon" />
<style type="text/css">
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
	.box{
		width: 700px;
	}
	.p1{
		margin-left: 8px;
	}
	.container1{
		width:700px;
		margin: 30px auto;
	}
	.wrap-outer {  
	    margin-left: calc(100vw - 100%);  
	}
	.back{
		width: 60px;
		height: 50px;
	}
	.backlink{
		position: absolute;
		margin-left: 40px;
	}
</style>
</head>
<body>
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
	                    <li  class="active"><a href="${pageContext.request.contextPath }/query/book/0">图书借阅</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/<%if(name!=null){ %>return/book?username=<%=name %><%}else{%>views/book_returning.jsp<%}%>">图书归还</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/book_download.jsp">电子书下载</a></li>
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
								<li class="login1"><form action="${pageContext.request.contextPath }/sign_out_contro/userSignOut2?uname=<%=name %>" method="post"><button type="submit" class="btn btn-danger btn-xs">退出</button></form></li>
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
						<li><a href="../../user_login.jsp">登录</a></li>
			            <li><a href="../../user_register.jsp">注册</a></li>
					<%		
						}
					%>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	
	<div class="container">
		<a class="backlink" href="${pageContext.request.contextPath }/query/book/0">
			<img class="back" alt="" src="${pageContext.request.contextPath }/static/back.png">
		</a>
	</div>
	<!-- 图书信息 -->
	<%
		if(request.getAttribute("bookid")!=null){
			String bookname = (String)request.getAttribute("bookname");
			BookInfo bookinfo = (BookInfo)request.getAttribute("bookinfo");
	%>
	
	<div class="container1">
		<div class="box">
			<div class="panel panel-info">
            <div class="panel-heading">
                	<%=bookname%>
            </div>
	            <table class="table">
	                <tbody>
	                    <tr>
	                        <td>
	                        	<h4><span class="glyphicon glyphicon-bookmark"></span>书籍简介:</h4><br>
	                        	<%out.print(bookinfo.getInfo()); %>
	                        </td>
	                    </tr>  
	                </tbody>
	            </table>
        	</div>
        	<!-- 读者评论 -->
        	<div class="panel panel-info">
            <div class="panel-heading">
                	<%=bookname%>
            </div>
	            <table class="table">
	                <tbody>
	                    <h4 class="p1"><span class="glyphicon glyphicon-comment"></span>读者评论:</h4><br>
	                    <%
	                       if(request.getAttribute("bookcomment")!=null){
	                       List<BookComment> bookComments = (List<BookComment>)request.getAttribute("bookcomment");
	                       for(BookComment bookComment:bookComments){
	                    %>	
	                    <tr>
	                        <td>
	                        		<span class="glyphicon glyphicon-user"></span><%=bookComment.getUserName() %>:<br>
	                        		<%=bookComment.getComment() %>
	                        	<%}}%>
	                        </td>
	                    </tr> 
                    </tbody>
	            </table>
        	</div>
        	
        	<!-- 用户做出评论 -->
        	<%
        	if(info!=null){
        		if(info.equals("login")){ 
        	%>
	        	<form action="${pageContext.request.contextPath }/user/makeComment" method="post">
	        		<input type="hidden" name="username" value="<%=name %>">
	        		<input type="hidden" name="bookid" value="<%=(int)request.getAttribute("bookid") %>">
	        		<textarea class="comment" name="comment" rows="6" cols="95" style="resize: none;"></textarea><br>
	        		<input class="btn btn-success btn-lg send" type="submit" value="发表评论" disabled>
	        	</form>
        	<%}} %>
		</div>
	</div>
	<%}else{ %>
	<div class="container"><h1><a href="${pageContext.request.contextPath }/query/book/0"><span class="glyphicon glyphicon-arrow-left"></span></a>该书籍还没有信息哦</h1></div>
	<%} %>
</div>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script>
	$(function(){
		$("body").delegate(".comment","propertychange input",function(){
			//判断是否输入了内容
			if($(this).val().length > 0){
				//让发表评论按钮可用
				$(".send").prop("disabled", false);
			}else{
				//让发表评论按钮不可用
				$(".send").prop("disabled", true);
			}
			
		});

	});
</script>
</body>
</html>