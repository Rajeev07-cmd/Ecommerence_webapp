<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen font-poppins">
<jsp:include page="navbar.jsp" />
<div class="container mx-auto px-4 py-20 max-w-lg">
    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-10 text-center transform transition-transform hover:scale-105">
        <h2 class="text-3xl font-bold text-green-600 dark:text-green-400 mb-6"><i class="fas fa-check-circle mr-2"></i> Order Placed Successfully!</h2>
        <p class="text-lg text-gray-700 dark:text-gray-300 mb-3">Your order ID is <b><%= request.getAttribute("orderId") %></b>.</p>
        <p class="text-lg text-gray-700 dark:text-gray-300 mb-3">Total Amount: ₹<b><%= request.getAttribute("total") %></b></p>
        <p class="text-lg text-gray-700 dark:text-gray-300 mb-6">Payment Method: <b><%= request.getAttribute("paymentMethod") %></b></p>
        <a href="<%= request.getContextPath() %>/products" class="bg-teal-500 text-white px-6 py-3 rounded-full hover:bg-teal-600 transition-transform hover:scale-105 inline-flex items-center"><i class="fas fa-shopping-bag mr-2"></i> Continue Shopping</a>
    </div>
</div>
</body>
</html>