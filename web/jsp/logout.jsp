<%@ page contentType="text/html;charset=UTF-8" %>
<%
    session.invalidate(); // Clear session
    response.sendRedirect(request.getContextPath() + "/index.jsp");
%>