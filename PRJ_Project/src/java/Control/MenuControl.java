
package Control;

import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MenuControl extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DishDAO dao = new DishDAO();
        List<Dish> list = dao.getAllDishes();
        
        CategoryDAO daoc = new CategoryDAO();
        List<Category> listC = daoc.getAllCategory();
        
        String id = "0";
        if(request.getParameter("id")!=null){
            id = request.getParameter("id");
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
