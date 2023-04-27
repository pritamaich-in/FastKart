<%@page import="com.fastkart.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>
<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #e3f2fd;">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">FastKart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<!--      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>-->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<!--      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>-->
			</ul>
			<!--    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>-->
			<ul class="navbar-nav ml-auto">
				<%
				if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register</a></li>

				<%
				} else {
				String _href = user1.getUserType().equals("normal") ? "normalUser.jsp" : "admin.jsp";
				%>

				<!-- Cart Button -->
				<li class="nav-item active">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cart">
						Cart <span class="badge badge-light cart-items">4</span>
					</button>
				</li>


				<li class="nav-item active"><a class="nav-link"
					href="<%=_href%>"><%=user1.getUserName()%></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">Logout</a></li>

				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>