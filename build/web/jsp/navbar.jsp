<%@ page import="com.ecommerce.model.User" %>
<%
    // Enable session
    User loggedUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <nav class="bg-gradient-to-r from-teal-500 to-teal-700 shadow-lg py-4 px-6 flex items-center justify-between font-poppins text-white">
        <a href="<%=request.getContextPath()%>/" class="text-2xl font-bold hover:text-yellow-300 transition-colors"><i class="fas fa-store mr-2"></i> AAMart</a>

        <div class="hidden md:flex space-x-8">
            <a href="<%=request.getContextPath()%>/"><i class="fas fa-home mr-1"></i> Home</a>
            <a href="<%=request.getContextPath()%>/products"><i class="fas fa-shopping-bag mr-1"></i> Products</a>
            <a href="<%=request.getContextPath()%>/cart"><i class="fas fa-shopping-cart mr-1"></i> Cart</a>
            <a href="<%=request.getContextPath()%>/orders"><i class="fas fa-box-open mr-1"></i> Orders</a>
        </div>

        <div class="flex items-center space-x-4">
            <% if (loggedUser != null) { %>
                <span class="hidden md:block"><i class="fas fa-user mr-1"></i> Welcome, <%= loggedUser.getFullname() %></span>
                <a href="<%=request.getContextPath()%>/user/logout" class="bg-yellow-400 text-black px-4 py-2 rounded-full hover:bg-yellow-500 transition-transform hover:scale-105"><i class="fas fa-sign-out-alt mr-1"></i> Logout</a>
            <% } else { %>
                <a href="<%=request.getContextPath()%>/jsp/login.jsp" class="bg-yellow-400 text-black px-4 py-2 rounded-full hover:bg-yellow-500 transition-transform hover:scale-105"><i class="fas fa-sign-in-alt mr-1"></i> Login</a>
                <a href="<%=request.getContextPath()%>/jsp/register.jsp" class="bg-yellow-400 text-black px-4 py-2 rounded-full hover:bg-yellow-500 transition-transform hover:scale-105"><i class="fas fa-user-plus mr-1"></i> Register</a>
            <% } %>
        </div>
    </nav>
</body>
</html>