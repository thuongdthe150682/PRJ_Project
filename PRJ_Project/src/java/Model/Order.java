package Model;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public class Order {

    private int Id;
    private Date date;
    private Time Startime;
    private String Table;
    private String Status;
    private Time Endtime;
    private List<Order_Dish> listOD; 
    private float total=0;

    public Order() {
    }

    public Order(int Id, String Table, String Status) {
        this.Id = Id;
        this.Table = Table;
        this.Status = Status;
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

    public Order(int Id,String Status, List<Order_Dish> listOD) {
        this.Id = Id;
        this.Status = Status;
        this.listOD = listOD;
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

    public List<Order_Dish> getListOD() {
        return listOD;
    }

    public void setListOD(List<Order_Dish> listOD) {
        this.listOD = listOD;
        if(listOD!=null){
            for (int i = 0; i < listOD.size(); i++) {
                this.total += listOD.get(i).getPayment();
            }
        }
    }
    public float getTotal(){
        return this.total;
    }
    @Override
    public String toString() {
        return "Order{" + "Id=" + Id + ", date=" + date + ", Startime=" + Startime + ", Table=" + Table + ", Status=" + Status + ", Endtime=" + Endtime + '}';
    }

}
