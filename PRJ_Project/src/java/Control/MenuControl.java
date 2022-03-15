package Control;

import DAO.CategoryDAO;
import DAO.DishDAO;
import Model.Category;
import Model.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MenuControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DishDAO dao = new DishDAO();
        String id = "0";
        String page = "1";
        String search="";
        if(request.getParameter("search")!=null){
            search = request.getParameter("search");
        }
        //String search = request.getParameter("search");
        if (request.getParameter("page") != null) {
           page = request.getParameter("page");
        }
       
        if(request.getParameter("id")!= null){
            id = request.getParameter("id");
        }
        List<Dish> list = dao.getAllDishes();
        List<Dish> listD = dao.getAllDishes(page);
        if("".equals(search) && !"0".equals(id)){
            list = dao.getDishesByCategory(id);
            listD = dao.getDishesByCategory(id, page);
        }
        else if(!"".equals(search) && !"0".equals(id)){
            list = dao.getSearchDishesByCategory(search, id);
            listD = dao.getSearchDishesByCategory(search, id, page);
        }
        else if (!"".equals(search) && "0".equals(id)){
            list = dao.getSearchDishes(search);
            listD =dao.getSearchDishes(search, page);
        }else if("".equals(search) && "0".equals(id)){
            list = dao.getAllDishes();
            listD = dao.getAllDishes(page);
        }
        if(request.getParameter("all")!=null && request.getParameter("all").equals("true")){
            listD=list;
        }
        int total = 0;
        if (list != null) {
            if (list.size() % 2 == 0) {
                total = list.size() / 2;
            } else {
                total = list.size() / 2 + 1;
            }
        }

        CategoryDAO daoc = new CategoryDAO();
        List<Category> listC = daoc.getAllCategory();

        request.setAttribute("page", page);
        request.setAttribute("search", search);
        request.setAttribute("id", id);
        request.setAttribute("listD", list);
        request.setAttribute("list", listD);
        request.setAttribute("total", total);
        request.setAttribute("listC", listC);
        request.setAttribute("active", "menu");
        request.getRequestDispatcher("Menu.jsp").forward(request, response);
        
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
