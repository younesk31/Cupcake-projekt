package web.commands;

import business.entities.Cupcake;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowCartCommand extends CommandProtectedPage {

    public ShowCartCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        //todo make sure that we dont geet nullpointer cause of empty cart
        //todo reset cart
        List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");
        double total = 0;
        
        for (Cupcake cupcake : cupcakeList) {
            total += cupcake.getPrice();
        }

        request.getSession().setAttribute("total", total);
        return pageToShow;
    }

    public String getRole() {
        return role;
    }
}
