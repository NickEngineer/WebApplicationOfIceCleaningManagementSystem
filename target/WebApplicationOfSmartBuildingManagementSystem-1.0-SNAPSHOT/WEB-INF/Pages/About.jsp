<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>AboutSystem</title>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <link href="${generalCssSettings}" rel="stylesheet" var="generalCssSettings"/>

    <spring:url value="/resources/css/aboutSystemPageStyle.css" var="aboutSystemPageStyle"/>
    <link href="${aboutSystemPageStyle}" rel="stylesheet" var="aboutSystemPageStyle"/>

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

<div id="data">
    <br>
    <h1><b>About Smart Building Management System</b></h1>
    <div id="text">
        <p>It is a service for intelligent control of buildings, namely, their ventilation.</p>

        <p>Main functions of the system:</p>

        <p>1. Manage the smart device with a mobile application: set the desired temperature
            and humidity that will restrict airing, and choose the desired mode of operation.</p>
        <p>2. Manage the smart device through your personal cabinet through the site.</p>
        <p>3. View the collected data from the device (statistics) and predict further results.</p>
        <p>4. Calculation of energy consumption in kWh, which is related to the process of air
            exchange, carried out on the basis of collected data from temperature sensors and fan power.</p>
    </div>
</div>

</body>
</html>
