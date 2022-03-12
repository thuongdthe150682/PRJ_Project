package DAO;

import Model.Reservation;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReserveDAO extends BaseDAO {

    public List<Reservation> getNotYetReservation() {
        try {
            List<Reservation> list = new ArrayList<>();
            String query = " select * from Reservation where [Status] = 0";
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

    public Reservation getReservationById(String id) {

        try {
            String query = " select * from [Reservation] where ID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Reservation(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public List<Reservation> getDoneReservation() {
        List<Reservation> list = new ArrayList<>();
        try {
            String query = " select * from Reservation where [Status] = 1";
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

    public void updateReservation(String name, String date, String time, String phone,
            String number, String message, String staff, String id) {
        try {
            String query = " update Reservation set [Name] = ?, "
                    + "[Date]=?,[Time]=?, Phone =?,People=?, [Message]=?,"
                    + "[Staff]=?,[Status]=1 where ID=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, time);
            ps.setString(4, phone);
            ps.setString(5, number);
            ps.setString(6, message);
            ps.setString(7, staff);
            ps.setString(8, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
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
