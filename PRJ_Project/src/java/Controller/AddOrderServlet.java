
package Controller;

import DAO.AddOderDAO;
import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Category_Dish;
import Model.Dish;
import Model.Table;
import java.io.IOException;
import java.util.ArrayList;
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
        AddOderDAO ordao = new AddOderDAO();
        CategoryDAO cate_daoo = new CategoryDAO();
        List<Category> listC = cate_daoo.getAllCategory();
        DishDAO dao = new DishDAO();
        List<Category_Dish> list = new ArrayList<>();
        for (int i = 0; i < listC.size(); i++) {
            list.add(new Category_Dish(listC.get(i).getId()+"",listC.get(i).getName(),
                    dao.getDishesByCategory(listC.get(i).getId()+"")));
        }
        String tableid = request.getParameter("tableid");
        request.setAttribute("table", ordao.getTableById(tableid));
        request.setAttribute("listC", listC);
        request.setAttribute("list", list);
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
        //request.setCharacterEncoding("UTF_8");
        String [] dishid = request.getParameterValues("chose");
        String table = request.getParameter("table");
        List<Dish> list = new ArrayList<>();
        DishDAO dao = new DishDAO();
        AddOderDAO Odao = new AddOderDAO();
        for (String dishid1 : dishid) {
            list.add(dao.getDishesById(dishid1));
        }
        request.setAttribute("list", list);
        request.setAttribute("table", Odao.getTableById(table));
        request.getRequestDispatcher("ConfirmOrder.jsp").forward(request, response);
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
