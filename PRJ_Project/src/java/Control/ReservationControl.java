
package Control;

import DAO.ReserveDAO;
import Model.Reservation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("active", "reservation");
        response.sendRedirect("Reservation.jsp");
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name =request.getParameter("name");
        String phone =request.getParameter("phone");
        String date =request.getParameter("date");
        String time =request.getParameter("time");
        String number =request.getParameter("number");
        String message =request.getParameter("message");
        Reservation r = new Reservation( name, date, time, phone,number , message, 0);
        ReserveDAO dao = new ReserveDAO();
        dao.addReservation(r);
        request.setAttribute("message", "Message has been sent.");
        request.getRequestDispatcher("Reservation.jsp").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
