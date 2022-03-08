
package Controller;

import DAO.DishDAO;
import Model.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SpecialDishesServlet", urlPatterns = {"/SpecialDishes"})
public class SpecialDishesServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DishDAO dao = new DishDAO();
      List<Dish> listN = dao.getNewDishes();
      request.setAttribute("list", listN);
      request.getRequestDispatcher("SpecialDishes.jsp").forward(request, response);
     
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