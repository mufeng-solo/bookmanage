<%@page import="com.java.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书简介</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/admin.png" type="image/x-icon" />
<style type="text/css">
	.header{
		background-image: url("${pageContext.request.contextPath }/images/head.png");
		width:1138px;
		height:90px;
	}
	.admin{
		float:right;
		margin-top: 35px;
		font-size: 18px;
	}
	.navbar{
		background-color: #9AD2FF;
	}
	.form1{
		float:left;
	}
	.box1{
		position:relative;
		float:right;
		width: 600px;
	}
	.p1{
		margin-left: 8px;
	}
	.wrap-outer {  
	    margin-left: calc(100vw - 100%);  
	}
</style>
</head>
<body>
<div class="wrap-outer">
	<div class="container header">
		<p class="admin">欢迎您 ！${sessionScope.admin}</p>
	</div>
	<!-- 导航条 -->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top:1 " role="navigation">
			<div class="container-fluid">
	            <div class="navbar-header">
	            </div>
	            <div class="collapse navbar-collapse">
	                <ul id="mytab" class="nav navbar-nav">
	                    <li><a href="${pageContext.request.contextPath }/views/manage.jsp">首页</a> </li>
	                    <li class="active"><a href="#">图书管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/admin/manageUser">用户管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/manage_system.jsp">系统管理</a></li>
	                    <li><a href="${pageContext.request.contextPath }/admin/return?ordermethod=bytime">借还书管理</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
						<li><a href="${pageContext.request.contextPath }/views/manage.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>

	<!-- 添加bookinfo -->
	
	<div class="container">
		<form class="form1" action="${pageContext.request.contextPath }/admin/updateBookInfo" method="post">
			<%if(request.getAttribute("bookid")!=null){ 
				int bookid = (int)request.getAttribute("bookid");
			%>
			<input type="hidden" name="bookid" value="<%=bookid %>">
			<%} %>
			<textarea name="bookinfo" rows="15" cols="60" style="resize: none;"><%
				if(request.getAttribute("bookinfo")!=null){
				BookInfo bookinfo = (BookInfo)request.getAttribute("bookinfo");
				out.print(bookinfo.getInfo() );
			}
	%></textarea><br>
			<input class="btn btn-success" type="submit" value="更改图书简介">
		</form>
		<!-- 展示读者评论 -->
		<div class="box1">
			<%String bookname = (String)request.getAttribute("bookname"); %>
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
		
		
		</div>
	</div>
</div>	

<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
    var style = '<%= session.getAttribute("style")%>';
    if(style == "white"){
    	$("body").css("background-color","#FFFFFF");
    }
    if(style == "gray"){
    	$("body").css("background-color","#D1D1D1");
    }if(style == "cyan"){
    	$("body").css("background-color","#AEEEEE");
    }
    if(style == "skyblue"){
    	$("body").css("background-color","#C6E2FF");
    }
    if(style == "yellow"){
    	$("body").css("background-color","#FFFFF0");
    }
    if(style == "bc1"){
    	$("body").css("background-image","url('${pageContext.request.contextPath }/images/bc1.jpg')");
    }
    if(style == "bc2"){
    	$("body").css("background-image","url('${pageContext.request.contextPath }/images/bc2.jpg')");
    }
    if(style == "bc3"){
    	$("body").css("background-image","url('${pageContext.request.contextPath }/images/bc3.jpg')");
    }
})
</script>
</body>
</html>