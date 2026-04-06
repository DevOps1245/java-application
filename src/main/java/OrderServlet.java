import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class OrderServlet extends HttpServlet {

    private FoodDeliveryApp app;

    @Override
    public void init() {
        app = AppContext.getApp();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantId = request.getParameter("restaurantId");
        Restaurant restaurant = app.getRestaurantById(restaurantId);

        Order order = new Order("ORD" + System.currentTimeMillis(), restaurant, restaurant.getDeliveryFee());
        List<Integer> quantities = new ArrayList<>();

        for (MenuItem item : restaurant.getMenu()) {
            String qtyParam = request.getParameter("qty_" + item.getItemId());
            int qty = (qtyParam != null && !qtyParam.isEmpty()) ? Integer.parseInt(qtyParam) : 0;
            if (qty > 0) {
                order.addItem(item, qty);
                quantities.add(qty);
            }
        }

        order.placeOrder();
        app.addOrder(order);

        request.setAttribute("order", order);
        request.setAttribute("quantities", quantities);
        request.getRequestDispatcher("/orderSummary.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("orders", app.getOrderHistory());
        request.getRequestDispatcher("/orderHistory.jsp").forward(request, response);
    }
}
