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
</body>
</html>
