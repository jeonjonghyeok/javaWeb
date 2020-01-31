<%@ page contentType = "text/html; charset=utf-8" %>
<%-- <%@ page import = "util.Cookies" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if (id.equals(password)) {
		// ID와 암호가 같으면 로그인에 성공한 것으로 판단.
		response.addCookie(
			Cookies.createCookie("AUTH", id, "/", -1)
		);
		response.sendRedirect("../main/index2.jsp");
	} else { // 로그인 실패시
%> --%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if (id.equals(password)) {
		session.setAttribute("MEMBER", id);
		response.sendRedirect("../main/index2.jsp");
	} else { // 로그인 실패시
%>


<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%
	}
%>
