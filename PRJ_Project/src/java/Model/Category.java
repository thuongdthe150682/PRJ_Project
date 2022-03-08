package Model;

public class Category {

    private int Id;
    private String Name;

    public Category() {
    }

    public Category(int Id, String Name) {
        this.Id = Id;
        this.Name = Name;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String toString() {
        return "Category{" + "Id=" + Id + ", Name=" + Name + '}';
    }

}
