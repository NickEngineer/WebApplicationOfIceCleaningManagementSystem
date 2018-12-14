<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddDevice</title>

    <security:csrfMetaTags/>

    <spring:url value="/resources/bootstrap$JQuery/jquery-3.2.1.min.js" var="defineJQuery"/>
    <script src="${defineJQuery}"></script>

    <spring:url value="/resources/bootstrap$JQuery/jquery-ui-1.12.1/jquery-ui.js" var="jqueryUI"/>
    <script src="${jqueryUI}"></script>

    <spring:url value="/resources/js/ventilationDeviceDynamicSettings.js" var="ventilationDeviceDynamicSettings"/>
    <script src="${ventilationDeviceDynamicSettings}"></script>


    <spring:url value="/resources/bootstrap$JQuery/bootstrap/css/bootstrap.min.css" var="bootstrap"/>
    <link href="${bootstrap}" rel="stylesheet"/>

    <spring:url value="/resources/bootstrap$JQuery/jquery-ui-1.12.1/jquery-ui.css" var="jqueryUICSS"/>
    <link href="${jqueryUICSS}" rel="stylesheet"/>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <link href="${generalCssSettings}" rel="stylesheet"/>
    <spring:url value="/resources/css/smartVentilationPageStyle.css" var="smartVentilationPageStyle"/>
    <link href="${smartVentilationPageStyle}" rel="stylesheet"/>
    <spring:url value="/resources/css/addNewDevicePageStyle.css" var="addNewDevicePageStyle"/>
    <link href="${addNewDevicePageStyle}" rel="stylesheet"/>

    <spring:url value="/resources/css/ventilationDevicePageStyle.css" var="ventilationDevicePageStyle"/>
    <link href="${ventilationDevicePageStyle}" rel="stylesheet"/>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
<body>
<div class="settings" id="changeMode" value="30"></div>

<div id="header">
    <a href="${contextPath}" id="title">Smart Building Management System</a>

    <security:authorize access="hasAnyRole('ROLE_USER')" var="isUSer"/>
    <c:if test="${isUSer}">
        <div class="aboutUserLine">
            <a href="${contextPath}/private-cabinet"/>
            <img src="${contextPath}/resources/photos/Home_icon_grey.png"
                 title="<security:authentication property='principal.username'/>" class="privateCabinetImage"/></a>
            <a class="logoutLink" href="<c:url value="/logout" />">
                <img src="${contextPath}/resources/photos/userLogout.png" class="logoutImage"/>
            </a>
        </div>
    </c:if>

    <h1 id="smartVentilationTitle">Smart Ventilation Device</h1>
</div>

<div id="menu">
    <a id="addDevice" href="<c:url value="/private-cabinet/smart-ventilation" />">
        <img src="${contextPath}/resources/photos/Back.png" title="Back" class="menuManipulation"/></a>
</div>

<div id="userLogin"><security:authentication property="principal.username"/></div>

<form:form modelAttribute="usersDevice" id="openUsersDeviceForm" method="POST"
           action="${contextPath}/private-cabinet/smart-ventilation/smart-device" class="form-signin">

    <form:input path="model" id="deviceName" type="text" class="form-control" name="model"
                required="" autofocus="true"/>
    <form:input path="userId" id="userId" type="text" class="form-control" name="id"/>
    <form:input path="ip" id="deviceIp" type="hidden" class="form-control" name="deviceIp"/>
    <form:button id="sendForm" type="submit"></form:button>
</form:form>

<div id="deviceNameTitle"></div>

<img src="${contextPath}/resources/photos/PropellerVent.png" id="fanImage"/>

<img src="${contextPath}/resources/photos/on.png" id="off" class="statusImage"/>


<div id="contentSliderContainer">Power: <span id="contentSlider"></span>%</div>
<div id="slider"></div>

<div id="temp1"></div>



</body>
</html>
