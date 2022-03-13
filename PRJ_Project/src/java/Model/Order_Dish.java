
package Model;

public class Order_Dish {
    private int OrderId;
    private int DishId;
    private int quantity;
    private float price;
    

    public Order_Dish() {
    }

    public Order_Dish(int OrderId, int DishId, int quantity, float price) {
        this.OrderId = OrderId;
        this.DishId = DishId;
        this.quantity = quantity;
        this.price = price;
    }

    

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getDishId() {
        return DishId;
    }

    public void setDishId(int DishId) {
        this.DishId = DishId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Order_Dish{" + "OrderId=" + OrderId + ", DishId=" + DishId + ", price=" + price + ", quantity=" + quantity + '}';
    }
    
}
