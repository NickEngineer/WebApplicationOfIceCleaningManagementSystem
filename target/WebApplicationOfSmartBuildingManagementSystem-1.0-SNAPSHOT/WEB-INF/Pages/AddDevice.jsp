<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddDevice</title>

    <spring:url value="/resources/bootstrap$JQuery/jquery-3.2.1.min.js" var="defineJQuery"/>
    <script src="${defineJQuery}"></script>

    <spring:url value="/resources/js/addDevicePageDynamicSettings.js" var="addDevicePageDynamicSettings"/>
    <script src="${addDevicePageDynamicSettings}"></script>


    <spring:url value="/resources/bootstrap$JQuery/bootstrap/css/bootstrap.min.css" var="bootstrap"/>
    <link href="${bootstrap}" rel="stylesheet"/>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <link href="${generalCssSettings}" rel="stylesheet"/>
    <spring:url value="/resources/css/smartVentilationPageStyle.css" var="smartVentilationPageStyle"/>
    <link href="${smartVentilationPageStyle}" rel="stylesheet"/>
    <spring:url value="/resources/css/addNewDevicePageStyle.css" var="addNewDevicePageStyle"/>
    <link href="${addNewDevicePageStyle}" rel="stylesheet"/>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
<body>
<div id="header">
    <a href="${contextPath}" id="title">Smart Building Management System</a>

    <security:authorize access="hasAnyRole('ROLE_USER')" var="isUSer"/>
    <c:if test="${isUSer}">
        <div class="aboutUserLine">
            <a href="${contextPath}/private-cabinet"/>
            <img src="${contextPath}/resources/photos/Home_icon_grey.png"
                 title="<security:authentication property='principal.username'/>" class="privateCabinetImage"/></a>
            <a class="logoutLink"  href="<c:url value="/logout" />">
                <img src="${contextPath}/resources/photos/userLogout.png" class="logoutImage"/>
            </a>
        </div>
    </c:if>

    <h1 id="smartVentilationTitle">Smart Ventilation</h1>
</div>

<div id="userLogin"><security:authentication property="principal.username"/></div>

<div id="devices">
    <h2 id="smartVentilationChooseYourDeviceTitle">Add New Device</h2>
    <div id="menu">
        <a id="addDevice" href="<c:url value="/private-cabinet/smart-ventilation" />">
            <img src="${contextPath}/resources/photos/Back.png" title="Back" class="menuManipulation"/></a>
    </div>

    <form:form modelAttribute="deviceFromServer" id="addDeviceForm" method="POST"
               action="${contextPath}/private-cabinet/smart-ventilation/add-device/execute" class="form-signin">

        <form:input path="model" id="deviceName" type="text" class="form-control" name="model" placeholder="Device Name"
                    required="" autofocus="true"/>
        <form:input path="id" id="deviceCode" title="Device Code" type="text" class="form-control" name="id" placeholder="Device Code"/>
        <form:input path="userName" id="userName"  type="hidden" class="form-control" name="userName" required=""/>

        <form:button id="ok" src="${contextPath}/resources/photos/Ok.jpg" type="submit"></form:button>
    </form:form>
</div>
</body>
</html>
