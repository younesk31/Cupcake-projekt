package web.commands;

import business.exceptions.UserException;
import business.persistence.Database;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

public abstract class Command {
    //Return a token string from the execute method to make a client side redirect,
    // instead of a server side (forward) redirect
    public final static String REDIRECT_INDICATOR = "#*redirect*#_###_";
    public final static String WAS_NOT_FOUND_COMMAND = "404_NOT_FOUND";
    public static Database database;
    private static HashMap<String, Command> commands;

    private static void initCommands(Database database) {
        commands = new HashMap<>();
        commands.put("index", new CommandUnprotectedPage("index"));
        commands.put("aboutus", new CommandUnprotectedPage("aboutus"));
        commands.put("loginpage", new CommandUnprotectedPage("index"));
        commands.put("logincommand", new LoginCommand(""));
        commands.put("logoutcommand", new LogoutCommand(""));
        commands.put("registerpage", new CommandUnprotectedPage("registerpage"));
        commands.put("registercommand", new RegisterCommand(""));
        commands.put("customerpage", new CommandProtectedPage("customerpage", "customer"));
        commands.put("orderpage", new CommandProtectedPage("orderpage", "customer"));
        commands.put("employeepage", new CommandProtectedPage("employeepage", "employee"));
        commands.put("updateBasket", new UpdateBasketCommand("orderpage", "customer"));
        commands.put("showcart", new ShowCartCommand("showcart", "customer"));
        commands.put("updatequantity", new UpdateQuantityCommand("showcart", "customer"));
        commands.put("customerlist", new CustomerList("customerlist", "employee"));
        commands.put("insertorder", new RecivedOrderCommand("orderpage", "customer"));
        commands.put("clistfunctions", new ClistCommands("customerlist", "employee"));

        commands.put("showmyorders", new ShowMyOrdersCommand("showmyorders", "customer"));

        commands.put("showcustomerorders", new ShowCustomerOrders("showcustomerorders", "employee"));

    }

    public static Command fromPath(HttpServletRequest request, Database db) {
        String action = request.getPathInfo().replaceAll("^/+", "");
        System.out.println("--> " + action);

        if (commands == null) {
            database = db;
            initCommands(database);
        }
        return commands.getOrDefault(action, new CommandUnknown());   // unknowncommand is default
    }

    public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws UserException;

}
