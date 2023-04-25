<%@page import="com.fastkart.helper.Helper"%>
<%@page import="com.fastkart.entities.Category"%>
<%@page import="com.fastkart.dao.CategoryDao"%>
<%@page import="com.fastkart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.fastkart.dao.ProductDao"%>
<%@page import="com.fastkart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%
        String catgId = request.getParameter("category");
        int _catgID = -1; // _catgID = Integer.parseInt(catgId);
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        List<Product> prodList = null;

        if (catgId == null || catgId.equals("all")) {
                prodList = pdao.getAllProducts();
        } else {
                _catgID = Integer.parseInt(catgId);
                prodList = pdao.getProductsByCategoryID(_catgID);
        }

        CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> catgList = cdao.getCategories();
        %>
        <div class="row">

            <!--show categories-->

            <div class="col-md-2">

                <div class="list-group">
                    <%
                    String activeStatus = (_catgID == -1) ? "active" : "";
                    %>
                    <a href="index.jsp?category=all"
                       class="list-group-item list-group-item-action <%=activeStatus%>">All
                        categories</a>
                        <%
                        for (Category catg : catgList) {
                                activeStatus = (catg.getCategoryId() == _catgID) ? "active" : "";
                        %>
                    <a href="index.jsp?category=<%=catg.getCategoryId()%>"
                       class="list-group-item list-group-item-action <%=activeStatus%>"><%=catg.getCategoryTitle()%></a>
                    <%}%>
                </div>


            </div>

            <!--show products-->

            <div class="col-md-10">

                <div class="row">
                    <%
                    if (prodList.size() == 0) {
                            out.println("<h3 class=\"ml-3\">No products found!!</h3>");
                    }
                    %>
                    <div class="col-md-12">

                        <div class="card-columns">
                            <%
                            for (Product product : prodList) {
                            %>

                            <!-- Products card -->
                            <div class="card">

                                <div class="container text-center mt-2">
                                    <img class="card-img-top"
                                         src="img/ProductImages/<%=product.getProductPhoto()%>"
                                         style="height: 200px; width: auto; max-width: 100%">
                                </div>

                                <div class="card-body">
                                    <h5 class="card-title"><%=product.getProductName()%></h5>
                                    <p class="card-text"><%=Helper.getFirst10Words(product.getProductDescription())%></p>
                                </div>
                                <div class="card-footer">
                                    <button type="button" class="btn btn-success m-1" onclick="addToCart(<%= product.getProductId()%>,'<%= product.getProductName()%>',<%= product.getPriceAfterDiscount()%>)">Add
                                        to cart</button>
                                    <button type="button" class="btn btn-outline-primary m-1"
                                            disabled>
                                        <span class="initial-price">&#8377;<%=product.getProductPrice()%>/-
                                        </span> &#8377;<%=product.getPriceAfterDiscount()%>/- <span
                                            class="applied-discount"><%=product.getProductDiscount()%>%
                                            off</span>
                                    </button>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
