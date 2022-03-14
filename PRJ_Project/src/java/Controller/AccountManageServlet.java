
package Controller;

import DAO.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AccountManageServlet", urlPatterns = {"/Accountt"})
public class AccountManageServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDAO dao = new AccountDAO();
        
        List<Account> list = dao.getAllAccount();
        request.setAttribute("message", request.getAttribute("message"));
        request.setAttribute("mess", request.getAttribute("mess"));
        request.setAttribute("account", request.getAttribute("account"));
        request.setAttribute("task", request.getAttribute("task"));
        request.setAttribute("list", list);
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "account");
        request.getRequestDispatcher("ManageAccount.jsp").forward(request, response);
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
