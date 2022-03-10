
package Controller;

import DAO.ReserveDAO;
import Model.Reservation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ReservationServlet", urlPatterns = {"/Reservation"})
public class ReservationServlet extends HttpServlet {

   
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
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//        String name =request.getParameter("name");
//        String phone =request.getParameter("phone");
//        String date =request.getParameter("date");
//        String time =request.getParameter("time");
//        String number =request.getParameter("number");
//        String message =request.getParameter("message");
//        Reservation r = new Reservation( name, date, time, phone,number , message, 0);
////        ReserveDAO dao = new ReserveDAO();
////        dao.addReservation(r);
////        request.setAttribute("message", "Message has been sent.");
////        request.getRequestDispatcher("Reservation.jsp").forward(request, response);
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ReserveServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println(r.toString());
//            out.println("/"+name+"/");
//            out.println("/"+phone+"/");
//            out.println("/"+date+"/");
//            out.println("/"+time+"/");
//            out.println("/"+number+"/");
//            out.println("/"+message+"/");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
