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
            String query = "select * from Dishes where [Status] = 1";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
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
    public List<Dish> getAllPauseDishes() {
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select * from Dishes where [Status] = 0";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
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
            String query = "select top 2 * from Dishes where [Status]=1\n"
                    + "order by Id desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
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
                    + "where [Status]=1 and CategoryId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
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
    public List<Dish> getPauseDishesByCategory(String id) {
        List<Dish> list = new ArrayList<>();
        try {
            String query = "select * from Dishes\n"
                    + "where [Status]=0 and CategoryId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
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
                    + "where[Status]=1 and CategoryId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            int check;
            while (rs.next()) {
                check = 0;
                for (int i = 0; i < list.size(); i++) {
                    if (rs.getInt(1) == list.get(i).getDishId()) {
                        check += 1;
                    }
                }
                //   System.out.println(check);
                if (check == 0) {
                    listD.add(new Dish(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getFloat(4),
                            rs.getString(5),
                            rs.getBoolean(6),
                            rs.getInt(7)
                    ));
                }
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
                        rs.getFloat(4),
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
    public Dish getLastDish() {

        try {
            String query = "select top 1 * from Dishes order by id desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Dish(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
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

    public void updateDish(String id, String name, String description, String price, String image,
            String status, String category) {
        try {
            String query = " update Dishes set [Name] = ? , [Description]= ?\n"
                    + "  ,Price=? ,[Image]=?, [Status]=?,CategoryID=? where Id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, price);
            ps.setString(4, image);
            ps.setString(5, status);
            ps.setString(6, category);
            ps.setString(7, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void addDish(String name, String description, String price, String image,
            String status, String category) {
        try {
            String query = " insert into Dishes (Name,[Description],Price,[Image],[Status],CategoryID)\n"
                    + "  values (?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, price);
            ps.setString(4, image);
            ps.setString(5, status);
            ps.setString(6, category);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
    public void deleteDish(String id) {
        try {
            String query = "delete Dishes where id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
    
//    public static void main(String[] args) {
//        DishDAO dao = new DishDAO();
//        List<Dish> list = dao.getAllDishes();
//        AddOderDAO daoo = new AddOderDAO();
//        list = dao.getDishesByCategoryExcept("1", daoo.getOrder_Dish("6"));
//        System.out.println(list.size());
//                
//    }
}
