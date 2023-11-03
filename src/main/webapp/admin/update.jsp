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
<form action="http://localhost:8080/admin/product?action=edit&id=${id}" method="post">
    <label>Name</label>
    <input type="text" name="name" placeholder="${editProduct.name}">
    <label>Price</label>
    <input type="text" name="price" placeholder="${editProduct.price}">
    <label>Description</label>
    <input type="text" name="description" placeholder="${editProduct.description}">
    <label>Status</label>
    <select name="status">
        <c:choose>
            <c:when test="${editProduct.status == true}">
                <option value="<c:out value="${editProduct.status}"/>">Còn hàng</option>
            </c:when>
            <c:when test="${editProduct.status == false}">
                <option value="<c:out value="${editProduct.status}"/>">Hết hàng</option>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${editProduct.status == true}">
                <option value="false" name="false">Hết hàng</option>
            </c:when>
            <c:when test="${editProduct.status == false}">
                <option value="true" name="true">Còn hàng</option>
            </c:when>
        </c:choose>
    </select>
    <label>Category</label>
    <select name="categoryId">
        <c:forEach items="${categoryList}" var="item">
            <c:if test="${item.id == editProduct.categoryId.id}">
                <option value="${item.id}">
                        ${item.name}
                </option>
            </c:if>
        </c:forEach>
        <c:forEach items="${categoryList}" var="item">
            <option value="${item.id}">
                    ${item.name}
            </option>
        </c:forEach>
    </select>
    <button>Submit</button>
</form>
<table border="1px solid black">
    <tr>
        <th>Id</th>
        <th>Size</th>
        <th>Quantity</th>
        <th>ProductId</th>
        <th>Action</th>
    </tr>
    <c:forEach var="item" items="${sizeList}">
        <form action="product?action=editsize" method="post">
            <tr>
                <td>${item.id}</td>
                <td><input name="size" value="${item.size}" style="display: none">${item.size}</td>
                <td><input type="text" name="quantity" placeholder="${item.quantity}" value="${item.quantity}"></td>
                <td><input name="productId" value="${item.productId}" style="display: none">${item.productId}</td>
                <td>
                    <button>Edit</button>
                </td>
            </tr>
        </form>
    </c:forEach>
</table>
<table border="1px solid black">
    <tr>
        <th>Id</th>
        <th>Image</th>
        <th>ProductId</th>
        <th>Action</th>
    </tr>
    <c:forEach var="item" items="${imageList}">
        <form action="product?action=editimage" method="post">
            <tr>
                <td><input name="id" value="${item.id}" style="display: none">${item.id}</td>
                <td><input name="image" value="${item.image}"></td>
                <td><input name="productId" value="${item.productId}" style="display: none">${item.productId}</td>
                <td>
                    <button>Edit</button>
                </td>
            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>
