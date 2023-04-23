<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - FastKart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">
                        <div class="card-header">
                            <h3>Login here</h3>
                        </div>

                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <a href="register.jsp ">If not registered, click here</a>

                                <div class="text-center">
                                    <input type="reset" value="Reset" class="btn btn-primary">
                                    <input type="submit" value="Submit" class="btn btn-primary" >
                                </div>
                            </form>
                        </div>

                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
