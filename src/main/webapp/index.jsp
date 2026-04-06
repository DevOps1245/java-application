<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Food Delivery App</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 900px; margin: 0 auto; padding: 20px; background: #f5f5f5; }
    h1 { color: #e74c3c; text-align: center; }
    .restaurant-card { background: white; border-radius: 8px; padding: 15px; margin: 10px 0; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    .btn { background: #e74c3c; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; }
    .btn:hover { background: #c0392b; }
  </style>
</head>
<body>
  <h1>🍕 Food Delivery App</h1>
  <h2>Available Restaurants</h2>

  <div class="restaurant-card">
    <h3>🍕 Pizza Palace</h3>
    <p>📍 123 Main Street | Delivery Fee: ₹50</p>
    <a href="menu?restaurantId=R001" class="btn">View Menu</a>
  </div>

  <div class="restaurant-card">
    <h3>🍔 Burger Hub</h3>
    <p>📍 456 Oak Avenue | Delivery Fee: ₹40</p>
    <a href="menu?restaurantId=R002" class="btn">View Menu</a>
  </div>

  <div class="restaurant-card">
    <h3>🍛 Curry House</h3>
    <p>📍 789 Spice Road | Delivery Fee: ₹60</p>
    <a href="menu?restaurantId=R003" class="btn">View Menu</a>
  </div>

  <br>
  <a href="orders" class="btn">📋 View Order History</a>
</body>
</html>
