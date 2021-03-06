package web.commands;

import business.entities.Cupcake;
import business.entities.User;
import business.exceptions.UserException;
import business.services.CupcakeFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class RecivedOrderCommand extends Command {
    public String role;
    public String pageToShow;
    CupcakeFacade cupcakeFacade;

    public RecivedOrderCommand(String pageToShow, String role) {
        this.cupcakeFacade = new CupcakeFacade(database);
        this.pageToShow = pageToShow;
        this.role = role;

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        User user = (User) request.getSession().getAttribute("user");

        int user_id = user.getId();
        double total = (double) request.getSession().getAttribute("total");

        List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");
        double balance = user.getBalance();

        if (balance >= total) {
            cupcakeFacade.insertOrder(user_id, total, cupcakeList);
            cupcakeFacade.updateBalance((balance - total), user_id);
            request.getSession().setAttribute("balance", (balance - total));
            user.setBalance(balance - total);
            cupcakeList.clear();

        } else if (total > balance) {
            request.setAttribute("error", "Din saldo er for lav!");
            return "showcart";
        }

        return pageToShow;
    }

    public String getRole() {
        return role;
    }
}
