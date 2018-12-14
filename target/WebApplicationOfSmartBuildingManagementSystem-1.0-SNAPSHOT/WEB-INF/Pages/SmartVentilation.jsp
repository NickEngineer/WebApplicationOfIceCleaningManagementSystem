<%@ page import="com.SmartBuildingManagementSystem.System.Model.Device" %>
<%@ page import="com.SmartBuildingManagementSystem.System.Service.DeviceSerivce" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    String printDevices() {
        StringBuilder stringBuilder = new StringBuilder();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username

        Device[] devices = DeviceSerivce.getAllDevicesOfUser(name);

        for (int i = 0; i < devices.length; ++i) {
            stringBuilder.append("<div class=\"device\">\n");
            stringBuilder.append("    <div class=\"deviceNameShell\">Device " + (i + 1) + ": <div class=\"deviceName\">");
            stringBuilder.append(devices[i].getModel() + "</div> </div>\n");
            stringBuilder.append("     <a class=\"openDeviceLink\">\n");
            stringBuilder.append("     <img src=\"/managesyst.com/resources/photos/open.png\" title=\"Open\" class=\"openDevice\"/></a>\n");
            stringBuilder.append("     <input class=\"checkboxDelete\" title=\"Select to delete\" type=\"checkbox\">\n");
            stringBuilder.append("     <div class=\"deviceIp\" value=\"" + devices[i].getIp() + "\"></div>");
            stringBuilder.append("     <div class=\"userId\" value=\"" + devices[i].getUserId() + "\"></div>");
            stringBuilder.append("  </div>");
        }

        return stringBuilder.toString();
    }

%>

<html>
<head>
    <title>SmartVentilation</title>

    <spring:url value="/resources/bootstrap$JQuery/jquery-3.2.1.min.js" var="defineJQuery"/>
    <script src="${defineJQuery}"></script>

    <spring:url value="/resources/js/smartVentilationDynamicSettings.js" var="smartVentilationDynamicSettings"/>
    <script src="${smartVentilationDynamicSettings}"></script>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <link href="${generalCssSettings}" rel="stylesheet"/>
    <spring:url value="/resources/css/smartVentilationPageStyle.css" var="smartVentilationPageStyle"/>
    <link href="${smartVentilationPageStyle}" rel="stylesheet"/>

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
            <a class="logoutLink" href="<c:url value="/logout" />">
                <img src="${contextPath}/resources/photos/userLogout.png" class="logoutImage"/>
            </a>
        </div>
    </c:if>

    <h1 id="smartVentilationTitle">Smart Ventilation</h1>
</div>
<div id="devices">
    <h2 id="smartVentilationChooseYourDeviceTitle">Choose Your Device</h2>
    <div id="menu">
        <a id="addNewDevice" href="<c:url value="/private-cabinet/smart-ventilation/add-device" />">
            <img src="${contextPath}/resources/photos/gray-plus-th.png" class="menuManipulation"/></a>

        <a id="deletDevice" href="<c:url value="/private-cabinet/smart-ventilation" />">
            <img src="${contextPath}/resources/photos/delete.png" class="menuManipulation"/></a>
    </div>

    <form:form modelAttribute="usersDevice" id="openUsersDeviceForm" method="POST"
               action="${contextPath}/private-cabinet/smart-ventilation/smart-device" class="form-signin">

        <form:input path="model" id="deviceName" type="text" class="form-control" name="model"
                    required="" autofocus="true"/>
        <form:input path="userId" id="userId" type="text" class="form-control" name="id"/>
        <form:input path="ip" id="deviceIp" type="hidden" class="form-control" name="deviceIp"/>
        <form:button id="sendForm" type="submit"></form:button>
    </form:form>

    <%= printDevices() %>

</div>
</body>
</html>
