<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen font-poppins">
<jsp:include page="navbar.jsp" />

<div class="container mx-auto px-4 py-10 max-w-5xl">
    <h2 class="text-3xl font-bold text-center mb-10 text-teal-600 dark:text-teal-400"><i class="fas fa-box-open mr-2"></i> My Orders</h2>
    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">
        <table class="w-full divide-y divide-gray-200 dark:divide-gray-700">
            <thead class="bg-teal-500">
                <tr>
                    <th class="px-6 py-4 text-left text-white font-semibold">Order ID</th>
                    <th class="px-6 py-4 text-left text-white font-semibold">Total</th>
                    <th class="px-6 py-4 text-left text-white font-semibold">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                <%
                    List<Map<String,Object>> orders = (List<Map<String,Object>>) request.getAttribute("orders");
                    if (orders != null && !orders.isEmpty()) {
                        for (Map<String,Object> o : orders) {
                %>
                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                    <td class="px-6 py-4 text-gray-800 dark:text-gray-200"><%= o.get("id") %></td>
                    <td class="px-6 py-4 text-gray-800 dark:text-gray-200">₹<%= o.get("total") %></td>
                    <td class="px-6 py-4 text-gray-800 dark:text-gray-200"><%= o.get("created_at") %></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr><td colspan="3" class="px-6 py-4 text-center text-gray-600 dark:text-gray-400">No orders found</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>