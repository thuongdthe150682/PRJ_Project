package DAO;

import Model.Account;
import Model.Staff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO extends BaseDAO {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
     
        try {
            String query = "select * from account";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getString(1).trim(),
                        rs.getString(2).trim(),
                        rs.getInt(3)));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account getAnAccount(String Username, String Password) {
        Account account = null;
        try {
            String query = "select * from account where Username=? and [Password]=? ";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Username);
            ps.setString(2, Password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account(
                        rs.getString(1).trim(),
                        rs.getString(2).trim(),
                        rs.getInt(3));
            }
            return account;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account getAnAccount(String Username) {
        Account account = null;
        try {
            String query = "select * from account where Username=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account(
                        rs.getString(1).trim(),
                        rs.getString(2).trim(),
                        rs.getInt(3));
            }
            return account;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addAccount(String username, String password, String isManager, List<Account> list) {
        boolean check;
        try {
            check = true;
            String query = "insert into Account (Username,[Password],IsManage)\n"
                    + "  values(?,?,?)";
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getUsername().trim().equals(username.trim())) {
                    check = false;
                    System.out.println(check);
                    break;
                }
            }
            if (check) {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, isManager);
                ps.executeUpdate();
            }
            return check;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return true;
    }

    public void updateAccount(String username, String password, String isManager) {
        try {
            String query = "update Account ,[Password]=? , IsManage=?\n"
                    + "  where Username=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, isManager);
            ps.setString(3, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void deleteAccount(String username) {
        try {
            String query = "delete from Account where Username=?";
            {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, username);
                ps.executeUpdate();

            }
        } catch (SQLException e) {
            e.getStackTrace();
        }

    }

    public Staff getStaffByUserName(String user) {
        try {

            String query = "select * from Staff where UserName = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Staff(
                        rs.getString(1).trim(),
                        rs.getString(2).trim(),
                        rs.getString(3).trim(),
                        rs.getDate(4),
                        rs.getString(5).trim(),
                        rs.getString(6).trim());
            }

        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public void updateStaff(String username, String firstName, String lastName, String date,
            String address, String phone) {
        try {
            String query = "update Staff set FirstName=?, LastName=?, DOB=?, [Address]=?, Phone=?\n"
                    + " where UserName=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, date);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.setString(6, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void addStaff(String username, String firstName, String lastName, String date,
            String address, String phone) {
        try {
            String query = " insert into Staff (UserName,FirstName,LastName,DOB,[Address],Phone)\n"
                    + " values(?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, date);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void deleteStaff(String user) {
        try {
            String query = "delete from Staff where UserName=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
//    public static void main(String[] args) {
//        AccountDAO dao = new AccountDAO();
//        System.out.println(dao.getAllAccount());
//        System.out.println(dao.addAccount("ha123", "123", "1", dao.getAllAccount()));
//    }
}
