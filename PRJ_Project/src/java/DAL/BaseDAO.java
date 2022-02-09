
package DAL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class BaseDAO<T> {
   protected Connection connection;
   public BaseDAO()
   {
       try {
           String user = "sa";
           String pass = "123456";
           String url = "jdbc:sqlserver://localhost:1433;databaseName=StudentLabb3";
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           connection = DriverManager.getConnection(url, user, pass);
       } catch (ClassNotFoundException | SQLException ex) {
           Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
   
   public abstract ArrayList<T> getStudents();
   
}
