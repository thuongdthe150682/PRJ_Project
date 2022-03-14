
package Controller;

import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateDishServlet", urlPatterns = {"/UpdateDish"})
public class UpdateDishServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String task = request.getParameter("task");
        request.setAttribute("task", task);
        String dishid = request.getParameter("id");
        DishDAO dao = new DishDAO();
        CategoryDAO cdao = new CategoryDAO();
            List<Category> listC= cdao.getAllCategory();
            request.setAttribute("checked", "dish");
            request.setAttribute("task", task);
            request.setAttribute("listC", listC);
        if(task.equals("update")){
            Dish dish = dao.getDishesById(dishid);
            request.setAttribute("dish", dish);
            request.getRequestDispatcher("UpdateDish.jsp").forward(request, response);
           // request.getRequestDispatcher("check.jsp").forward(request, response);
        }
        else if(task.equals("delete")){
            dao.deleteDish(dishid);
            request.setAttribute("mess", "Dish has been deleted.");
            request.setAttribute("checked", "dish");
            request.getRequestDispatcher("ManageDish.jsp").forward(request, response);
        }
        else if(task.equals("add")){
            request.getRequestDispatcher("UpdateDish.jsp").forward(request, response);
        }
        else if(task.equals("see")){
            Dish dish = dao.getDishesById(dishid);
            request.setAttribute("dish", dish);
            request.getRequestDispatcher("UpdateDish.jsp").forward(request, response);
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            // update dish
            String task = request.getParameter("task");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String image = request.getParameter("image");
            String Status = request.getParameter("Status");
            String category = request.getParameter("category");
            DishDAO dao = new DishDAO();
            request.setAttribute("checked", "dish");
            if(task.equals("update")){
                dao.updateDish(id, name, description, price, image, Status, category);
                Dish dish = dao.getDishesById(id);
                request.setAttribute("mess", "Dish is updated.");
                request.setAttribute("task", task);
                request.setAttribute("dish", dish);
                request.setAttribute("active", "dish");
                request.getRequestDispatcher("UpdateDish.jsp").forward(request, response);
            }
            if(task.equals("add")){
                dao.updateDish(id, name, description, price, image, Status, category);
                Dish dish = dao.getLastDish();
                request.setAttribute("mess", "Dish is add.");
                request.setAttribute("dish", dish);
                request.setAttribute("active", "dish");
                request.getRequestDispatcher("UpdateDish.jsp").forward(request, response);
            }
        
        
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
