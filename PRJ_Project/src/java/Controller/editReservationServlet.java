
package Controller;

import DAO.ReserveDAO;
import Model.Account;
import Model.Reservation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "editReservationServlet", urlPatterns = {"/editReservation"})
public class editReservationServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String number = request.getParameter("number");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("acc");
        String staff = account.getUsername();
        ReserveDAO dao = new ReserveDAO();
        dao.updateReservation(name, date, time, phone, number, message,staff,id);
        //Reservation reserve = dao.getReservationById(id);
        request.setAttribute("id", id);
        request.setAttribute("messageEdit", "Edit Successfully.");
        request.getRequestDispatcher("Reserve").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
