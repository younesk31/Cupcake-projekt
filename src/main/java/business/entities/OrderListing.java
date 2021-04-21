package business.entities;

import java.security.PrivateKey;
import java.sql.Timestamp;
import java.util.List;

public class OrderListing {


    private int order_id;
    private int user_id;
    private String email;
    private List<Cupcake> cupcakeList;
    private double orderTotal;
    private Timestamp created;

    public OrderListing(int order_id, int user_id, String email, List<Cupcake> cupcakeList, double orderTotal, Timestamp created) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.email = email;
        this.cupcakeList = cupcakeList;
        this.orderTotal = orderTotal;
        this.created = created;
    }

    public int getOrder_id() {
        return order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getEmail() {
        return email;
    }

    public List<Cupcake> getCupcakeList() {
        return cupcakeList;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public Timestamp getCreated() {
        return created;
    }
}
