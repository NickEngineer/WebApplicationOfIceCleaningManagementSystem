<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "security" uri= "http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>PrivateCabinet</title>
    <spring:url value="/resources/bootstrap$JQuery/jquery-3.2.1.min.js" var="defineJQuery"/>
    <script src="${defineJQuery}"></script>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <link href="${generalCssSettings}" rel="stylesheet" var="generalCssSettings"/>
    <spring:url value="/resources/css/privateCabinetPageStyle.css" var="privateCabinetPageStyle"/>
    <link href="${privateCabinetPageStyle}" rel="stylesheet" var="privateCabinetPageStyle"/>

    <spring:url value="/resources/js/privateCabinetDynamic.js" var="privateCabinetDynamic"/>
    <script src="${privateCabinetDynamic}"></script>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

</head>
<body>

<security:authorize access= "hasAnyRole('ROLE_USER')" var= "isUSer"/>
<div id="header">
    <a href="${contextPath}" id="title">Smart Building Management System</a>

    <c:if test="${isUSer}">
        <div class="aboutUserLine">
            Hello,
            <security:authentication property="principal.username"/>
            <a class="logoutLink" href="<c:url value="/logout" />">(Logout)</a>
        </div>
    </c:if>

    <h1 id="privatCabTitle">Private Cabinet</h1>
</div>




<div class='selector'>
    <img src="${contextPath}/resources/photos/Setting.png" id="rounding"/>
    <img src="${contextPath}/resources/photos/Temp.png" id="temp" class="roundMenu"/>
    <a href="<c:url value="/private-cabinet/smart-ventilation" />">
    <img src="${contextPath}/resources/photos/Vent.png" id="ventilation" class="roundMenu"/>
    </a>
    <img src="${contextPath}/resources/photos/Wi-Fi.png" id="wi-fi" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Sequ.png" id="security" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Res.png" id="resource" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Repair.png" id="repair" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Lock.png" id="lock" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Light.png" id="light" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Heat.png" id="heat" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Door.png" id="door" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Condition.png" id="condition" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Cam.png" id="camera" class="roundMenu"/>

</div>

</body>
</html>
