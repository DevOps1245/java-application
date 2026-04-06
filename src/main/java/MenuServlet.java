import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

public class MenuServlet extends HttpServlet {

    private FoodDeliveryApp app;

    @Override
    public void init() {
        app = AppContext.getApp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantId = request.getParameter("restaurantId");
        Restaurant restaurant = app.getRestaurantById(restaurantId);

        if (restaurant == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        request.setAttribute("restaurant", restaurant);
        request.setAttribute("restaurantId", restaurantId);
        request.setAttribute("menuItems", restaurant.getMenu());
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }
}
