/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.AddOderDAO;
import Model.Order_Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ConfrimFixOrderControl extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      String tableId = request.getParameter("tableID");
        String orderId = request.getParameter("orderId");
        AddOderDAO dao = new AddOderDAO();
        dao.deleteAnOrder(orderId, tableId);
        request.setAttribute("message", "Order has been delete.");
        request.getRequestDispatcher("Table").forward(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        AddOderDAO dao = new AddOderDAO();
        List<Order_Dish> list = dao.getOrder_Dish(orderId);
        String idTable = request.getParameter("table");
        boolean check = true;
        if (!dao.checkFreeTable(idTable)) {
            String[] id = request.getParameterValues("id");
            String[] quantity = request.getParameterValues("quantity");
            String[] price = request.getParameterValues("price");
            if (id != null) {
                for (int i = 0; i < id.length; i++) {
                    check = true;
                    for (int j = 0; j < list.size(); j++) {
                        int idd = Integer.parseInt(id[i]);
                        if (idd==list.get(j).getDishId()) {
                            dao.updateOrder_Dish(orderId, id[i], price[i], quantity[i]);
                            check = false;
                            break;
                        }
                    }
                    if (check) {
                        dao.addOrder_Dish(orderId, id[i], price[i], quantity[i]);
                    }
                }
                for (int i = 0; i < list.size(); i++) {
                    check = true;
                    
                    for (String id1 : id) {
                        int idd= Integer.parseInt(id1);
                        if (idd==list.get(i).getDishId()) {
                            check = false;
                            break;
                        }
                    }
                    if (check) {
                        dao.deleteOrder_Dish(orderId, list.get(i).getDishId() + "");
                    }
                }
            }
//            request.setAttribute("id", id);
//            request.setAttribute("price", price);
//            request.setAttribute("quantity", quantity);
//            request.setAttribute("idTable", idTable);
//            request.setAttribute("orderId", orderId);
//            request.setAttribute("aa", id.length - list.size());
//            request.getRequestDispatcher("check.jsp").forward(request, response);
            request.setAttribute("message", "Order has been fix.");
            request.getRequestDispatcher("Table").forward(request, response);
        }
            else {
            request.setAttribute("idTable", idTable);
            request.setAttribute("message", "Order has finished.");
            request.getRequestDispatcher("Table").forward(request, response);
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
