<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Order" %>
<!DOCTYPE html>
<html>
<head>
  <title>Order History</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 900px; margin: 0 auto; padding: 20px; background: #f5f5f5; }
    h1 { color: #e74c3c; }
    table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    th { background: #e74c3c; color: white; padding: 12px; }
    td { padding: 12px; border-bottom: 1px solid #eee; text-align: center; }
    .btn { background: #666; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
    .status { background: #27ae60; color: white; padding: 3px 10px; border-radius: 12px; font-size: 0.85em; }
  </style>
</head>
<body>
  <h1>📋 Order History</h1>
  <%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    if (orders == null || orders.isEmpty()) {
  %>
    <p>No orders placed yet!</p>
  <% } else { %>
    <table>
      <tr><th>Order ID</th><th>Restaurant</th><th>Total</th><th>Status</th></tr>
      <% for (Order order : orders) { %>
      <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getRestaurant() %></td>
        <td>₹<%= String.format("%.2f", order.calculateTotal()) %></td>
        <td><span class="status"><%= order.getStatus() %></span></td>
      </tr>
      <% } %>
    </table>
  <% } %>
  <br>
  <a href="index.jsp" class="btn">← Back to Home</a>
</body>
</html>
