package web.commands;

import business.entities.OrderListing;
import business.exceptions.UserException;
import business.services.OrderListingFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class UpdateOrderCommand extends CommandProtectedPage {
    private OrderListingFacade orderListingFacade;

    public UpdateOrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        this.orderListingFacade = new OrderListingFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        List<OrderListing> orderListings = orderListingFacade.getOrdersByUserID((Integer)request.getSession().getAttribute("user_id"));
        request.setAttribute("userOrderListings", orderListings);

        try {
            int orderid = Integer.parseInt(request.getParameter("orderid"));

            request.setAttribute("order", orderid);

        }catch (IndexOutOfBoundsException f){
            throw new UserException("fix your shit man " + f);
        }

        return pageToShow;
    }
}
