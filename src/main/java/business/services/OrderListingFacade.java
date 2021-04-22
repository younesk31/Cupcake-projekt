package business.services;

import business.entities.OrderListing;
import business.exceptions.UserException;
import business.persistence.Database;
import business.persistence.OrderMapper;

import java.util.List;

public class OrderListingFacade {
    OrderMapper orderMapper;

    public OrderListingFacade(Database database) {
        orderMapper = new OrderMapper(database);
    }

    public List<OrderListing> getOrdersByUserID(int user_Id) throws UserException {
        return orderMapper.getOrdersByUserID(user_Id);
    }

    public int deleteOrder(int order_id) throws UserException{
        return orderMapper.deleteOrder(order_id);
    }
}
