package Control;

import DAO.AddOderDAO;
import DAO.BenefitDAO;
import DAO.DishDAO;
import Model.Dish;
import Model.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BenefitControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BenefitDAO dao = new BenefitDAO();
        AddOderDAO odao = new AddOderDAO();
        List<Dish> list = dao.getBestSeller();
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "revenue");

        List<Order> listY = dao.getOrdersTodayNotYet();
        List<Order> listF = dao.getOrdersTodayFinish();
        
        DishDAO ddao = new DishDAO();
        if (list != null) {
            for (int i = 0; i < listY.size(); i++) {
                listY.get(i).setListOD(odao.getOrder_Dish(listY.get(i).getId() + ""));
                for (int j = 0; j < listY.get(i).getListOD().size(); j++) {
                    listY.get(i).getListOD().get(j).setName(ddao.getDishesById(
                            listY.get(i).getListOD().get(j).getDishId()+"").getName());
                }
            }
        }
        if (listF != null) {
            for (int i = 0; i < listF.size(); i++) {
                listF.get(i).setListOD(odao.getOrder_Dish(listF.get(i).getId() + ""));
                for (int j = 0; j < listF.get(i).getListOD().size(); j++) {
                    listF.get(i).getListOD().get(j).setName(ddao.getDishesById(
                            listF.get(i).getListOD().get(j).getDishId()+"").getName());
                }
            }
        }
        String[][] orders = dao.getOrdersTodasy();
        request.setAttribute("list", list);
        request.setAttribute("listY", listY);
        request.setAttribute("listF", listF);
        request.getRequestDispatcher("Revenue.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date = request.getParameter("date");
        BenefitDAO dao = new BenefitDAO();
        AddOderDAO odao = new AddOderDAO();
        List<Dish> list = dao.getBestSeller();
        request.setAttribute("active", "manage");
        request.setAttribute("checked", "revenue");
         request.setAttribute("search", date);
        List<Order> listY = dao.getOrdersBydayNotFinah(date);
        List<Order> listF = dao.getOrdersBydayFinished(date);
        
        DishDAO ddao = new DishDAO();
        if (list != null) {
            for (int i = 0; i < listY.size(); i++) {
                listY.get(i).setListOD(odao.getOrder_Dish(listY.get(i).getId() + ""));
                for (int j = 0; j < listY.get(i).getListOD().size(); j++) {
                    listY.get(i).getListOD().get(j).setName(ddao.getDishesById(
                            listY.get(i).getListOD().get(j).getDishId()+"").getName());
                }
            }
        }
        if (listF != null) {
            for (int i = 0; i < listF.size(); i++) {
                listF.get(i).setListOD(odao.getOrder_Dish(listF.get(i).getId() + ""));
                for (int j = 0; j < listF.get(i).getListOD().size(); j++) {
                    listF.get(i).getListOD().get(j).setName(ddao.getDishesById(
                            listF.get(i).getListOD().get(j).getDishId()+"").getName());
                }
            }
        }
        String[][] orders = dao.getOrdersTodasy();
        request.setAttribute("list", list);
        request.setAttribute("listY", listY);
        request.setAttribute("listF", listF);
        request.getRequestDispatcher("Revenue.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
