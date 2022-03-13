package Controller;

import DAO.AddOderDAO;
import DAO.DishDAO;
import Model.Dish;
import Model.Order_Dish;
import Model.Table;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateOrderServlet", urlPatterns = {"/UpdateOrder"})
public class UpdateOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String tablesid = request.getParameter("tableid");
        AddOderDAO tdao = new AddOderDAO();
        Table t = tdao.getTableById(tablesid);
        DishDAO ddao = new DishDAO();
        AddOderDAO dao = new AddOderDAO();
        String orderid = dao.getCurrentOrderByTableId(tablesid);
        List<Order_Dish> list = dao.getOrder_Dish(orderid);
        List<Dish> listD = new ArrayList<>();
        float total = 0;
        float[] payment = new float[list.size()];
        for (int i = 0; i < list.size(); i++) {
            payment[i] = list.get(i).getQuantity() * list.get(i).getPrice();
            total += payment[i];
            listD.add(ddao.getDishesById(list.get(i).getDishId() + ""));
        }
        request.setAttribute("table", t);
        request.setAttribute("listDish", listD);
        request.setAttribute("total", total);
        request.setAttribute("orderId", orderid);
        request.setAttribute("list", list);
        request.setAttribute("payment", payment);
        request.getRequestDispatcher("SeeOrder.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idTable = request.getParameter("table");
        AddOderDAO dao = new AddOderDAO();
        List<Order_Dish> list = dao.getOrder_Dish(idTable)

        if (dao.checkFreeTable(idTable)) {
            String[] id = request.getParameterValues("id");
            String[] quantity = request.getParameterValues("quantity");
            String[] price = request.getParameterValues("price");
            dao.addAnOrderByTableId(idTable);
            String order = dao.getCurrentOrderByTableId(idTable);
            for (int i = 0; i < id.length; i++) {
                dao.addToOrder_Dish(order, id[i], quantity[i], price[i]);
            }
            request.setAttribute("message", "Order has been add.");
            request.getRequestDispatcher("Table.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Table now is not free.");
            request.getRequestDispatcher("Table.jsp").forward(request, response);
        }
        request.getRequestDispatcher("Table.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
