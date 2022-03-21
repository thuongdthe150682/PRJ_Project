
package Control;

import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Category_Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DishManageControl extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       CategoryDAO daoc = new CategoryDAO();
        List<Category> listC = daoc.getAllCategory();
        String s= "";
        s = request.getParameter("task");
        if(s!=null && s.equals("see")){
            request.setAttribute("active", "dishes");
        }
        DishDAO dao = new DishDAO();
        List<Category_Dish> list = new ArrayList<>();
        List<Category_Dish> listP = new ArrayList<>();
        for (int i = 0; i < listC.size(); i++) {
            list.add(new Category_Dish(listC.get(i).getId() + "", listC.get(i).getName(),
                    dao.getDishesByCategory(listC.get(i).getId() + "")));
            listP.add(new Category_Dish(listC.get(i).getId() + "", listC.get(i).getName(),
                    dao.getPauseDishesByCategory(listC.get(i).getId() + "")));
        }
        request.setAttribute("list", list);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "dish");
        request.getRequestDispatcher("ManageDish.jsp").forward(request, response);
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
