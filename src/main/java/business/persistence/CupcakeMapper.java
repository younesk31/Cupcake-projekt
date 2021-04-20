package business.persistence;

import business.entities.Bottom;
import business.entities.Cupcake;
import business.entities.Top;
import business.exceptions.UserException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CupcakeMapper {
    private Database database;


    public CupcakeMapper(Database database)
    {
        this.database = database;
    }



    public Bottom getBottoms(int bottomId) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM bottoms WHERE bottom_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, bottomId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    Bottom bottom = new Bottom(bottomId,name,price);

                    return bottom;
                } else {
                    throw new UserException("Could not validate user");
                }
            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }


    public List<Bottom> getAllBottoms() throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM bottoms";
            List<Bottom> bottomList = new ArrayList<>();

            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int bottomId = rs.getInt("bottom_id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");

                    bottomList.add(new Bottom(bottomId,name,price));

                }
            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
            return bottomList;
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }


    public List<Top> getAllToppings() throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM toppings";
            List<Top> topList = new ArrayList<>();

            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int topId = rs.getInt("toppings_id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");

                    topList.add(new Top(topId,name,price));
                }
            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
            return topList;
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public Top getToppings(int topId) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM toppings WHERE toppings_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, topId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    Top top = new Top(topId,name,price);

                    return top;
                } else {
                    throw new UserException("Could not validate user");
                }
            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public int insertOrder(int user_id, double total, List<Cupcake> cupcakeList) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO orders (user_id, total ) VALUES (?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, user_id);
                ps.setDouble(2,total);

                int rowAffected = ps.executeUpdate();
                ResultSet resultSet = ps.getGeneratedKeys();
                resultSet.next();
                int order_id = resultSet.getInt(1);

                for (Cupcake cupcake : cupcakeList) {
                    insertOrderline(cupcake, order_id);
                }

                return rowAffected;

            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }


    public void insertOrderline(Cupcake cupcake, int order_id) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO orderline (order_id, quantity, topping_id, bottom_id) VALUES (?,?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, order_id);
                ps.setInt(2,cupcake.getQuantity());
                ps.setInt(3, cupcake.getTop().getTopId());
                ps.setInt(4,cupcake.getBottom().getBottomId());

                ps.executeUpdate();

            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public int updateBalance(double amount, int user_id) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "UPDATE users SET balance = ? WHERE user_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setDouble(1, amount);
                ps.setInt(2,user_id);

                int rowAffected = ps.executeUpdate();
                return rowAffected;

            } catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }
}
