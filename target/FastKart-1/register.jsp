<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp"%>

        <div class="container-fluid">

            <div class="row mt-5">

                <div class="col-md-4 offset-md-4">

                    <div class="card px-3 py-3" style="margin-bottom: 50px;">

                        <%@include file="components/message.jsp" %>

                        <div style="text-align: center">
                            <img src="img/SignupIcon.png" alt="sign-up icon" width="50" height="50" >
                        </div>

                        <h3 class="text-center my- 3">Sign up here</h3>

                        <form action="RegisterServlet" method="post" id="registrationForm">

                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="userName" type="text" class="form-control" id="name" placeholder="Enter here">
                                <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                            </div>

                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="userEmail" type="email" class="form-control" id="email" placeholder="Enter here">
                            </div>

                            <div class="form-group">
                                <label for="password">User Password</label>
                                <input name="userPassword" type="password" class="form-control" id="password" placeholder="Enter here">
                            </div>

                            <div class="form-group">
                                <label for="phone">User Phone</label>
                                <input name="userPhone" type="tel" class="form-control" id="phone" placeholder="Enter here">
                            </div>

                            <div class="form-group">
                                <label for="phone">User Address</label>
                                <textarea name="userAddress" style="height: 100px" class="form-control" placeholder="Enter your address"></textarea>
                            </div>

                            <div class="container text-center">
                                <input type="reset" value="Clear Entries" class="btn btn-outline-warning">
                                <input type="submit" value="Register" class="btn btn-outline-success" >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
