
package Model;


public class Dish {
    private int Id;
    private String Name;
    private String Description;
    private float Price;
    private String Image;
    private boolean Status;
    private int Category_Id;
    private String quantity;
    
    public Dish() {
    }

    public Dish(int Id, String Name, String Description, float Price, String Image, boolean Status, int Category_Id) {
        this.Id = Id;
        this.Name = Name;
        this.Description = Description;
        this.Price = Price;
        this.Image = Image;
        this.Status = Status;
        this.Category_Id = Category_Id;
    }
    
    public Dish(int Id, String Name, String Description, float Price, String Image, boolean Status, int Category_Id, String quantity) {
        this.Id = Id;
        this.Name = Name;
        this.Description = Description;
        this.Price = Price;
        this.Image = Image;
        this.Status = Status;
        this.Category_Id = Category_Id;
        this.quantity = quantity;
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public int getCategory_Id() {
        return Category_Id;
    }

    public void setCategory_Id(int Category_Id) {
        this.Category_Id = Category_Id;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    
    
    @Override
    public String toString() {
        return "Dish{" + "Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + ", Image=" + Image + ", Status=" + Status + ", Category_Id=" + Category_Id + '}';
    }
    
}
