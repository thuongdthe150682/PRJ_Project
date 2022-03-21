
package Control;

import DAO.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateAccountControl extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        String task = request.getParameter("task");
        String user = request.getParameter("user");
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAnAccount(user);
        List<Account> list = dao.getAllAccount();
        request.setAttribute("list", list);
        request.setAttribute("task", task);
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "account");
        if (task.equals("update")) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("ManageAccount.jsp").forward(request, response);
        }
        if (task.equals("add")) {
            request.getRequestDispatcher("ManageAccount.jsp").forward(request, response);
        }
        if (task.equals("see")) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("StaffManage").forward(request, response);
        }
        if (task.equals("delete")) {
            dao.deleteAccount(user);
            request.setAttribute("mess", "Account has been delete");
            request.getRequestDispatcher("Account").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String task = request.getParameter("task");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String isManager = request.getParameter("isManager");
        String message = "";
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAnAccount(user);
        List<Account> list = dao.getAllAccount();
        request.setAttribute("list", list);
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "account");
        if (task.equals("update")) {
            dao.updateAccount(user, pass, isManager);
            request.setAttribute("message", "Account updated.");
            request.getRequestDispatcher("Account").forward(request, response);
        }
        if (task.equals("add")) {
            boolean check = dao.addAccount(user, pass, isManager, list);
            if (check) {
                request.setAttribute("message", "Account created");
            } else {
                Account account = new Account(user, pass);
                request.setAttribute("account", account);
                request.setAttribute("task", "add");
                request.setAttribute("mess", "Can't add.Username duplicate or username/password blank.");
            }
            
            request.getRequestDispatcher("Account").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
