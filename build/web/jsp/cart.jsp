<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        function confirmRemove() {
            return confirm("Are you sure you want to remove this item from your cart?");
        }
    </script>
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen font-poppins">
    <jsp:include page="navbar.jsp" />
    <div class="container mx-auto px-4 py-10 max-w-6xl">
        <h2 class="text-3xl font-bold text-center mb-10 text-teal-600 dark:text-teal-400"><i class="fas fa-shopping-cart mr-2"></i> Your Shopping Cart</h2>
        <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">
            <table class="w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead class="bg-teal-500">
                    <tr>
                        <th class="px-6 py-4 text-left text-white font-semibold">Image</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Product</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Price</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Quantity</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Total</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    <%
                        List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
                        double grandTotal = 0;
                        if (cart != null && !cart.isEmpty()) {
                            for (CartItem ci : cart) {
                                double subtotal = ci.getQuantity() * ci.getProduct().getPrice();
                                grandTotal += subtotal;
                    %>
                    <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                        <td class="px-6 py-4">
                            <img src="<%= (ci.getProduct().getImageUrl() != null) ? ci.getProduct().getImageUrl() : "https://via.placeholder.com/100" %>" 
                                 alt="<%= ci.getProduct().getName() %>" class="w-24 h-24 object-cover rounded-lg transform transition-transform hover:scale-105"/>
                        </td>
                        <td class="px-6 py-4 text-gray-800 dark:text-gray-200"><%= ci.getProduct().getName() %></td>
                        <td class="px-6 py-4 text-gray-800 dark:text-gray-200">₹<%= ci.getProduct().getPrice() %></td>
                        <td class="px-6 py-4">
                            <form action="<%=request.getContextPath()%>/cart/update" method="post" class="flex items-center space-x-2">
                                <input type="hidden" name="itemId" value="<%= ci.getId() %>" />
                                <input type="number" name="quantity" value="<%= ci.getQuantity() %>" min="1" class="w-20 px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" />
                                <button type="submit" class="bg-teal-500 text-white px-4 py-2 rounded-full hover:bg-teal-600 transition-transform hover:scale-105"><i class="fas fa-sync-alt"></i> Update</button>
                            </form>
                        </td>
                        <td class="px-6 py-4 text-gray-800 dark:text-gray-200">₹<%= subtotal %></td>
                        <td class="px-6 py-4">
                            <form action="<%=request.getContextPath()%>/cart/remove" method="post" onsubmit="return confirmRemove();">
                                <input type="hidden" name="itemId" value="<%= ci.getId() %>" />
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-full hover:bg-red-600 transition-transform hover:scale-105"><i class="fas fa-trash-alt mr-2"></i> Remove</button>
                            </form>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr><td colspan="6" class="px-6 py-4 text-center text-gray-600 dark:text-gray-400">Your cart is empty.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <h3 class="text-2xl font-bold text-center my-8 text-green-600 dark:text-green-400">Grand Total: ₹<%= grandTotal %></h3>
        <% if (grandTotal > 0) { %>
        <div class="text-center">
            <form action="<%=request.getContextPath()%>/checkout" method="post">
                <button type="submit" class="bg-teal-500 text-white px-6 py-3 rounded-full hover:bg-teal-600 transition-transform hover:scale-105"><i class="fas fa-check-circle mr-2"></i> Proceed to Checkout</button>
            </form>
        </div>
        <% } %>
    </div>
</body>
</html>