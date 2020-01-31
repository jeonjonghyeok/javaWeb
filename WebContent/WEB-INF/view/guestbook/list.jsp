<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="guestbook.model.Message"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ page import="guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jspf"%>

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			방명록 <small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">Blank page</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">Title</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse" data-toggle="tooltip" title="Collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button type="button" class="btn btn-box-tool" data-widget="remove"
						data-toggle="tooltip" title="Remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body">



				<c:set var="viewData" value="<%=viewData%>" />

				<form action="writeMessage.jsp" method="post">
					이름: <input type="text" name="guestName"> <br> 암호: <input
						type="password" name="password"> <br> 메시지:
					<textarea name="message" cols="30" rows="3"></textarea>
					<br> <input type="submit" value="메시지 남기기" />
				</form>
				<hr>
				<c:if test="${viewData.isEmpty()}">
					등록된 메시지가 없습니다.
				</c:if>

				<c:if test="${!viewData.isEmpty()}">
					<table border="1" >
						<c:forEach var="message" items="${viewData.messageList}">
							<tr>
								<td>메시지 번호: ${message.id} <br /> 손님 이름:
									${message.guestName} <br /> 메시지: ${message.message} <br /> <a
									href="confirmDeletion.jsp?messageId=${message.id}">[삭제하기]</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>

			</div>
			<!-- /.box-body -->

			<div class="box-footer">
				<c:if test="${!viewData.isEmpty()}">
					<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
						<a href="list.jsp?page=${pageNum}">[${pageNum}]</a>
					</c:forEach>
				</c:if>
			</div>
			<!-- /.box-footer-->

		</div>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@ include file="../include/footer.jspf"%>
