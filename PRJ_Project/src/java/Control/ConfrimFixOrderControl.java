/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.AddOderDAO;
import Model.Dish;
import Model.Order_Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        String []id = request.getParameter("sid").trim().split("\\s+");
        String []price = request.getParameter("price").trim().split("\\s+");
        String []quantity = request.getParameter("quantity").trim().split("\\s+");
        
        if (id != null) {
            for (int i = 0; i < id.length; i++) {
                check = true;
                for (int j = 0; j < list.size(); j++) {
                    int idd = Integer.parseInt(id[i].trim());
                    if (idd == list.get(j).getDishId()) {
                        dao.updateOrder_Dish(orderId, id[i] + "", price[i] + "", quantity[i] + "");
                        check = false;
                        break;
                    }
                }
                if (check) {
                    dao.addOrder_Dish(orderId, id[i] + "", price[i] + "", quantity[i] + "");
                }
            }
            for (int i = 0; i < list.size(); i++) {
                check = true;

                for (String id1 : id) {
                    int idd = Integer.parseInt(id1.trim());
                    if (idd == list.get(i).getDishId()) {
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
//            request.setAttribute("message", "Order has been fix.");
        if (request.getParameter("paid").equals("yes")) {
            String orderid = request.getParameter("orderId");
            AddOderDAO daoo = new AddOderDAO();
            daoo.finishOrder(orderid);
            response.sendRedirect("Table");
        }
        request.getRequestDispatcher("Table").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
