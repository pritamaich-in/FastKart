<%@page import="java.util.List"%>
<%@page import="com.fastkart.helper.FactoryProvider"%>
<%@page import="com.fastkart.entities.Category"%>
<%@page import="com.fastkart.entities.User"%>
<%@page import="com.fastkart.dao.CategoryDao"%>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
} else {
        if (user.getUserType().equals("normal")) {
                session.setAttribute("message", "You are not authorized to access admin panel!!");
                response.sendRedirect("login.jsp");
                return;
        }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container admin">

            <div class="mt-3">
                <%@include file="components/message.jsp"%>
            </div>

            <!--1st row-->
            <div class="row mt-3">

                <!--1st column-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="container mt-3 mb-3">
                            <img src="img/AdminPanelUsers.png" width=125 height=125
                                 alt="User Icon" />
                        </div>
                        <h1>1234</h1>
                        <h1>Users</h1>
                    </div>
                </div>

                <!--2nd column-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="container mt-3 mb-3">
                            <img src="img/AdminPanelCategories.png" width=125 height=125
                                 alt="Caegories Icon" />
                        </div>
                        <h1>1234</h1>
                        <h1>Categories</h1>
                    </div>
                </div>

                <!--3rd column-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="container mt-3 mb-3">
                            <img src="img/AdminPanelProducts.png" width=125 height=125
                                 alt="Products Icon" />
                        </div>
                        <h1>1234</h1>
                        <h1>Products</h1>
                    </div>
                </div>

            </div>

            <!--2nd row-->
            <div class="row mt-3">

                <!--1st column-->
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal"
                         data-target="#AddCategoryModal">
                        <div class="container mt-3 mb-3">
                            <img src="img/AddCategory.png" width=125 height=125
                                 alt="User Icon" />
                        </div>
                        <h1>Add Category</h1>
                    </div>
                </div>

                <!--2nd column-->
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal"
                         data-target="#AddProductModal">
                        <div class="container mt-3 mb-3">
                            <img src="img/add-product.png" width=125 height=125
                                 alt="Caegories Icon" />
                        </div>
                        <h1>Add Products</h1>
                    </div>
                </div>
            </div>
        </div>

        <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--add category modal-->

        <div class="modal fade" id="AddCategoryModal" tabindex="-1"
             role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"
                         style="background: blueviolet; color: white;">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category
                            details</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory" />
                            <div class="form-group">
                                <input type="text" class="form-control" name="catgTitle"
                                       placeholder="Enter category title here" required />
                            </div>

                            <div class="form-group">
                                <textarea style="height: 250px" class="form-control"
                                          name="catgDsescription" placeholder="Enter category description"
                                          required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--add category modal ends here-->

        <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--add product modal-->

        <div class="modal fade" id="AddProductModal" tabindex="-1"
             role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"
                         style="background: blueviolet; color: white;">
                        <h5 class="modal-title" id="exampleModalLabel">Fill product
                            details</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">

                        <!--add product form starts here-->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addProduct" />
                            <div class="form-group">
                                <input type="text" class="form-control" name="prodName"
                                       placeholder="Enter product name here" required />
                            </div>

                            <div class="form-group">
                                <textarea style="height: 200px" class="form-control"
                                          name="prodDescription" placeholder="Enter product description"
                                          required></textarea>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="prodPrice"
                                       placeholder="Enter price of product here" required />
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="prodDiscount"
                                       placeholder="Enter applicable discount here" required />
                            </div>


                            <div class="form-group">
                                <input type="number" class="form-control" name="prodQuant"
                                       placeholder="Enter quantity of product here" required />
                            </div>

                            <!--product category-->

                            <%
                            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> catgList = cdao.getCategories();
                            %>

                            <div class="form-group">
                                <label for="catgSelection">Select category of this product: </label>
                                <select id="catgSelection" name = "catgId" class="form-control">
                                    <%
                                    for (Category catg : catgList) {
                                    %>
                                    <option value="<%=catg.getCategoryId()%>"><%=catg.getCategoryTitle()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>



                            <!--product image-->

                            <div class="form-group">
                                <label for="prodPic">Select a picture of product:</label> <input
                                    type="file" name="prodImage" id="prodPic" class="form-control" />
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>
                        </form>
                        <!--add product form ends here-->
                    </div>
                </div>
            </div>
        </div>
        <!--add product modal ends here-->

    </body>
</html>
