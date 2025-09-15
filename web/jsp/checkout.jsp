<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - AAMart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen font-poppins">
<jsp:include page="navbar.jsp" />

<div class="container mx-auto px-4 py-20 max-w-lg">
    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-10 transform transition-transform hover:scale-105">
        <h2 class="text-3xl font-bold text-center text-teal-600 dark:text-teal-400 mb-8"><i class="fas fa-shopping-cart mr-2"></i> Checkout</h2>
        <form action="<%=request.getContextPath()%>/checkout" method="post">
            <div class="mb-6">
                <label class="block text-gray-700 dark:text-gray-300 font-medium mb-2"><i class="fas fa-user mr-2"></i> Full Name</label>
                <input type="text" name="fullname" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" required />
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 dark:text-gray-300 font-medium mb-2"><i class="fas fa-map-marker-alt mr-2"></i> Address</label>
                <textarea name="address" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" rows="3" required></textarea>
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 dark:text-gray-300 font-medium mb-2"><i class="fas fa-phone mr-2"></i> Phone Number</label>
                <input type="text" name="phone" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" required />
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 dark:text-gray-300 font-medium mb-2"><i class="fas fa-credit-card mr-2"></i> Payment Method</label>
                <select name="paymentMethod" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" required>
                    <option value="COD">Cash on Delivery</option>
                    <option value="Card">Credit/Debit Card</option>
                    <option value="UPI">UPI</option>
                </select>
            </div>
            <button type="submit" class="w-full bg-teal-500 text-white py-3 rounded-full hover:bg-teal-600 transition-transform hover:scale-105"><i class="fas fa-check-circle mr-2"></i> Place Order</button>
        </form>
    </div>
</div>

</body>
</html>