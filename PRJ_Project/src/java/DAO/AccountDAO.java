
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
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3)));
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
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3));
            }
            return account;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAnAccount("ha123","ha123@123").toString());
    }
     
}
