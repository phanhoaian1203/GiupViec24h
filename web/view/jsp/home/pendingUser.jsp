<%-- 
    Document   : pendingUser
    Created on : Jun 16, 2025, 10:50:06 AM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Duyệt tài khoản</title></head>
<body>
    <h2>Danh sách tài khoản chờ duyệt</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Email</th><th>Họ tên</th><th>Hành động</th>
        </tr>
        <c:forEach var="user" items="${pendingUsers}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/approve-user" method="post">
                        <input type="hidden" name="userId" value="${user.userId}">
                        <button type="submit">Duyệt</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

