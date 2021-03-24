<%@page import="com.java.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
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
	.page1{
		margin-left:390px;
	}
	th{
		text-align: center;
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
	
	<!-- 书籍 -->
	<div class="container">
		<h3>图书列表</h3>
		<table class="table table-hover table-bordered" style="width: 1200px">
			<tr class="active" style="text-align: center;">
				<th>图书序号</th>
				<th>图书名称</th>
				<th>图书类型</th>
				<th>出版社</th>
				<th>作者</th>
				<th>价格</th>
				<th>数量</th>
				<th>借出</th>
				<th>库存</th>
				<th>位置</th>
				<th>操作</th>
			</tr>
		<%
		//获取request域中的数据
		Page p = (Page)request.getAttribute("page");
		if(p!=null){
			for(Book book:p.getBooks()){
		%>	
			<tr style="text-align: center">
				<td><%=book.getBookId() %></td>
				<td><a href="${pageContext.request.contextPath }/admin/getBookInfo/<%=book.getBookId() %>"><%=book.getBookName() %></a></td>
				<td><%=book.getBookType() %></td>
				<td><%=book.getPress() %></td>
				<td><%=book.getAuthor() %></td>
				<td><%=book.getPrice() %></td>
				<td><%=book.getNumber()%></td>
				<td><%=book.getLend() %></td>
				<td><%=book.getStock() %></td>
				<td><%=book.getLocation() %></td>
				<td><a href="${pageContext.request.contextPath }/admin/addbooknum/<%=book.getBookId() %>" class="btn btn-success btn-xs">增加</a><a href="${pageContext.request.contextPath }/admin/deletebooknum/<%=book.getBookId() %>" class="btn btn-danger btn-xs">删除</a></td>
			</tr>
		<%
			}
		}
		%>
		</table>
	</div>
	<div class="container">
       <nav class="page1">
            <ul class="pagination pagination-lg">
            	<%
            	Integer currentPage =  (Integer)p.getCurrentPage();
            	Integer totalPage = (Integer)p.getTotalPage();
            	%>
                <li <% if(currentPage==0){%> class="disabled" <%} %> > <a class="disabled" href="<%if(currentPage!=0){ %> <%= currentPage-1%><%} %> ">&laquo;</a> </li>
                <li <% if(currentPage==0){%> class="active"<%} %>><a href="<% if(0<totalPage){%>${pageContext.request.contextPath }/book/manage/0<%}%>">1</a></li>
                <li <% if(currentPage==1){%> class="active"<%} %>><a href="<% if(1<totalPage){%>${pageContext.request.contextPath }/book/manage/1<%}%>">2</a></li>
                <li <% if(currentPage==2){%> class="active"<%} %>><a href="<% if(2<totalPage){%>${pageContext.request.contextPath }/book/manage/2<%}%>">3</a></li>
                <li <% if(currentPage==3){%> class="active"<%} %>><a href="<% if(3<totalPage){%>${pageContext.request.contextPath }/book/manage/3<%}%>">4</a></li>
                <li <% if(currentPage==4){%> class="active"<%} %>><a href="<% if(4<totalPage){%>${pageContext.request.contextPath }/book/manage/4<%}%>">5</a></li>
                <li <% if(currentPage>=totalPage-1){%> class="disabled"<%} %>><a href="<% if(currentPage<totalPage-1){%>${pageContext.request.contextPath }/book/manage/<%= p.getCurrentPage()+1%><%}%>">&raquo;</a></li>

            </ul>
        </nav>
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