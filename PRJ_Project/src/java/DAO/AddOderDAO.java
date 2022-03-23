package DAO;

import Model.Dish;
import Model.Order;
import Model.Order_Dish;
import Model.Table;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddOderDAO extends BaseDAO {

    public List<Table> getAllTable() {
        try {
            List<Table> list = new ArrayList<>();
            String query = "select * from [Tables] where [Status]=1";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Table(rs.getString(1),
                        rs.getString(2).trim(),
                        rs.getInt(3)
                ));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public Table getTableById(String id) {
        try {
            String query = "select * from [Tables] where id=? ";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Table(rs.getString(1).trim(),
                        rs.getString(2).trim(),
                        rs.getInt(3)
                );
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public boolean checkFreeTable(String id) {
        try {
            String query = "select [Status] from [Tables] where id=? ";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == 1) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return false;
    }

    // add and update using table
    public void addAnOrderByTableId(String id) {
        try {
            String query = "insert into Orders ([Date], [StartTime],[Table])\n"
                    + "  values (GETDATE(),CONVERT(VARCHAR(8), GETDATE(), 108), ?);\n"
                    + "  update [Tables] set [Status] = 0 where [Id]=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void updateOrder_Dish(String orderid, String dishid, String price, String quantity) {
        try {
            String query = "update Order_Dish set Quantity=?, Price=? where\n"
                    + "    DishID=? and OrderID=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, quantity);
            ps.setString(2, price);
            ps.setString(3, dishid);
            ps.setString(4, orderid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void addOrder_Dish(String orderid, String dishid, String price, String quantity) {
        try {
            String query = "insert into Order_Dish \n"
                    + "  (OrderID,DishID,Quantity,Price) values (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderid);
            ps.setString(2, dishid);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void deleteOrder_Dish(String orderid, String dishid) {
        try {
            String query = "delete from Order_Dish\n"
                    + "  where OrderID=? and DishID=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderid);
            ps.setString(2, dishid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    // get order not finish
    public String getCurrentOrderByTableId(String id) {
        try {
            String query = "  select * from Orders where [Table] = ? and EndTime is null";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public void addToOrder_Dish(String orderID, String dishId, String quantity, String price) {
        try {
            String query = " insert into Order_Dish (OrderID,DishID,Quantity,Price)values\n"
                    + "  (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, dishId);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }

    }

    public List<Order_Dish> getOrder_Dish(String orderID) {
        try {
            String query = "select * from Order_Dish\n"
                    + "where OrderID=?";
            List<Order_Dish> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order_Dish(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getFloat(4)));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
    public Order_Dish getOrder_Dish(String orderID,String dishId) {
        try {
            String query = "select * from Order_Dish where OrderID=? and dishid=?";
            List<Order_Dish> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, dishId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order_Dish(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getFloat(4));
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
    public void deleteAnOrder(String Orderid ,String tableID){
         try {
            // delete in table Orders
            String query1 = "delete from Orders where Id=?";
            PreparedStatement ps = connection.prepareStatement(query1);
            ps.setString(1, Orderid);
            ps.executeUpdate();
            // delete in Order_dish
            String query2 = "  delete from Order_Dish where OrderID=? ";
            ps = connection.prepareStatement(query2);
            ps.setString(1, Orderid);
            ps.executeUpdate();
            
            // update free table
            String query3 = "update [Tables] set [Status] = 1 where [Id]= ?";
                ps = connection.prepareStatement(query3);
                ps.setString(1, tableID);
                ps.executeUpdate();
            
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
    public void finishOrder(String orderId) {
        try {
            // set end time
            String query1 = "update Orders set EndTime = CONVERT(VARCHAR(8), GETDATE(), 108)\n"
                    + "  where id =?";
            PreparedStatement ps = connection.prepareStatement(query1);
            ps.setString(1, orderId);
            ps.executeUpdate();
            // free table
            String query2 = "select * from Orders where id=?";
            ps = connection.prepareStatement(query2);
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String tableid = rs.getString(4);
                String query3 = "update [Tables] set [Status] = 1 where [Id]= ?";
                ps = connection.prepareStatement(query3);
                ps.setString(1, tableid);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public Table getTableByOrderID(String orderID) {
        try {

            String query = "select * from Orders where id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String tableid = rs.getString(4);
                String query3 = "select * from [Tables] where [Id]= ?";
                ps = connection.prepareStatement(query3);
                ps.setString(1, tableid);
                ResultSet rss = ps.executeQuery();
                while (rss.next()) {
                    return new Table(rss.getString(1).trim(),
                            rss.getString(2).trim(),
                            rss.getInt(3));
                }
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
    public List<Order> getAllOrders(){
        try {
            String query = "select * from Orders order by [date] desc , [Table] asc,[starttime] asc";
            List<Order> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String status = "0";
                if(rs.getString(5)!= null){
                    status= "1" ;
                }
                list.add(new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getTime(3),
                        rs.getString(4), status));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        AddOderDAO dao = new AddOderDAO();
//        List<Table> list = dao.getAllTable();
//        boolean check = dao.checkFreeTable("1");
//        String orderId = dao.getCurrentOrderByTableId("1");
//        Table t  = dao.getTableByOrderID("5");
//        //dao.addToOrder_Dish("6", "1", "1", "30");
//        dao.updateOrder_Dish("6", "5", "3", "60");
//        List<Order_Dish> listt = dao.getOrder_Dish("6");
//        System.out.println(listt);
//        List<Order_Dish> list= dao.getOrder_Dish("6");
//        System.out.println(list.size());
//        System.out.println(list.get(0).getDishId()+" "+list.get(1).getDishId());
//        DishDAO dishDAO = new DishDAO();
//        List<Dish> listt= dishDAO.getDishesByCategoryExcept("1", list);
//        List<Dish> listtt= dishDAO.getDishesByCategory("1");
//        System.out.println(listtt.get(0).getId()+" "+listtt.get(1).getId());
System.out.println(dao.getAllOrders().get(13));
            System.out.println(dao.getAllOrders().size());
    }
}
