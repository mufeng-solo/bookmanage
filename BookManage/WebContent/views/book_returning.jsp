<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书归还</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/favicon.png" type="image/x-icon" />
<style type="text/css">
	.login1{
		margin-top:13px;
		margin-left: 4px;
	}
	.breadcrumb{
		margin-left: 190px;
	}
	.btn1{
		position:relative;
		float:right;
	}
	.warning{
		width: 40px;
		height:40px;
	}
	.remind{
		width: 40px;
		height:40px;
	}
	.returnbtn{
		float: right;
	}
	.wrap-outer {  
	    margin-left: calc(100vw - 100%);  
	}
</style>
</head>
<body>
<div class="wrap-outer">
	<!-- 导航条 -->
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
	                    <li class="active"><a href="#">图书归还</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/book_download.jsp">电子书下载</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
					<%
						String info = (String)session.getAttribute("info");
						String name = (String)session.getAttribute("user");
						if(info!=null){
							if(info.equals("login")){
					%>			
								<li><span class="glyphicon glyphicon-user login1"></span></li>
								<li class="login1">欢迎您！</li>
								<li class="login1"><%=name%></li>
								<li class="login1"><form action="${pageContext.request.contextPath }/sign_out_contro/userSignOut4?uname=<%=name %>" method="post"><button type="submit" class="btn btn-danger btn-xs">退出</button></form></li>
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
	
	<!-- 归还书籍的BODY -->
	<%
		int fine = 0;
		if(request.getAttribute("fine")!=null){
			fine = (int)request.getAttribute("fine");
		}
		String username = (String)session.getAttribute("user"); 
	%>
	<div class="container">
		<%if(username!=null) {%>
			<div class="panel panel-danger">
	            <div class="panel-heading">
	                	已借书籍
	            </div>
	            <table class="table">
	                <tbody>
	                	<%
	                	if(request.getAttribute("books")!=null){
		                	String[] books = (String[])request.getAttribute("books");
		                	String[] returnDates = (String[])request.getAttribute("returnDates");
		                	int j = (int)request.getAttribute("count");
	                		int i=0;
	                		for(;i<j;i++){
	                			if(i<j){
	                	%>
	                    <tr>
	                        <td>
	                        	<%
		                        	out.print(books[i]+"------还书日期:"+returnDates[i]);
	                        		Date date = new Date();
	                        		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                        		Date date2 = sdf.parse(returnDates[i]);
	                        		long d1 = date.getTime();
	                        		long d2 = date2.getTime();
	                        	
	                        		if(d1>d2){
	                        			out.print("------过期了"+(d1-d2)/(24*3600*1000)+"天");
	                        			%>
                    						<img class="warning" alt="这是一张图片" src="${pageContext.request.contextPath }/static/warning.png">
                    					<%
	                        		}else{
	                        			if((d2-d1)/(24*3600*1000)<2){
	                        				%>
	                        					<h3>还有1天过期</h3><img class="remind" alt="这是一张图片" src="${pageContext.request.contextPath }/static/remind.png">
	                        				<%
	                        			}else{
	                        				out.print("------还差"+(d2-d1)/(24*3600*1000)+"天过期");
	                        			}
	                        		}
	                        		
		                        %>
		                        <input type="button" class="btn btn-info returnbtn" data-toggle="modal" data-target="#myModal<%=i %>" value="归还"/>        
	                        </td>
	                    </tr>
	                    <!-- Modal -->
						<div class="modal fade" id="myModal<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">归还信息</h4>
						      </div>
						      <div class="modal-body">
						        <p>书名：<%=books[i] %></p>
						        <%
						        	long day = (d1-d2)/(24*3600*1000);
						        	long money = fine*day;
						        	if(d1>d2&&money!=0){
						        %>
						        	过期了<%=day %>天，应缴纳罚金:<%=money %>元
						        <%
						        	}
						        %>
						      </div>
						      <div class="modal-footer">
						        
						        <form action="${pageContext.request.contextPath }/return/book2" method="post">
	                        		<input type="hidden" name="returnbookname" value="<%=books[i] %>">
	                        		<input type="hidden" name="username" value="<%=username %>">
	                        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                        		<input type="submit" class="btn btn-info btn-md btn1" value="确定归还">
	                        	</form>
						      </div>
						    </div>
						  </div>
						</div>
	                    <%}}} %>
	                </tbody>
	            </table>
	            <div class="panel-footer panel-danger">
	                	请按时归还图书
	            </div>
	        </div>
		<%}else{ %>
		<h1>登录后即可借阅书籍<span class="glyphicon glyphicon-tags"></span></h1>
		<%} %>
	</div>
	
	<!-- 底部导航条 -->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
	        <ol class="breadcrumb">
	            <li><a href="#">Home</a> </li>
	            <li><a href="#">Library</a> </li>
	            <li><a href="#">Data</a> </li>
	        </ol>
   		</nav>
	</div>
</div>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script>

</script>
</body>
</html>