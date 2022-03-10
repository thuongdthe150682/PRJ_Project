package DAO;

import Model.Reservation;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReserveDAO extends BaseDAO {

    public List<Reservation> getAllAccount() {
        List<Reservation> list = new ArrayList<>();
        try {
            String query = "select * from Reservation";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Reservation(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
            return list;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public void addReservation(Reservation r) {
        try {
            String query = "insert into Reservation (Name, [Date],"
                    + " [Time], Phone,People , [Message],"
                    + " [Status]) values (?,?,?,?,?,?,0)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, r.getName());
            ps.setString(2, r.getDate());
            ps.setString(3, r.getTime());
            ps.setString(4, r.getPhone());
            ps.setString(5, r.getNumber_People());
            ps.setString(6, r.getMesage());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
//    public static void main(String[] args) {
//        ReserveDAO dao = new ReserveDAO();
//        List<Reservation> list = dao.getAllAccount();
//        System.out.println(list.size());
//    }
}
