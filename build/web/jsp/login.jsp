<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - AAMart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen flex items-center justify-center font-poppins">
    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-10 w-full max-w-md transform transition-transform hover:scale-105">
        <h2 class="text-3xl font-bold text-center text-teal-600 dark:text-teal-400 mb-8"><i class="fas fa-sign-in-alt mr-2"></i> Welcome Back</h2>

        <% 
            String error = (String) request.getAttribute("error"); 
            String registered = request.getParameter("registered");
        %>

        <% if (error != null) { %>
            <p class="text-red-500 text-center mb-4"><i class="fas fa-exclamation-circle mr-2"></i> <%= error %></p>
        <% } %>

        <% if ("1".equals(registered)) { %>
            <p class="text-green-500 text-center mb-4"><i class="fas fa-check-circle mr-2"></i> Registration successful. Please login.</p>
        <% } %>

        <form action="<%=request.getContextPath()%>/user/login" method="post">
            <input type="email" name="email" placeholder="Email" required class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg mb-4 focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" />
            <input type="password" name="password" placeholder="Password" required class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg mb-6 focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" />
            <button type="submit" class="w-full bg-teal-500 text-white py-3 rounded-full hover:bg-teal-600 transition-transform hover:scale-105"><i class="fas fa-sign-in-alt mr-2"></i> Login</button>
        </form>

        <a href="<%=request.getContextPath()%>/jsp/register.jsp" class="block text-center mt-6 text-teal-600 dark:text-teal-400 hover:underline">New here? Create an account</a>
    </div>
</body>
</html>