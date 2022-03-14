
package Control;

import DAO.AddOderDAO;
import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Category_Dish;
import Model.Dish;
import Model.Order_Dish;
import Model.Table;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FixOrderControl extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     response.setContentType("text/html;charset=UTF-8");
        String orderId = request.getParameter("orderId");
        AddOderDAO dao = new AddOderDAO();
        Table t = dao.getTableByOrderID(orderId);
        List<Dish> listD = new ArrayList<>();
        DishDAO dishDAO = new DishDAO();
        List<Order_Dish> list= dao.getOrder_Dish(orderId); // load current dish in orderid
        for (int i = 0; i < list.size(); i++) {
            listD.add(dishDAO.getDishesById(list.get(i).getDishId()+""));
        }
        CategoryDAO cate_daoo = new CategoryDAO();
        List<Category> listC = cate_daoo.getAllCategory(); 
        
        List<Category_Dish> listOtherDishes = new ArrayList<>(); // contain cate and coresspond dish
        for (int i = 0; i < listC.size(); i++) {
            listOtherDishes.add(new Category_Dish(listC.get(i).getId() + "", listC.get(i).getName(),
                    dishDAO.getDishesByCategoryExcept((listC.get(i).getId() + ""), list)));
        }
        request.setAttribute("orderId", orderId);
        request.setAttribute("table", t);
        request.setAttribute("listDish", listD);
        request.setAttribute("listD", list);
        request.setAttribute("listOtherDishes", listOtherDishes);
        request.getRequestDispatcher("FixOrder.jsp").forward(request, response);
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String[] dishedid = request.getParameterValues("chose");
        String[] dishesid = request.getParameterValues("chosee");
        String orderId =request.getParameter("orderId");
        String table = request.getParameter("table");
        List<Dish> list = new ArrayList<>();
        List<Order_Dish> listO = new ArrayList<>();
        AddOderDAO dao = new AddOderDAO();
        DishDAO daoo = new DishDAO();
        
        AddOderDAO Odao = new AddOderDAO();
        if (dishedid!=null) {
            for (String dishid1 : dishedid) {
                listO.add(dao.getOrder_Dish(orderId, dishid1)) ;
                list.add(daoo.getDishesById(dishid1));
            }
        }
        if (dishesid != null) {
            for (String dishid1 : dishesid) {
                Dish d = daoo.getDishesById(dishid1);
                int did = Integer.parseInt(dishid1);
                int oid = Integer.parseInt(orderId);
                listO.add(new Order_Dish(oid,did , 1, d.getPrice()));
                list.add(d);
            }
            
        } 
        if(dishedid == null && dishesid == null){
            request.setAttribute("message", "No dish is chosen.");
        }
            
            request.setAttribute("orderId", orderId);
            request.setAttribute("checked", "order");
            request.setAttribute("list", list);
            request.setAttribute("listO", listO);
            request.setAttribute("table", Odao.getTableById(table));
            request.getRequestDispatcher("ConfirmFixOrder.jsp").forward(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
