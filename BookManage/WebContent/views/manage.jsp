<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加图书</title>
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
	.navbar1{
		background-color: #9AD2FF;
	}
	.breadcrumb{
		margin-left: 190px;
	}
	.box{
		background-color:white;
		width:400px;
		height:450px;
		box-shadow: 1px 1px 5px #888888;
		position: relative;
		/*设置居中*/
        top:50%;
        left:50%;
        margin-left:-200px;
	}
	.btn1{
		width: 90%;
		margin-top: 10px;
		margin-left: 18px;
	}
	.part1{
		margin-top: 10px;
		margin-left: 5px;
	}
	.part2{
		margin-top: 10px;
		margin-left: 5px;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<div class="container header">
		<p class="admin">欢迎您 ！${sessionScope.admin}</p>
	</div>
	<!-- 导航条 -->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top:1 navbar1" role="navigation">
			<div class="container-fluid">
	            <div class="navbar-header">
	            </div>
	            <div class="collapse navbar-collapse">
	                <ul id="mytab" class="nav navbar-nav">
	                    <li class="active"><a href="#">首页</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/book/manage/0">图书管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/admin/manageUser">用户管理</a> </li>
	                    <li><a href="${pageContext.request.contextPath }/views/manage_system.jsp">系统管理</a></li>
	                    <li><a href="${pageContext.request.contextPath }/admin/return?ordermethod=bytime">借还书管理</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right ">
						<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
	                </ul>
	            </div>
	        </div>
		</nav>
	</div>
	
	<div class="container">
		<div class="box">
			<form action="${pageContext.request.contextPath }/admin/addbook" method="post">
				<div class="part2">
					<div class="part1"><div class="col-md-4 part1">图书名称:</div><input class="col-md-6 part1" type="text" name="bookname"></div>
					<div class="part1"><div class="col-md-4 part1">图书类型:</div><input class="col-md-6 part1" type="text" name="booktype"></div>
					<div class="part1"><div class="col-md-4 part1">出版社:</div><input class="col-md-6 part1" type="text" name="press"></div>
					<div class="part1"><div class="col-md-4 part1">作者:</div><input class="col-md-6 part1" type="text" name="author"></div>
					<div class="part1"><div class="col-md-4 part1">价格:</div><input class="col-md-6 part1" type="text" name="price"></div>
					<div class="part1"><div class="col-md-4 part1">数量:</div><input class="col-md-6 part1" type="text" name="number"></div>
					<div class="part1"><div class="col-md-4 part1">借出:</div><input class="col-md-6 part1" type="text" name="lend"></div>
					<div class="part1"><div class="col-md-4 part1">库存:</div><input class="col-md-6 part1" type="text" name="stock"></div>
					<div class="part1">
						<div class="col-md-4 part1">位置:</div>
						<select class="col-md-6 part1" name="location">
						<%for(int i=65;i<=68;i++){ %>
							<option><%=(char)i %>-1-1</option>
							<option><%=(char)i %>-1-2</option>
							<option><%=(char)i %>-1-3</option>
							<option><%=(char)i %>-2-1</option>
							<option><%=(char)i %>-2-2</option>
							<option><%=(char)i %>-2-3</option>
							<option><%=(char)i %>-3-1</option>
							<option><%=(char)i %>-3-2</option>
							<option><%=(char)i %>-3-3</option>
						<%} %>
						</select>
					</div>
				</div>
				<p><input class="btn btn-info btn1" type="submit" value="添加书籍"></p>
				<%
					String info = (String)request.getAttribute("addbook");
					if(info!=null){
						if(info.equals("success")){
							out.print("<div class='alert alert-success col-md-12' role='alert'>添加成功</div>");
						}else if(info.equals("error")){
							out.print("<div class='alert alert-warning col-md-12' role='alert'>请将图书信息填写完整</div>");
						}
					}
				%>
			</form>
		</div>
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