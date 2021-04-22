package business.persistence;

import business.entities.Bottom;
import business.entities.Cupcake;
import business.entities.OrderListing;
import business.entities.Top;
import business.exceptions.UserException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {


    private Database database;

    public OrderMapper(Database database) {
        this.database = database;
    }



    public List<OrderListing> getOrdersByUserID(int user_Id) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT o.*, u.email FROM orders o JOIN users u ON o.user_id = u.user_id WHERE u.user_id = ?";
            List<OrderListing> orderListings = new ArrayList<>();

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, user_Id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {

                    int order_id = rs.getInt("order_id");
                    Timestamp created = rs.getTimestamp("created");
                    double orderTotal = rs.getDouble("total");
                    String email = rs.getString("email");

                    OrderListing orderListing = new OrderListing(order_id,user_Id,email,getOrderLine(order_id),orderTotal,created);

                    orderListings.add(orderListing);
                }

                return orderListings;

            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public List<Cupcake> getOrderLine(int order_id) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "select ol.order_id, ol.quantity, t.name topping, t.price, t.toppings_id, b.name bottom, b.price, b.bottom_id  from orderline ol " +
                    "join toppings t on ol.topping_id = t.toppings_id join bottoms b using (bottom_id) WHERE order_id = ?";
            List<Cupcake> cupcakeList = new ArrayList<>();

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, order_id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {

                    int quantity = rs.getInt("quantity");

                    Top top = new Top(rs.getInt("toppings_id"),rs.getString("topping"),rs.getDouble("t.price"));
                    Bottom bottom = new Bottom(rs.getInt("bottom_id"),rs.getString("bottom"), rs.getDouble("b.price"));
                    Cupcake cupcake = new Cupcake(bottom,top,quantity);
                    cupcake.setPrice(top.getPrice() + bottom.getPrice());

                    cupcakeList.add(cupcake);

                }
                return cupcakeList;
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

}
