package DAO;

import Model.Dish;
import Model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenefitDAO extends BaseDAO {

    public List<Dish> getBestSeller() {
        try {

            List<Dish> list = new ArrayList<>();
            String query = "select top 2 * from \n"
                    + "(select COUNT(OrderID) as co ,dishid  from Order_Dish \n"
                    + "group by DishID ) r  inner join Dishes d on r.DishID = d.Id\n"
                    + "where [status]=1 Order by co desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dish(
                        rs.getInt(3),
                        rs.getString(4).trim(),
                        rs.getString(5).trim(),
                        rs.getFloat(6),
                        rs.getString(7).trim(),
                        rs.getBoolean(8),
                        rs.getInt(9)
                ));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Order> getOrdersToday() {
        try {
            List<Order> list = new ArrayList<>();
            String query = "select OrderID,SUM(Quantity*Price) as [Total] from \n"
                    + "(select * from Orders where [date]=CONVERT(VARCHAR(10),GETDATE(),101))r\n"
                    + "inner join Order_Dish d on r.Id=d.OrderID\n"
                    + "group by OrderID";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getFloat(2)));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
    public List<Order> getOrdersByDate(String date) {
        try {
            List<Order> list = new ArrayList<>();
            String query = "select OrderID,SUM(Quantity*Price) as [Total] from \n"
                    + "(select * from Orders where [date]=?)r\n"
                    + "inner join Order_Dish d on r.Id=d.OrderID\n"
                    + "group by OrderID";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getFloat(2)));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
    
    
    public String getDate(){
        try {
            String query = "select GETDATE()";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public List<Order> getOrdersTodayNotYet() {
        try {
            List<Order> list = new ArrayList<>();
            String query = " select * from Orders where [DATE]"
                    + " =CONVERT(VARCHAR(10),GETDATE(),101) and endtime is null";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String status = 1 + "";
                if (rs.getString(5) == null) {
                    status = 0 + "";
                }
                list.add(new Order(rs.getInt(1),
                        rs.getString(4), status));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public List<Order> getOrdersTodayFinish() {
        try {
            List<Order> list = new ArrayList<>();
            String query = " select * from Orders where [DATE]"
                    + " =CONVERT(VARCHAR(10),GETDATE(),101) and endtime is not null";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String status = 1 + "";
                if (rs.getString(5) == null) {
                    status = 0 + "";
                }
                list.add(new Order(rs.getInt(1),
                        rs.getString(4), status));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public List<Order> getOrdersBydayFinished(String date) {
        try {
            List<Order> list = new ArrayList<>();
            String query = "select * from Orders where [DATE] =? and endtime is not null";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String status = 1 + "";
                if (rs.getString(5) == null) {
                    status = 0 + "";
                }
                list.add(new Order(rs.getInt(1),
                        rs.getString(4), status));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public List<Order> getOrdersBydayNotFinah(String date) {
        try {
            List<Order> list = new ArrayList<>();
            String query = "select * from Orders where [DATE] =? and endtime is null";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String status = 1 + "";
                if (rs.getString(5) == null) {
                    status = 0 + "";
                }
                list.add(new Order(rs.getInt(1),
                        rs.getString(4), status));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public String getbenefitOfDay() {
        try {
            String query = "select * from Orders where [DATE] =?";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
        } catch (Exception e) {
        }
        return "";
    }

    //s[0[i]] list of order
    //s[]1[]i list of bill
    public String[][] getOrdersTodasy() {
        String[][] s = null;
        try {
            String query = "with cte as\n"
                    + "(select od.* from Order_Dish od inner join Orders o\n"
                    + "on od.OrderID = o.Id  where o.Date= CONVERT(VARCHAR(10),GETDATE(),101))\n"
                    + "select SUM(Quantity*Price)as bill,orderid from cte\n"
                    + "group by OrderID order by OrderID desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                s[0][i] = rs.getInt(2) + "";
                s[1][i] = rs.getFloat(1) + "";
                i++;
            }
            return s;
        } catch (Exception e) {
        }
        return null;
    }

    public String[][] getOrdersByDay(String date) {
        String[][] s = null;
        try {
            String query = "with cte as\n"
                    + "(select od.* from Order_Dish od inner join Orders o\n"
                    + "on od.OrderID = o.Id  where o.Date=?)\n"
                    + "select SUM(Quantity*Price)as bill,orderid from cte\n"
                    + "group by OrderID order by OrderID desc";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                s[0][i] = rs.getInt(2) + "";
                s[1][i] = rs.getFloat(1) + "";
                i++;
            }
            return s;
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        BenefitDAO dao = new BenefitDAO();
        System.out.println(dao.getBestSeller());
        System.out.println(dao.getOrdersTodayNotYet().size());
        System.out.println(dao.getDate().substring(0, 10));
    }
}
