<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%response.setStatus(HttpServletResponse.SC_OK); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/erroricon.png" type="image/x-icon" />
<style type="text/css">
	.btn{
		margin-left: 30px;
	}
	.errorimg{
		width: 30px;
		height: 30px;
	}
</style>
</head>
<body>
	<h1><img class="errorimg" src="${pageContext.request.contextPath }/static/error.png"/>Page Not Found!!</h1>
	<a href="${pageContext.request.contextPath }/views/result.jsp" class="btn btn-info">访问主页</a>
	<a href="${pageContext.request.contextPath }/admin_login.jsp" class="btn btn-info">后台管理</a>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</body>
</html>