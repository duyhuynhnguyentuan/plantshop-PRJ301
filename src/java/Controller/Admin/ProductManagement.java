/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.billDAO;
import DAO.productDAO;
import Entity.Bill;
import Entity.Category;
import Entity.Color;
import Entity.Product;
import Entity.Size;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DUY HUYNH
 */
public class ProductManagement extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            Entity.User user = (User) session.getAttribute("user");
            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                if (action.equalsIgnoreCase("allproduct")) {

                    productDAO dao = new productDAO();
                    List<Product> allProduct = dao.getProduct();
                    int count = dao.countProduct();

                    int countproductlow = dao.CountProductLow();

                    request.setAttribute("product", count);
                    request.setAttribute("allProduct", allProduct);

                    request.setAttribute("low", countproductlow);

                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);
                }
                if (action.equals("deleteproduct")) {
                    String product_id = request.getParameter("product_id");
                    int id = Integer.parseInt(product_id);
                    productDAO dao = new productDAO();
                    dao.deleteProduct(product_id);
                    response.sendRedirect("ProductManagement?action=allproduct");
                }
                if (action.equals("createnew")) {
                      if (action.equalsIgnoreCase("insertproduct")) {
                    String product_id = request.getParameter("product_id");
                    String category_id = request.getParameter("category_id");
                    String product_name = request.getParameter("product_name");
                    String product_price = request.getParameter("price");
                
                    String product_quantity = request.getParameter("quantity");
                    String product_img = "images/" + request.getParameter("product_img");
                    String product_describe = request.getParameter("describe");
                    int quantity = Integer.parseInt(product_quantity);
                    Float price = Float.parseFloat(product_price);
                    int cid = Integer.parseInt(category_id);
                    productDAO dao = new productDAO();
                    Category cate = new Category(cid);
                    
              
                
                    // color
                   

                    Product product = new Product();
                    product.setCate(cate);
                    product.setProduct_id(product_id);
                    product.setProduct_name(product_name);
                    product.setProduct_price(price);
                    product.setProduct_description(product_describe);
                    product.setQuantity(quantity);
                    product.setImg(product_img);
                   
                    dao.insertProduct(product);
                    response.sendRedirect("productmanager?action=insert");
                }
              response.sendRedirect("ProductManagement?action=allproduct");
                }

            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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
