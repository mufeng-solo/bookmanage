<%@page import="com.java.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书借阅</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath }/static/favicon.png" type="image/x-icon" />
<style type="text/css">
	.login1{
		margin-top:13px;
		margin-left: 4px;
	}
	th{
		text-align: center;
	}
	.page1{
		margin-left:390px;
	}
	.breadcrumb{
		margin-left: 190px;
	}
	h3{
		float:left;
		margin-bottom: 30px;
	}
	.alert1{
		float: right;
	}
	.alert2{
		position: absolute;
		margin-left: 220px;
	}
	.list{
		width: 30px;
		height: 30px;
	}
	.warning{
    	width:600px;
    	margin:10px auto;
		float:right;
		display: none;
    }
</style>
</head>
<body>
	
	<%@ include file="../navbar.jsp" %>

	<!-- 书籍 -->
	<div class="container">
		<!-- 提示 -->
  		<div class="alert alert-danger col-md-6 alert1 warning" role="alert">
			请先登录!
			<button type="button" class="close" data-dismiss="alert">
				<span>&times;</span>
			</button>
		</div>
		<h3><img class="list" alt="list" src="${pageContext.request.contextPath }/static/list.png">图书列表</h3>
		<!-- 搜索结果 -->
		<% 
			if(session.getAttribute("search")!=null){
				String search = (String)session.getAttribute("search");
				if(search.equals("success")){
					List<Book> books = (List<Book>)session.getAttribute("searchbooks");
		%>
				<div class="alert alert-success col-md-6 alert1 alert2" role="alert">
					查询结果:
					<button type="button" class="close" data-dismiss="alert">
						<span>&times;</span>
					</button>
					<table class="table">
						<tbody>
							<%	
								for(Book book:books){		
							%>
							<tr>
								<td>
									<%out.print("序号:"+book.getBookId()+"-书名:"+book.getBookName()+"-作者:"+book.getAuthor()+"-位置:"+book.getLocation()); %>
								</td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>
		<%
				session.removeAttribute("searchbooks");
				session.removeAttribute("search");
				}else if(search.equals("fail")){
		%>

				<div class="alert alert-danger col-md-6 alert1" role="alert">
					查询失败!
					<button type="button" class="close" data-dismiss="alert">
						<span>&times;</span>
					</button>
				</div>
		<%
				session.removeAttribute("search");
				}	
			}

			String lendbook = (String)session.getAttribute("lendbook");
			if(lendbook!=null){
				if(lendbook.equals("success")){
					out.print("<div class='alert alert-success col-md-6 alert1' role='alert'>借阅成功!请按时归还图书<button type='button' class='close' data-dismiss='alert'><span>&times;</span></button></div>");
					session.removeAttribute("lendbook");
				}
			}
		%>
		<table class="table table-hover table-bordered" style="width: 1200px">
			<tr class="active" style="text-align: center">
				<th>图书序号</th>
				<th>图书名称</th>
				<th>图书类型</th>
				<th>出版社</th>
				<th>作者</th>
				<th>价格</th>
				<th>库存</th>
				<th>位置</th>
				<th>借出图书</th>
			</tr>
			
		<!-- 获取图书信息 -->	
		<%
		//获取request域中的数据
		int date = (int)request.getAttribute("returndate");
		int fine = (int)request.getAttribute("fine");
		Page p = (Page)request.getAttribute("page");
		if(p!=null){
			for(Book book:p.getBooks()){
		%>	
			<tr style="text-align: center">
				<td><%=book.getBookId() %></td>
				<td><a href="${pageContext.request.contextPath }/user/getBookInfo/<%=book.getBookId() %>"><%=book.getBookName() %></a></td>
				<td><%=book.getBookType() %></td>
				<td><%=book.getPress() %></td>
				<td><%=book.getAuthor() %></td>
				<td><%=book.getPrice() %></td>
				<td><%=book.getStock() %></td>
				<td><%=book.getLocation() %></td>
				<%
					String username = (String)session.getAttribute("user"); 
				%>
				<td>
					<input type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal<%=book.getBookId() %>" value="借"/>
				</td>
			</tr>
			<!-- 借书模态框 -->
			<!-- Modal -->
			<div class="modal fade" id="myModal<%=book.getBookId() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">确认图书信息</h4>
			      </div>
			      <div class="modal-body">
			        <p>书名:<%=book.getBookName() %></p>
			        <p>图书类型:<%=book.getBookType() %></p>
			        <p>作者:<%=book.getAuthor() %></p>
			        <p>出版社:<%=book.getPress() %></p>
			        <p>位置:<%=book.getLocation() %></p>
			        <p><span style="font-weight: 900;color: red;">温馨提醒</span>：每人只能借一本相同图书。请在<%=date %>天内归还图书!
			        	迟还一天缴纳罚金<%=fine %>元</p>
			      </div>
			      <div class="modal-footer">
			        <form <%if(username!=null){ %>action="${pageContext.request.contextPath }/user/lendbook"<%}else{%>action="javascript:;"<%} %> method="post">
						<input type="hidden" name="bookid" value="<%=book.getBookId() %>">
						<input type="hidden" name="username" value="<%=username %>">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" <%if(username==null){%>onclick="clickEvent()"<%} %> value="确定借阅"/>
					</form>
			      </div>
			    </div>
			  </div>
			</div>
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
                <li <% if(currentPage==0){%> class="active"<%} %>><a href="<% if(0<totalPage){%>${pageContext.request.contextPath }/query/book/0<%}%>">1</a></li>
                <li <% if(currentPage==1){%> class="active"<%} %>><a href="<% if(1<totalPage){%>${pageContext.request.contextPath }/query/book/1<%}%>">2</a></li>
                <li <% if(currentPage==2){%> class="active"<%} %>><a href="<% if(2<totalPage){%>${pageContext.request.contextPath }/query/book/2<%}%>">3</a></li>
                <li <% if(currentPage==3){%> class="active"<%} %>><a href="<% if(3<totalPage){%>${pageContext.request.contextPath }/query/book/3<%}%>">4</a></li>
                <li <% if(currentPage==4){%> class="active"<%} %>><a href="<% if(4<totalPage){%>${pageContext.request.contextPath }/query/book/4<%}%>">5</a></li>
                <li <% if(currentPage>=totalPage-1){%> class="disabled"<%} %>><a href="<% if(currentPage<totalPage-1){%>${pageContext.request.contextPath }/query/book/<%= p.getCurrentPage()+1%><%}%>">&raquo;</a></li>
                
                
            </ul>
        </nav>
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
<script>

/* 	function clickEvent(){
		alert("请先登录！")
	} */
	
	function clickEvent(){
    	
    	$(".warning").css({
            "display": "block",
        });
    	return false;
	}
</script>
</body>
</html>