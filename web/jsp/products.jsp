<%@ page import="java.util.*,com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen font-poppins">
<jsp:include page="navbar.jsp"/>

<div class="container mx-auto px-4 py-10 max-w-7xl">
    <form method="get" action="<%=request.getContextPath()%>/products" class="flex flex-col md:flex-row items-center mb-8 space-y-4 md:space-y-0 md:space-x-4">
        <input type="text" name="search" class="flex-grow px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" placeholder="Search products...">
        <select name="category" class="px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200 md:w-48">
            <option value="">All Categories</option>
            <option value="1">Mobiles</option>
            <option value="2">Laptops</option>
            <option value="3">Shoes</option>
            <option value="4">Headphones</option>
            <option value="5">Clothing</option>
        </select>
        <button class="bg-teal-500 text-white px-6 py-3 rounded-lg hover:bg-teal-600 transition-transform hover:scale-105"><i class="fas fa-search mr-2"></i> Search</button>
    </form>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>
        <div class="card bg-white dark:bg-gray-800 rounded-2xl shadow-md overflow-hidden">
            <img src="<%=p.getImageUrl()%>" class="w-full h-56 object-cover" alt="<%=p.getName()%>">
            <div class="p-6">
                <h5 class="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-2"><%=p.getName()%></h5>
                <p class="text-lg font-bold text-green-600 dark:text-green-400 mb-4">Rs <%=p.getPrice()%></p>
                <form action="<%=request.getContextPath()%>/cart/add" method="post" class="flex items-center space-x-4">
                    <input type="hidden" name="productId" value="<%=p.getId()%>">
                    <input type="number" name="quantity" value="1" min="1" max="<%=p.getStock()%>" class="w-20 px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200">
                    <button class="bg-green-500 text-white px-4 py-2 rounded-full hover:bg-green-600 transition-transform hover:scale-105"><i class="fas fa-cart-plus mr-2"></i> Add to Cart</button>
                </form>
            </div>
        </div>
        <% } } else { %>
        <p class="col-span-full text-center text-xl text-gray-600 dark:text-gray-400">No products found.</p>
        <% } %>
    </div>
</div>
</body>
</html>