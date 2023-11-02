<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 31/10/2023
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<body>
<form action="http://localhost:8080/admin/product?action=create" method="post">
    <label>Name</label>
    <input type="text" name="name" placeholder="name">
    <label>Price</label>
    <input type="text" name="price" placeholder="price">
    <label>Description</label>
    <input type="text" name="description" placeholder="description">
    <label>Status</label>
    <select>
        <option value="true">Còn hàng</option>
        <option value="false">Hết hàng</option>
    </select>
    <label>Category</label>
    <select name="categoryId">
        <c:forEach items="${categoryList}" var="item">
            <option value="${item.id}">
                    ${item.name}
            </option>
        </c:forEach>
    </select>
    <button>Submit</button>
</form>
</body>
</body>
</html>
