
package Model;

import java.sql.Date;
import java.sql.Time;


public class Reservation {
    private int Id;
    private Date date;
    private Time time;
    private String Phone;
    private int Number_People;
    private String mesage;

    public Reservation() {
    }

    public Reservation(int Id, Date date, Time time, String Phone, int Number_People, String mesage) {
        this.Id = Id;
        this.date = date;
        this.time = time;
        this.Phone = Phone;
        this.Number_People = Number_People;
        this.mesage = mesage;
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

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public int getNumber_People() {
        return Number_People;
    }

    public void setNumber_People(int Number_People) {
        this.Number_People = Number_People;
    }

    public String getMesage() {
        return mesage;
    }

    public void setMesage(String mesage) {
        this.mesage = mesage;
    }

    @Override
    public String toString() {
        return "Reservation{" + "Id=" + Id + ", date=" + date + ", time=" + time + ", Phone=" + Phone + ", Number_People=" + Number_People + ", mesage=" + mesage + '}';
    }
    
    
}
