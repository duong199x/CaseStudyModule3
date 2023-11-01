<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 31/10/2023
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<a href="http://localhost:8080/products?action=create" type="button">Add</a>
<table border="1px solid black" style="border-collapse: collapse">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Status</th>
        <th>Brand</th>
        <th colspan="4">Action</th>
    </tr>
    <c:forEach var="item" items="${productList}">
        <tr>
            <td> ${item.id}</td>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.description}</td>
            <td>${item.status}</td>
            <td>${item.categoryId.name}</td>
            <td>
                <button><a href="http://localhost:8080/products?action=edit&id=${item.id}"> Edit</a></button>
            </td>
            <td>
                <button onclick="confirmFunction('/products?action=delete&id=${item.id}')">Delete</button>
            </td>
            <td>
                <button onclick="confirmFunction('/products?action')">Add Size</button>
            </td>
            <td>
                <button onclick="confirmFunction('/products?action}')">Add Image</button>
            </td>
        </tr>

    </c:forEach>
</table>
</body>
</html>
