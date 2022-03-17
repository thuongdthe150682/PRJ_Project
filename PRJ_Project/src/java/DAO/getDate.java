package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class getDate extends BaseDAO {

    public String getDate() {
        String dateFormat = "MM-dd-yyyy";
        DateFormat df = new SimpleDateFormat(dateFormat);
        df.setLenient(false);
        LocalDateTime current = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
        String now = current.format(formatter);
        return now;
    }

    public String getDateBySQL() {
        try {
            String query = "select CONVERT(VARCHAR(10),GETDATE(),101)";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }
}
