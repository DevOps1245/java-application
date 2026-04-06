<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="MenuItem" %>
<%@ page import="Restaurant" %>
<!DOCTYPE html>
<html>
<head>
  <title>Menu</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 900px; margin: 0 auto; padding: 20px; background: #f5f5f5; }
    h1 { color: #e74c3c; }
    table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    th { background: #e74c3c; color: white; padding: 12px; text-align: left; }
    td { padding: 12px; border-bottom: 1px solid #eee; }
    tr:hover { background: #fff5f5; }
    .btn { background: #e74c3c; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; }
    .back-btn { background: #666; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; margin-bottom: 15px; display: inline-block; }
  </style>
</head>
<body>
  <a href="index.jsp" class="back-btn">← Back</a>
  <h1>🍽️ <%= ((Restaurant) request.getAttribute("restaurant")).getRestaurantName() %></h1>
  <p>📍 <%= ((Restaurant) request.getAttribute("restaurant")).getAddress() %> 
     | Delivery Fee: ₹<%= ((Restaurant) request.getAttribute("restaurant")).getDeliveryFee() %></p>

  <form action="placeOrder" method="post">
    <input type="hidden" name="restaurantId" value="<%= request.getAttribute("restaurantId") %>">
    <table>
      <tr>
        <th>Item</th>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
      </tr>
      <%
        List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
        for (MenuItem item : menuItems) {
      %>
      <tr>
        <td><%= item.getItemName() %></td>
        <td><%= item.getDescription() %></td>
        <td>₹<%= item.getPrice() %></td>
        <td>
          <input type="number" name="qty_<%= item.getItemId() %>" 
                 min="0" max="10" value="0" style="width:60px; padding:4px;">
        </td>
      </tr>
      <% } %>
    </table>
    <br>
    <button type="submit" class="btn">🛒 Place Order</button>
  </form>
</body>
</html>
