package web.commands;

import business.entities.Bottom;
import business.entities.Cupcake;
import business.entities.Top;
import business.exceptions.UserException;
import business.services.CupcakeFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class UpdateBasketCommand extends CommandProtectedPage {
    public String role;
    public String pageToShow;
    CupcakeFacade cupcakeFacade;

    public UpdateBasketCommand(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
        this.pageToShow = pageToShow;
        this.role = role;

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        try {

            String bottomId = request.getParameter("bottom");
            String toppingId = request.getParameter("topping");
            String quantity = request.getParameter("quantity");

            Bottom bottom = cupcakeFacade.getBottoms(Integer.parseInt(bottomId));
            Top top = cupcakeFacade.getToppings(Integer.parseInt(toppingId));

            List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");

            if (cupcakeList == null) {
                cupcakeList = new ArrayList<>();
            }

            cupcakeList.add(new Cupcake(bottom, top, Integer.parseInt(quantity)));

            request.getSession().setAttribute("cupcakeList", cupcakeList);

        } catch (UserException ex) {
            request.setAttribute("error", "Kunne ikke opdatere kurven!");
            return pageToShow;
        }
        return pageToShow;
    }
}
