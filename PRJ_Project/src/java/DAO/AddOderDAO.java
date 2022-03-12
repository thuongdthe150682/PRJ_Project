package DAO;

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
            String query = "select * from [Tables]";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Table(rs.getString(1),
                        rs.getString(2),
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
                return new Table(rs.getString(1),
                        rs.getString(2),
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

//    public static void main(String[] args) {
//        AddOderDAO dao = new AddOderDAO();
//        List<Table> list = dao.getAllTable();
//        boolean check = dao.checkFreeTable("1");
//        System.out.println(check);
//    }
}
