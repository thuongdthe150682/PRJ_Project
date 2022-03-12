
package Model;

import java.util.List;


public class Category_Dish {
    private String Id;
    private String Name;
    private List<Dish> list;

    public Category_Dish() {
    }

    public Category_Dish(String Id, List<Dish> list) {
        this.Id = Id;
        this.list = list;
    }

    public Category_Dish(String Id, String Name, List<Dish> list) {
        this.Id = Id;
        this.Name = Name;
        this.list = list;
    }
    

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public List<Dish> getList() {
        return list;
    }

    public void setList(List<Dish> list) {
        this.list = list;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String toString() {
        return "Category_Dish{" + "Id=" + Id + ", Name=" + Name + ", list=" + list + '}';
    }

   
}
