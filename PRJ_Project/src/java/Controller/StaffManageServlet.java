
package Controller;

import DAO.AccountDAO;
import Model.Account;
import Model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "StaffManageServlet", urlPatterns = {"/StaffManage"})
public class StaffManageServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDAO dao = new AccountDAO();
       Account a = (Account)request.getAttribute("account");
       Staff s = dao.getStaffByUserName(a.getUsername());
       request.setAttribute("checked", "account");
       request.setAttribute("active", "manage");
       if(s!=null){
           request.setAttribute("user", a.getUsername());
           request.setAttribute("staff", s);
           request.setAttribute("task", "update");
           request.getRequestDispatcher("SeeAccount.jsp").forward(request, response);
       }else{
           request.setAttribute("user", a.getUsername());
           request.setAttribute("task", "add");
           request.getRequestDispatcher("SeeAccount.jsp").forward(request, response);
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
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        AccountDAO dao = new AccountDAO();
        Staff staff = dao.getStaffByUserName(user);
        request.setAttribute("staff", staff);
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "account");
        if (task.equals("update")) {
            dao.updateStaff(user, firstname, lastname, dob, address, phone);
            request.setAttribute("message", "Staff updated.");
            request.getRequestDispatcher("Account").forward(request, response);
        }
        if (task.equals("add")) {
            dao.addStaff(user, firstname, lastname, dob, address, phone);
            request.setAttribute("message", "Staff added.");
            request.getRequestDispatcher("Account").forward(request, response);
        }

    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
