
package DAO;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CategoryDAO extends BaseDAO {
    public List<Category> getAllCategory(){
        List<Category> list = new ArrayList<>();
        try {
            String query = "select *from Category";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(
                        rs.getInt(1),
                        rs.getString(2)
                ));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
