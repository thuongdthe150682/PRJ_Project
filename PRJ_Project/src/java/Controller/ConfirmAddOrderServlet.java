
package Controller;

import DAO.AddOderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ConfirmAddOrderServlet", urlPatterns = {"/ConfirmAddOrder"})
public class ConfirmAddOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmAddOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmAddOrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String idTable = request.getParameter("table");
        AddOderDAO dao = new AddOderDAO();
        
        if(dao.checkFreeTable(idTable)){
            String [] id = request.getParameterValues("id");
            String [] quantity = request.getParameterValues("quantity");
            String [] price = request.getParameterValues("price");
            dao.addAnOrderByTableId(idTable);
            String order = dao.getCurrentOrderByTableId(idTable);
            for (int i = 0; i < id.length; i++) {
                dao.addToOrder_Dish(order, id[i], quantity[i], price[i]);
            }
            request.setAttribute("message", "Order has been add.");
            request.getRequestDispatcher("Table").forward(request, response);
        }else{
            request.setAttribute("message", "Table now is not free.");
            request.getRequestDispatcher("Table").forward(request, response);
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderid = request.getParameter("orderId");
        AddOderDAO dao = new AddOderDAO();
        dao.finishOrder(orderid);
        response.sendRedirect("Table");
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
