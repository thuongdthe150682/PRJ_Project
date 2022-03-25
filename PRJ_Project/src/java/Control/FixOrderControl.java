
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
            listD.add(dao.getDish(orderId, list.get(i).getDishId()+""));
        }
        float total = 0;
        String s ="";
        String s1 ="";
        String s2 ="";
        float[] payment = new float[list.size()];
        for (int i = 0; i < list.size(); i++) {
            payment[i] = list.get(i).getQuantity() * list.get(i).getPrice();
            total += payment[i];
            s+=list.get(i).getDishId()+" ";
            s1+=list.get(i).getPrice()+" ";
            s2+=list.get(i).getQuantity()+" ";
            
        }
        
        
        CategoryDAO cate_daoo = new CategoryDAO();
        List<Category> listC = cate_daoo.getAllCategory(); 
        
        List<Category_Dish> listOtherDishes = new ArrayList<>(); // contain cate and coresspond dish
        for (int i = 0; i < listC.size(); i++) {
            listOtherDishes.add(new Category_Dish(listC.get(i).getId() + "", listC.get(i).getName(),
                    dishDAO.getDishesByCategoryExcept((listC.get(i).getId() + ""), list)));
        }
        request.setAttribute("sid", s);
        request.setAttribute("price", s1);
        request.setAttribute("quantity", s2);
        request.setAttribute("total", total);
        request.setAttribute("payment", payment);
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
        String[] price = request.getParameterValues("price");
        String[] quantity = request.getParameterValues("quantity");
        String orderId =request.getParameter("orderId");
        String table = request.getParameter("table");
        List<Dish> list = new ArrayList<>();
        List<Dish> listO = new ArrayList<>();
        AddOderDAO dao = new AddOderDAO();
        DishDAO daoo = new DishDAO();
        List<Order_Dish> listt= new ArrayList<>();
        AddOderDAO Odao = new AddOderDAO();
        String s ="";
        String s1 ="";
        String s2 ="";
        if (dishedid!=null) {
            for (int i = 0; i < dishedid.length; i++) {
                Dish id = daoo.getDishesById(dishedid[i]);
                id.setPrice(Float.parseFloat(price[i]));
                id.setQuantity(quantity[i]);
                list.add(id);
                s+=list.get(i).getId()+" ";
            s1+=list.get(i).getPrice()+" ";
            s2+=list.get(i).getQuantity()+" ";
            
                listt.add(new Order_Dish(Integer.parseInt(orderId), id.getId(), Integer.parseInt(id.getQuantity()) , id.getPrice()));
            }
        }
        
        if (dishesid != null) {
            for (String dishid1 : dishesid) {
                Dish d = daoo.getDishesById(dishid1);
                int did = Integer.parseInt(dishid1);
                int oid = Integer.parseInt(orderId);
//                listO.add(new Order_Dish(oid,did , 1, d.getPrice()));
                list.add(d);
            }
            
        } 
        if(dishedid == null && dishesid == null){
            request.setAttribute("message", "No dish is chosen.");
        }
          List<Dish> alist = daoo.getAllDishes();
          for (Dish dish : alist) {
              boolean check =true;
              for (Dish dish1 : list) {
                  if(dish1.getId()== dish.getId()){
                      check =false;
                      break;
                  }
              }
             if(check){
                 listO.add(dish);
             }
        }
          float total = 0;
        float[] payment = new float[list.size()];
        for (int i = 0; i < list.size(); i++) {
            payment[i] =  Float.parseFloat(list.get(i).getQuantity()) * list.get(i).getPrice();
            total += payment[i];
//            listD.add(ddao.getDishesById(list.get(i).getDishId() + ""));
        }
        DishDAO dishDAO = new DishDAO();
        
        CategoryDAO cate_daoo = new CategoryDAO();
        List<Category> listC = cate_daoo.getAllCategory(); 
        List<Category_Dish> listOtherDishes = new ArrayList<>(); // contain cate and coresspond dish
        for (int i = 0; i < listC.size(); i++) {
            listOtherDishes.add(new Category_Dish(listC.get(i).getId() + "", listC.get(i).getName(),
                    dishDAO.getDishesByCategoryExcept((listC.get(i).getId() + ""), listt)));
        }
        
            request.setAttribute("sid", s);
        request.setAttribute("price", s1);
        request.setAttribute("quantity", s2);
            request.setAttribute("payment", payment);
            request.setAttribute("total", total);
            request.setAttribute("orderId", orderId);
            request.setAttribute("checked", "order");
            request.setAttribute("listDish", list);
            request.setAttribute("listD", listt);
            request.setAttribute("listOtherDishes", listOtherDishes);
            request.setAttribute("table", Odao.getTableById(table));
            request.getRequestDispatcher("FixOrder.jsp").forward(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
