
<%
String message = (String) session.getAttribute("message");
if (message != null && session.getAttribute("isWarning") != null) {
	//    out.println(message);
	String alertType = (Boolean) session.getAttribute("isWarning") ? "alert-danger" : "alert-success";
	// String alertType = "alert-danger";
%>

<div class="alert <%=alertType%> alert-dismissible fade show"
	role="alert">
	<strong>
		<%
		out.println(message);
		%>
	</strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
session.removeAttribute("message");
session.removeAttribute("isWarning");
}
%>