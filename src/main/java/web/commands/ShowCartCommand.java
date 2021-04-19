package web.commands;

import business.entities.Cupcake;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowCartCommand extends Command
{
    public String role;
    public String pageToShow;


    public ShowCartCommand(String pageToShow, String role)
    {
        this.pageToShow = pageToShow;
        this.role = role;

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        //todo reset cart
        List<Cupcake> cupcakeList = (List<Cupcake>) request.getSession().getAttribute("cupcakeList");
        double total = 0;

        for (int i = 0; i < cupcakeList.size(); i++) {
            total += cupcakeList.get(i).getPrice();
        }

        request.getSession().setAttribute("total", total);
        return pageToShow;
    }

    public String getRole()
    {
        return role;
    }
}
