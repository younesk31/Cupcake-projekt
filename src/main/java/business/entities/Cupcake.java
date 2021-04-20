package business.entities;

public class Cupcake {
    private Bottom bottom;
    private Top top;
    private int quantity;
    private double price;

    public Cupcake(Bottom bottom, Top top, int quantity) {
        this.bottom = bottom;
        this.top = top;
        this.quantity = quantity;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public void setBottom(Bottom bottom) {
        this.bottom = bottom;
    }

    public Top getTop() {
        return top;
    }

    public void setTop(Top top) {
        this.top = top;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return (this.bottom.getPrice() + this.top.getPrice()) * quantity;
    }

}
