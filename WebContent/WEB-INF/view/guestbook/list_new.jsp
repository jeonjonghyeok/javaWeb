<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="guestbook.model.Message"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ page import="guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jspf"%>


<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>


<!-- content-wrapper start -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			방문록 <small>간략한 내용으로 작성해 주세요.</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">Blank page</li>
		</ol>
	</section>

	<!-- content start -->
	<section class="content">

		<!-- box start -->
		<div class="box">
			<div class="box-header with-border">
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>
						---</option>
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
						Title</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
						Content</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
						Writer</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
						Title OR Content</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
						Content OR Writer</option>
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
						Title OR Content OR Writer</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }'>
				<button id='searchBtn'>검색</button>
				<button id='newBtn' onclick="location.href='guestbookWrite.do' ">작성</button>
			</div>

			<!-- box-body start -->
			<div class="box-body">
				<c:set var="viewData" value="<%=viewData%>" />
				<c:if test="${viewData.isEmpty()}">	
							등록된 메시지가 없습니다.
						</c:if>

				<c:if test="${!viewData.isEmpty()}">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th width="10%">메시지 번호</th>
								<th width="10%">손님 이름</th>
								<th>메시지</th>
								<th width="10%">실행</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="message" items="${viewData.messageList}">
								<tr>
									<td>${message.id}</td>
									<td>${message.guestName}</td>
									<td>${message.message}</td>
									<td><a href="confirmDeletion.jsp?messageId=${message.id}">[삭제하기]</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			<!-- box-body end -->

			<!-- box-footer start -->
			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">

						<li><a href="guestbookList.do?page=1&limit=${limit}&find_name="><i
								class="fa fa-angle-double-left"></i></a></li>
						<li><a
							href="guestbookList.do?page=${startPage - limit}&limit=${limit}&find_name="><i
								class="fa fa-angle-left"></i></a></li>

						<c:forEach var="pageNum" begin="1"
							end="${viewData.pageTotalCount}">
							<li
								<c:out value="${viewData.currentPageNumber == pageNum?'class =active':''}"/>><a
								href="guestbookList.do?page=${pageNum}">${pageNum}</a></li>
						</c:forEach>

						<li><a
							href="guestbookList.do?page=${startPage+limit}&limit=${limit}&find_name="><i
								class="fa fa-angle-right"></i></a></li>
						<li><a
							href="guestbookList.do?page=${maxPage}&limit=${limit}&find_name="><i
								class="fa fa-angle-double-right"></i></a></li>



						<%-- 


						<c:if test="${pageNumber <=1 }">
				[이전]&nbsp;
			</c:if>

						<c:if test="${pageNumber > 1 }">
							<a href="board_list.nhn?page=${pageNumber-1}">[이전]</a>&nbsp;
			</c:if>

						<c:forEach var="a" begin="1" end="${viewData.pageTotalCount}">
							<c:if test="${a == pageNumber }">
					[${a}]
				</c:if>
							<c:if test="${a != pageNumber }">
								<a
								href="list.jsp?page=${pageNum}">${pageNum}</a>&nbsp;
				</c:if>
						</c:forEach>

						<c:if test="${pageNumber >= maxpage }">
				[다음] 
			</c:if>
						<c:if test="${pageNumber < maxpage }">
							<a href="board_list.nhn?page=${page+1}">[다음]</a>
						</c:if>

 --%>








					</ul>
				</div>
			</div>
			<!-- box-footer end -->

		</div>
		<!-- box end -->

	</section>
	<!-- content end -->

</div>
<!-- content-wrapper end -->


<%@include file="../include/footer.jspf"%>
