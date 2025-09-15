<%@ page import="java.util.*,com.ecommerce.model.Product,com.ecommerce.dao.ProductDAO" %>
<%
    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Ecommerce Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
        .product-img {
            transition: transform 0.3s ease;
        }
        .product-card:hover .product-img {
            transform: scale(1.05);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-gray-100 dark:from-gray-900 dark:to-gray-800 min-h-screen">
    <jsp:include page="/jsp/navbar.jsp" />

    <h2 class="text-3xl font-bold text-center my-10 text-blue-600 dark:text-blue-400 uppercase tracking-wide"><i class="fas fa-shopping-bag mr-2"></i> Available Products</h2>
    <div class="container mx-auto px-4 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
        <%
            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>
            <div class="product-card bg-white dark:bg-gray-800 rounded-2xl shadow-md overflow-hidden">
                <img src="<%= (p.getImageUrl() != null) ? p.getImageUrl() : "https://via.placeholder.com/220" %>" alt="<%= p.getName() %>" class="product-img w-full h-56 object-cover" />
                <div class="p-6">
                    <h4 class="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-2"><%= p.getName() %></h4>
                    <p class="text-lg font-bold text-green-600 dark:text-green-400 mb-4">Rs <%= p.getPrice() %></p>
                    <form action="<%=request.getContextPath()%>/cart/add" method="post" class="flex items-center justify-between">
                        <input type="hidden" name="productId" value="<%= p.getId() %>"/>
                        <input type="number" name="quantity" value="1" min="1" max="<%= p.getStock() %>" class="w-20 px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 dark:bg-gray-700 dark:text-gray-200"/>
                        <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-full hover:bg-green-600 transition-transform hover:scale-105"><i class="fas fa-cart-plus mr-2"></i> Add to Cart</button>
                    </form>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <div class="col-span-full text-center text-xl text-gray-600 dark:text-gray-400 my-20"><i class="fas fa-exclamation-circle mr-2"></i> No products available</div>
        <%
            }
        %>
    </div>
</body>
</html>