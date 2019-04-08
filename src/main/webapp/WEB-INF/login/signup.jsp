<%-- 
    Copyright © 2018 Dennis Schulmeister-Zimolong

    E-Mail: dhbw@windows3.de
    Webseite: https://www.wpvs.de/

    Dieser Quellcode ist lizenziert unter einer
    Creative Commons Namensnennung 4.0 International Lizenz.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="base_url" value="<%=request.getContextPath()%>" />

<template:base>
    <jsp:attribute name="title">
        Registrierung
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/login.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
        <a class="nav-link " id="home-tab" data-toggle="tab" href="<c:url value="/logout/"/>" role="tab" aria-controls="home" aria-selected="true">Login</a>
        </li>
        <li class="nav-item">
        <a class="nav-link active"  id="home-tab" data-toggle="tab" href="<c:url value="/signup/"/>" role="tab" aria-controls="home" aria-selected="true">Registrieren</a>
        </li>
    </jsp:attribute>

    <jsp:attribute name="content">
        <div class="container">
            <form method="post" class="stacked">
                <div class="column">
                    <%-- CSRF-Token --%>
                    <input type="hidden" class="form-control" name="csrf_token" value="${csrf_token}">
                    
                    <div class="side-by-side">
                    <input type="text" class="form-control" name="vorname" placeholder="Vorname" value="${signup_form.values["vorname"][0]}" >
                    </div>
                    <br>
                    <div class="side-by-side">
                    <input type="text" class="form-control" name="nachname" placeholder="Nachname" value="${signup_form.values["nachname"][0]}" >
                    </div>
                    <br>

                    <%-- Eingabefelder --%>
                    <%--<label for="signup_username">
                        Benutzername:
                        <span class="required">*</span>
                    </label>--%>
                    <div class="side-by-side">
                    <input type="text" class="form-control" name="signup_username" placeholder="Benutzername" value="${signup_form.values["signup_username"][0]}" >
                    </div>
                    <br>
                    <%--<label for="signup_password1">
                        Passwort:
                        <span class="required">*</span>
                    </label>--%>
                    <div class="side-by-side">
                        <input type="password" class="form-control" name="signup_password1" placeholder="Passwort" value="${signup_form.values["signup_password1"][0]}">
                    </div>
                    <br>
                    <%--<label for="signup_password2">
                        Passwort (wdh.):
                        <span class="required">*</span>
                    </label>--%>
                    <div class="side-by-side">
                        <input type="password" class="form-control" name="signup_password2" placeholder="Passwort (wdh.)" value="${signup_form.values["signup_password2"][0]}">
                    </div>
                    <br>
                    <%-- Button zum Abschicken --%>
                    <div class="side-by-side">
                        <button class="btn btn-secondary" type="submit">
                            Registrieren
                        </button>
                    </div>
                </div>

                <%-- Fehlermeldungen --%>
                <c:if test="${!empty signup_form.errors}">
                    <ul class="errors">
                        <c:forEach items="${signup_form.errors}" var="error">
                            <li>${error}</li>
                            </c:forEach>
                    </ul>
                </c:if>
            </form>
        </div>
    </jsp:attribute>
</template:base>