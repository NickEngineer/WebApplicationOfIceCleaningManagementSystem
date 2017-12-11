<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>LoginPage</title>

    <spring:url value="/resources/bootstrap$JQuery/bootstrap/css/bootstrap.min.css" var="Bootstrap"/>
    <spring:url value="/resources/bootstrap$JQuery/jquery-3.2.1.min.js" var="defineJQuery"/>

    <link href="${Bootstrap}" rel="stylesheet" var="Bootstrap"/>
    <script src="${defineJQuery}"></script>

    <c:if test="${cssCondition.addStyles}">
        <spring:url value="/resources/css/invalidEnterSystemPageStyle.css" var="crunchifyCSS"/>
        <spring:url value="/resources/js/dynamic.js" var="jqueryJs"/>

        <link href="${crunchifyCSS}" rel="stylesheet" var="crunchifyCSS"/>
        <script src="${jqueryJs}"></script>
    </c:if>

    <spring:url value="/resources/css/enterSystemPageStyle.css" var="InvalidEnterDataCSS"/>
    <link href="${InvalidEnterDataCSS}" rel="stylesheet" var="crunchifyCSS"/>

    <spring:url value="/resources/css/generalSystemPagesStyle.css" var="generalCssSettings"/>
    <link href="${generalCssSettings}" rel="stylesheet" var="generalCssSettings"/>

    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
<body>
<a href="${contextPath}" id="title">Smart Building Management System</a>
<div class="wrapper" id="login">
    <form:form modelAttribute="userFromServer" method="POST"
               action="${contextPath}/validate/check" class="form-signin">
        <h2 class="form-signin-heading">Please login</h2>
        <form:input path="login" id="login" type="text" class="form-control" name="username" placeholder="Email Address"
                    required="" autofocus=""/>
        <form:input path="password" id="password" type="password" class="form-control" name="password"
                    placeholder="Password" required=""/>
        <div id="crunchifyMessage"></div>
        <label class="checkbox">
            <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
        </label>
        <form:button class="btn btn-lg btn-primary btn-block" type="submit">Login</form:button>
        <form:button class="btn btn-lg btn-secondary btn-block" id="registrationLink"
                     type="button">Registration</form:button>
    </form:form>
</div>
</body>
</html>
