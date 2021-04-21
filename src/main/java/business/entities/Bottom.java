package business.entities;

public class Bottom {
    private int bottomId;
    private String name;
    private double price;
    //Soren Hacker! 

    public Bottom(int bottomId, String name, double price) {
        this.bottomId = bottomId;
        this.name = name;
        this.price = price;
    }

    public int getBottomId() {
        return bottomId;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }
}
