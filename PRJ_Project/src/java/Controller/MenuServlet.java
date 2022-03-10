
package Controller;

import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Dish;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "MenuServlet", urlPatterns = {"/Menu"})
public class MenuServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DishDAO dao = new DishDAO();
        List<Dish> list = dao.getAllDishes();
        
        CategoryDAO daoc = new CategoryDAO();
        List<Category> listC = daoc.getAllCategory();
        
        int id = 0;
        if(request.getParameter("id")!=null){
            id = Integer.parseInt(request.getParameter("id")) ;
            list = dao.getDishesByCategory(id);
        }
        request.setAttribute("id", id);
        request.setAttribute("list", list);
        request.setAttribute("listC", listC);
        request.setAttribute("active", "menu");
        request.getRequestDispatcher("Menu.jsp").forward(request, response);
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
