/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Home;

import DAO.UserDAO;
import DAO.billDAO;
import Entity.BillDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DUY HUYNH
 */
public class User extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
       if (action.equals("login")) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (action.equals("checkLogin")) {
            String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
            String remember = request.getParameter("remember");
            UserDAO dao = new UserDAO();
            Entity.User user = dao.checkUser(user_email, user_pass);
            if (user == null) {
                request.setAttribute("error", "Tài khoản không tồn tại !");
                request.getRequestDispatcher("user?action=login").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                Cookie email = new Cookie("email", user_email);
                Cookie pass = new Cookie("pass", user_pass);
                Cookie rem = new Cookie("remember", remember);
                if (remember != null) {
                    email.setMaxAge(60 * 60 * 24 * 30);
                    pass.setMaxAge(60 * 60 * 24 * 3);
                    rem.setMaxAge(60 * 60 * 24 * 30);
                } else {
                    email.setMaxAge(0);
                    pass.setMaxAge(0);
                    rem.setMaxAge(0);
                }
                response.addCookie(email);
                response.addCookie(pass);
                response.addCookie(rem);
                response.sendRedirect("home");
            }
        }

        if (action.equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            response.sendRedirect("home");
        }

        if (action.equals("myaccount")) {
            try {
                HttpSession session = request.getSession();
                Entity.User user = (Entity.User) session.getAttribute("user");
                if (user != null) {
                    int user_id = user.getUser_id();
                    billDAO dao = new billDAO();
                    List<Entity.Bill> bill = dao.getBillByID(user_id);
                    request.setAttribute("bill", bill);
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                } else {
                    response.sendRedirect("user?action=login");
                }
            } catch (Exception e) {
                response.sendRedirect("user?action=login");
                System.out.println(e);
            }
        }
        if (action.equals("showdetail")) {
            String bill_id = request.getParameter("bill_id");
            int id = Integer.parseInt(bill_id);
            billDAO dao = new billDAO();
            List<BillDetail> detail = dao.getDetail(id);
            request.setAttribute("detail", detail);
            request.getRequestDispatcher("billdetail.jsp").forward(request, response);
        }

        if (action.equals("updateinfo")) {
            try {
                HttpSession session = request.getSession();
                Entity.User user = (Entity.User) session.getAttribute("user");
                if (user != null) {
                    String user_name = request.getParameter("user_name");
                    String user_pass = request.getParameter("user_pass");
                    int user_id = user.getUser_id();
                    UserDAO dao = new UserDAO();
                    dao.updateUser(user_id, user_name, user_pass);
                    Entity.User user1 = new Entity.User(user.getUser_id(), user_name, user.getUser_email(), user_pass, user.getIsAdmin());
                    session.setAttribute("user", user1);
                    response.sendRedirect("user?action=myaccount");
                } else {
                    response.sendRedirect("user?action=login");
                }
            } catch (Exception e) {
                response.sendRedirect("user?action=login");
            }
        }

        if (action.equals("signup")) {
            String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
            String re_pass = request.getParameter("re_pass");
            if (!user_pass.equals(re_pass)) {
                request.setAttribute("error_pass", "Mật khẩu không trùng khớp. Hãy nhập lại...");
                request.getRequestDispatcher("user?action=login").forward(request, response);
            } else {
                UserDAO dao = new UserDAO();
                Entity.User a = dao.checkAcc(user_email);
                if (a == null) {
                    dao.signup(user_email, user_pass);
                    request.setAttribute("done", "Đăng ký thành công");
                    request.getRequestDispatcher("user?action=login").forward(request, response);
                } else {
                    request.setAttribute("emailavailable", "Email đã tồn tại!");
                    request.getRequestDispatcher("user?action=login").forward(request, response);
                }
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
