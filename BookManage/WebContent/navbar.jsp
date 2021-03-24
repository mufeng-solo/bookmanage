<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		                    <li class="active"><a href="#">图书借阅</a> </li>
		                    <li><a href="${pageContext.request.contextPath }/<%if(name!=null){ %>return/book?username=<%=name %><%}else{%>views/book_returning.jsp<%}%>">图书归还</a> </li>
		                    <li><a href="${pageContext.request.contextPath }/views/book_download.jsp">电子书下载</a></li>
		                </ul>
		                
		                <!-- 搜索框 -->
		                <form action="${pageContext.request.contextPath }/search/book" class="navbar-form navbar-left" role="search" method="post">
		                    <div class="form-group">
		                        <input type="text" name="searchname" class="form-control" placeholder="搜索图书">
		                        <button type="submit" class="btn btn-default">搜索</button>
		                    </div>
	                	</form>
	
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
							<li><a href="${pageContext.request.contextPath }/user_login.jsp">登录</a></li>
				            <li><a href="${pageContext.request.contextPath }/user_register.jsp">注册</a></li>
						<%		
							}
						%>
		                </ul>
		            </div>
		        </div>
			</nav>
		</div>
</body>
</html>