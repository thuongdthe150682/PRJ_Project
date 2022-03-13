package DAO;

import Model.Dish;
import Model.Order_Dish;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DishDAO extends BaseDAO {

    public List<Dish> getAllDishes() {
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select * from Dishes";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Dish> getNewDishes() {
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select top 2 * from Dishes\n"
                    + "order by Id desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Dish> getDishesByCategory(String id) {
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select * from Dishes\n"
                    + "where CategoryId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
             e.getStackTrace();
        }
        return null;
    }
    public List<Dish> getDishesByCategoryExcept(String id, List<Order_Dish> list) {
        List<Dish> listD = new ArrayList<>();
        try {
            String query = "select * from Dishes\n"
                    + "where CategoryId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            boolean check ;
            while (rs.next()) {
                check = true;
                for (int i = 0; i < list.size(); i++) {
                    if(rs.getString(1).equals(list.get(i).getDishId())){
                        check=false;
                        break;
                    }
                }
                if(check) listD.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7)
                ));
            }
            return listD;
        } catch (SQLException e) {
             e.getStackTrace();
        }
        return null;
    }

    public Dish getDishesById(String id) {
        
        try {
            String query = "select * from Dishes where Id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getInt(7)
                );
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
//    public static void main(String[] args) {
//        DishDAO dao = new DishDAO();
//        List<Dish> list = dao.getAllDishes();
//        System.out.println(list.size());
//                
//    }
}
