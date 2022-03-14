
package Controller;

import DAO.ReserveDAO;
import Model.Reservation;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ReserveServlet", urlPatterns = {"/Reserve"})
public class ReserveServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReserveDAO dao =new ReserveDAO();
        List<Reservation> list = dao.getNotYetReservation();
        List<Reservation> listD = dao.getDoneReservation();
        if(list.isEmpty() && listD.isEmpty()){
            request.setAttribute("message", "There is no Reservation");
        }
        
        String id = request.getParameter("id");
        Reservation reserve = dao.getReservationById(id);
        request.setAttribute("checked", "reserve");
        request.setAttribute("id", id);
        request.setAttribute("reserve", reserve);
        request.setAttribute("active", "Reserve");
        request.setAttribute("listN", list);
        request.setAttribute("listD", listD);
        String messageEdit = (String) request.getAttribute("messageEdit");
        request.setAttribute("messageEdit", messageEdit);
        request.getRequestDispatcher("Reserve.jsp").forward(request, response);
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
