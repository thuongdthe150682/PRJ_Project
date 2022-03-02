
package Model;

import java.sql.Date;
import java.sql.Time;


public class Order {
   private int Id;
   private Date date;
   private Time Startime;
   private String Table;
   private String Status;
   private Time Endtime;

    public Order() {
    }

    public Order(int Id, Date date, Time Startime, String Table, String Status) {
        this.Id = Id;
        this.date = date;
        this.Startime = Startime;
        this.Table = Table;
        this.Status = Status;
    }

    public Order(int Id, Date date, Time Startime, String Table, String Status, Time Endtime) {
        this.Id = Id;
        this.date = date;
        this.Startime = Startime;
        this.Table = Table;
        this.Status = Status;
        this.Endtime = Endtime;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartime() {
        return Startime;
    }

    public void setStartime(Time Startime) {
        this.Startime = Startime;
    }

    public String getTable() {
        return Table;
    }

    public void setTable(String Table) {
        this.Table = Table;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public Time getEndtime() {
        return Endtime;
    }

    public void setEndtime(Time Endtime) {
        this.Endtime = Endtime;
    }

    @Override
    public String toString() {
        return "Order{" + "Id=" + Id + ", date=" + date + ", Startime=" + Startime + ", Table=" + Table + ", Status=" + Status + ", Endtime=" + Endtime + '}';
    }
    
   
}
