
package DAO;

import Model.Dish;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DishDAO extends BaseDAO {
    public List<Dish> getAllDishes(){
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select * from Dishes";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
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
    public List<Dish> getNewDishes(){
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select top 2 * from Dishes\n" +
                            "order by Id desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
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
//    public static void main(String[] args) {
//        DishDAO dao = new DishDAO();
//        List<Dish> list = dao.getAllDishes();
//        System.out.println(list.size());
//                
//    }
}
