<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-cyan-50 to-cyan-100 dark:from-gray-900 dark:to-gray-800 min-h-screen flex items-center justify-center font-poppins">
<jsp:include page="navbar.jsp" />
<div class="bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-10 max-w-md text-center transform transition-transform hover:scale-105">
    <h2 class="text-3xl font-bold text-teal-600 dark:text-teal-400 mb-4"><i class="fas fa-user-check mr-2"></i> Welcome, <%= ((com.ecommerce.model.User) session.getAttribute("user")).getFullname() %>!</h2>
    <p class="text-lg text-gray-700 dark:text-gray-300 mb-6">You are now logged in.</p>
    <a href="<%=request.getContextPath()%>/user/logout" class="text-red-500 hover:underline"><i class="fas fa-sign-out-alt mr-2"></i> Logout</a>
</div>
</body>
</html>