package com.fastkart.servlets;

import com.fastkart.dao.CategoryDao;
import com.fastkart.dao.ProductDao;
import com.fastkart.entities.Category;
import com.fastkart.entities.Product;
import com.fastkart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            fetching operation type
            String operation = request.getParameter("operation");

            if (operation.equals("addCategory")) {

//            fetching category data
                String catgTitle = request.getParameter("catgTitle");
                String catgDsescription = request.getParameter("catgDsescription");
                Category catg = new Category(catgTitle, catgDsescription);

//                save catg in database
                CategoryDao catgDao = new CategoryDao(FactoryProvider.getFactory());
                int catgId = catgDao.saveCategory(catg);
//                out.println("Category saved: " + catgId);

                HttpSession httpSession = request.getSession();
                String message = "";

                if (catgId == 0) {
                    message = "Sorry!! Category could not be added! Error occured!";
                    httpSession.setAttribute("isWarning", true);
                } else {
                    message = "Category- " + catgTitle + " is added!";
                    httpSession.setAttribute("isWarning", false);
                }

                httpSession.setAttribute("message", message);
                response.sendRedirect("admin.jsp");

            } else if (operation.equals("addProduct")) {

                String pName = request.getParameter("prodName");
                String pDesc = request.getParameter("prodDescription");
                int pPrice = Integer.parseInt(request.getParameter("prodPrice"));
                int pDisc = Integer.parseInt(request.getParameter("prodDiscount"));
                int pQuant = Integer.parseInt(request.getParameter("prodQuant"));
                int catgId = Integer.parseInt(request.getParameter("catgId"));
                Part part = request.getPart("prodImage");

                Product p = new Product(pName, pDesc, part.getSubmittedFileName(), pPrice, pDisc, pQuant);

//                getting category by id and setting it in product
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());

                p.setCategory(cdao.getCategoryByID(catgId));

//               save product
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                boolean productSaved = pdao.saveproduct(p);

//                product pic upload
//                finding the path
                String path = request.getServletContext().getRealPath("img" + File.separator + "ProductImages"+File.separator+part.getSubmittedFileName());
//                String path1 = request.getSession().getServletContext().getRealPath("img");
                System.out.println(path);

//            uploading code
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();

//                reading data
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                
                fos.close();
                is.close();

                String message = productSaved ? "Product is saved!" : "Product couldn't be saved!!";
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", message);
                httpSession.setAttribute("isWarning", !productSaved);
                response.sendRedirect("admin.jsp");

            } else {
                System.out.println("Operation- " + operation + " not recognized");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
