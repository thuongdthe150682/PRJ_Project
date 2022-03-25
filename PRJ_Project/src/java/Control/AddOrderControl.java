/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddOrderControl extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AddOderDAO ordao = new AddOderDAO();
        CategoryDAO cate_daoo = new CategoryDAO();
        List<Category> listC = cate_daoo.getAllCategory();
        DishDAO dao = new DishDAO();
        List<Category_Dish> list = new ArrayList<>();
        for (int i = 0; i < listC.size(); i++) {
            list.add(new Category_Dish(listC.get(i).getId() + "", listC.get(i).getName(),
                    dao.getDishesByCategory(listC.get(i).getId() + "")));
        }
//        String tableid = request.getParameter("tableid");
//        request.setAttribute("table", ordao.getTableById(tableid));
        List<Table> listT = ordao.getAllTable();
        request.setAttribute("listT", listT);
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
        String[] dishid = request.getParameterValues("chose");
        String[] price = request.getParameterValues("price");
        String[] quantity = request.getParameterValues("quantity");
        String table = request.getParameter("table");
        List<Dish> list = new ArrayList<>();
        DishDAO dao = new DishDAO();
        AddOderDAO Odao = new AddOderDAO();
        if (dishid != null) {
            for (int i = 0; i < dishid.length; i++) {
                Dish id = dao.getDishesById(dishid[i]);
                id.setPrice(Float.parseFloat(price[i]));
                id.setQuantity(quantity[i]);
                list.add(id);
            }
//            for (String dishid1 : dishid) {
//                list.add(dao.getDishesById(dishid1));
//            }
        }
        if (dishid == null) {
            request.setAttribute("message", "No dish is chosen.");
            request.getRequestDispatcher("Table").forward(request, response);
        } else {
            request.setAttribute("checked", "order");
            request.setAttribute("list", list);
            request.setAttribute("table", Odao.getTableById(table));
            request.getRequestDispatcher("ConfirmOrder.jsp").forward(request, response);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
