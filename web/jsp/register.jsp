<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - AAMart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen flex items-center justify-center font-poppins">
    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-10 w-full max-w-md transform transition-transform hover:scale-105">
        <h2 class="text-3xl font-bold text-center text-teal-600 dark:text-teal-400 mb-8"><i class="fas fa-user-plus mr-2"></i> Create Account</h2>
        <form action="<%=request.getContextPath()%>/user/register" method="post">
            <input type="text" name="fullname" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg mb-4 focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" placeholder="Full Name" required />
            <input type="email" name="email" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg mb-4 focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" placeholder="Email" required />
            <input type="password" name="password" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg mb-4 focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" placeholder="Password" required />
            <input type="text" name="phone" class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg mb-6 focus:outline-none focus:ring-2 focus:ring-teal-500 dark:bg-gray-700 dark:text-gray-200" placeholder="Phone Number" />
            <button type="submit" class="w-full bg-teal-500 text-white py-3 rounded-full hover:bg-teal-600 transition-transform hover:scale-105"><i class="fas fa-sign-in-alt mr-2"></i> Register</button>
        </form>
        <a href="login.jsp" class="block text-center mt-6 text-teal-600 dark:text-teal-400 hover:underline">Already have an account? Login</a>
    </div>
</body>
</html>