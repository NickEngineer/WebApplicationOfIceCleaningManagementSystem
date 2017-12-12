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
<a href="${contextPath}" id="title">Smart Building Management System</a>
<br><b>Private Cabinet</b>

<security:authorize access= "hasAnyRole('ROLE_ADMIN','ROLE_SUPER_USER', 'ROLE_USER')" var= "isUSer"/>


<c:if test= "${not isUSer}">
    <li style= "padding-top: 15px; padding-bottom: 15px; color: red">
        <c:if test= "${empty param.error}">
            Вы не вошли в приложение
        </c:if>
    </li>
    <li> <a style= "color: Green;" href= "<c:url value= ""/>">Login</a> </li>
</c:if>

<div></div>

<c:if test= "${isUSer}">
    <li style= "padding-top: 15px; padding-bottom: 15px; color: green">
        Вы вошли как:
        <security:authentication property= "principal.username"/> с ролью:
        <b><security:authentication property= "principal.authorities"/></b>

    </li>
    <li> <a style= "color: red;" href= "<c:url value= "/logout"/>">Logout</a> </li>
    <li></li>
    <a id="logoutLink" href="<c:url value="/logout" />">Logout2</a>
    <a id="logoutLink" href="<c:url value="/private-cabinet/smart-ventilation" />">Smart Ventilation System</a>

</c:if>

<div class='selector'>
    <img src="${contextPath}/resources/photos/Setting.png" id="rounding"/>
    <img src="${contextPath}/resources/photos/Temp.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Vent.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Wi-Fi.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Sequ.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Res.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Repair.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Lock.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Light.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Heat.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Door.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Condition.png" class="roundMenu"/>
    <img src="${contextPath}/resources/photos/Cam.png" class="roundMenu"/>



    <button>Choose the next step</button>
</div>

</body>
</html>
