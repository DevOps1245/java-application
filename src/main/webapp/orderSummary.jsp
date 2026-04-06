<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="MenuItem" %>
<%@ page import="Order" %>
<!DOCTYPE html>
<html>
<head>
  <title>Order Summary</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 700px; margin: 0 auto; padding: 20px; background: #f5f5f5; }
    h1 { color: #27ae60; }
    .summary-box { background: white; border-radius: 8px; padding: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    table { width: 100%; border-collapse: collapse; }
    td, th { padding: 10px; border-bottom: 1px solid #eee; text-align: left; }
    th { background: #f9f9f9; }
    .total-row { font-weight: bold; font-size: 1.1em; color: #e74c3c; }
    .btn { background: #27ae60; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; display: inline-block; margin-top: 15px; }
  </style>
</head>
<body>
  <h1>✅ Order Confirmed!</h1>
  <div class="summary-box">
    <%
      Order order = (Order) request.getAttribute("order");
      List<MenuItem> items = order.getItems();
      List<Integer> quantities = (List<Integer>) request.getAttribute("quantities");
    %>
    <p><strong>Order ID:</strong> <%= order.getOrderId() %></p>
    <p><strong>Status:</strong> <%= order.getStatus() %></p>

    <table>
      <tr><th>Item</th><th>Qty</th><th>Price</th><th>Total</th></tr>
      <%
        for (int i = 0; i < items.size(); i++) {
          MenuItem item = items.get(i);
          int qty = quantities.get(i);
      %>
      <tr>
        <td><%= item.getItemName() %></td>
        <td><%= qty %></td>
        <td>₹<%= item.getPrice() %></td>
        <td>₹<%= item.getPrice() * qty %></td>
      </tr>
      <% } %>
      <tr><td colspan="3">Subtotal</td><td>₹<%= String.format("%.2f", order.calculateSubtotal()) %></td></tr>
      <tr><td colspan="3">Tax (5%)</td><td>₹<%= String.format("%.2f", order.calculateSubtotal() * 0.05) %></td></tr>
      <tr class="total-row"><td colspan="3">Total</td><td>₹<%= String.format("%.2f", order.calculateTotal()) %></td></tr>
    </table>

    <a href="index.jsp" class="btn">🏠 Back to Home</a>
    <a href="orders" class="btn" style="background:#e74c3c; margin-left:10px;">📋 Order History</a>
  </div>
</body>
</html>
