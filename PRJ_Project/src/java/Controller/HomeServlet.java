
package Controller;

import DAO.DishDAO;
import Model.Dish;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "HomeServlet", urlPatterns = {"/Homee"})
public class HomeServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      DishDAO dao = new DishDAO();
      List<Dish> listN = dao.getNewDishes();
      request.setAttribute("list", listN);
      request.setAttribute("active", "home");
      request.getRequestDispatcher("Home.jsp").forward(request, response);
    }
//    public static void main(String[] args) {
//        DishDAO dao = new DishDAO();
//      List<Dish> listN = dao.getNewDishes();
//        System.out.println(listN.get(0).getImage());
//    }
 
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
