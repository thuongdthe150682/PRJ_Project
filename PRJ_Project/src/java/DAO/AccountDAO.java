
package DAO;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AccountDAO extends BaseDAO{

    public List<Account> getAllAccount(){
        List<Account> list = new ArrayList<>();
        try {
            String query = "select * from account";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Account(
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Account_off")));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Account getAnAccount(String Username,String Password ){
        Account account = new Account();
        try {
            String query = "select * from account where Username=? and Password=? ";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Username);
            ps.setString(2, Password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                account = new Account(
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Account_off"));
            }
            return account;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean checkManageAccount(String Username, String Password){
        boolean check=false;
        try {
            String query = "select * from account where Username=? and Password=? and Account_off='manager'";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Username);
            ps.setString(2, Password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                check=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAnAccount("hoanganh", "123@123"));
    }
     
}
