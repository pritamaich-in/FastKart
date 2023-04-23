package com.fastkart.servlets;

import com.fastkart.entities.User;
import com.fastkart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                String userName = request.getParameter("userName");
                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                String userPhone = request.getParameter("userPhone");
                String userAddress = request.getParameter("userAddress");

//                creating User object to store data;
                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");

                Session hibernetSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernetSession.beginTransaction();

                hibernetSession.save(user);

                tx.commit();
                hibernetSession.close();

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registration Successful!! UserName: " + userName);
                httpSession.setAttribute("isWarning", false);
                response.sendRedirect("register.jsp");

            } catch (Exception e) {
                e.printStackTrace();
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
