
package Controller;

import DAO.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        AccountDAO dao = new AccountDAO();
        Account account = dao.getAnAccount(user, pass);
        if(account==null){
            request.setAttribute("message", "Wrong Username or Password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("acc", account);
            //request.setAttribute("acc", account);
            //session.setAttribute("acc", account);
            //request.getRequestDispatcher("Home").forward(request, response);
            response.sendRedirect("Home");
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
            response.sendRedirect("Login.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
