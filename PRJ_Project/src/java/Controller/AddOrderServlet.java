
package Controller;

import DAO.AddOderDAO;
import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Dish;
import Model.Table;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddOrderServlet", urlPatterns = {"/AddOrder"})
public class AddOrderServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DishDAO dao = new DishDAO();
        CategoryDAO daoo = new CategoryDAO();
        List<Category> listC = daoo.getAllCategory();
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("Addorder.jsp").forward(request, response);
        
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
