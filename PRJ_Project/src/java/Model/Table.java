
package Model;


public class Table {
    private String Id;
    private String Name;
    private int status;

    public Table() {
    }

    public Table(String Id, String Name, int status) {
        this.Id = Id;
        this.Name = Name;
        this.status = status;
    }

    

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Table{" + "Id=" + Id + ", Name=" + Name + ", status=" + status + '}';
    }

    
    
}
