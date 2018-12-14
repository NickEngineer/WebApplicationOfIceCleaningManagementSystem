<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Main page</title>
    <spring:url value="/resources/bootstrap$JQuery/jquery-3.2.1.min.js" var="defineJQuery"/>
    <script src="${defineJQuery}"></script>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <spring:url value="/resources/css/mainSystemPageStyle.css" var="cssSettingsOfMainPage"/>

    <link href="${generalCssSettings}" rel="stylesheet" var="generalCssSettings"/>
    <link href="${cssSettingsOfMainPage}" rel="stylesheet" var="cssSettingsOfMainPage"/>

    <spring:url value="/resources/js/mainPageDynamicSettings.js" var="mainPageDynamicSettings"/>
    <script src="${mainPageDynamicSettings}"></script>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

</head>
<body>

<a href="${contextPath}" id="title">Smart Building Management System</a>

<security:authorize access= "hasAnyRole('ROLE_USER')" var= "isUSer"/>
<c:if test="${isUSer}">
    <div class="aboutUserLine">
        <a href="${contextPath}/private-cabinet" />
            <img src="${contextPath}/resources/photos/Home_icon_grey.png"
                 title="<security:authentication property='principal.username'/>" class="privateCabinetImage"/></a>
        <a class="logoutLink" href="<c:url value="/logout" />">
            <img src="${contextPath}/resources/photos/userLogout.png"  class="logoutImage"/>
        </a>
    </div>
</c:if>

<div class='selector'>
    <img src="${contextPath}/resources/photos/roundingImage.png" id="rounding">
    <ul>
        <li>
            <input id='1' type='checkbox' class="nextStep">
            <label for='1' id='1L' class="nextStep">Login</label>
        </li>
        <li>
            <input id='2' type='checkbox' class="nextStep">
            <label for='2' id='2L' class="nextStep">Registration</label>
        </li>
        <li>
            <input id='3' type='checkbox' class="nextStep">
            <label for='3' id='3L' class="nextStep">About</label>
        </li>
    </ul>

    <button>Choose the next step</button>
</div>
</body>
</html>
