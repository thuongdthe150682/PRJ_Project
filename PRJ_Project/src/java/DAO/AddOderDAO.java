
package DAO;

import Model.Table;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class AddOderDAO extends BaseDAO {
    public List<Table> getAllTable(){
        try {
            List<Table> list = new ArrayList<>();
            String query = "select * from [Tables]";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Table(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
//    public static void main(String[] args) {
//        AddOderDAO dao = new AddOderDAO();
//        List<Table> list = dao.getAllTable();
//        System.out.println(list.get(0));
//    }
}
