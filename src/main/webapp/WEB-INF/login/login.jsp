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

<template:base>
    <jsp:attribute name="title">
        Login
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/login.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
        <a class="nav-link active " id="home-tab" data-toggle="tab" href="<c:url value="/logout/"/>" role="tab" aria-controls="home" aria-selected="true">Login</a>
        </li>
        <li class="nav-item">
        <a class="nav-link " id="home-tab" data-toggle="tab" href="<c:url value="/signup/"/>" role="tab" aria-controls="home" aria-selected="true">Registrieren</a>
        </li>
    </jsp:attribute>

    <jsp:attribute name="content">
        <div class="container">
            <form action="j_security_check" method="post" class="stacked">
                    <%-- Eingabefelder --%>
                    <%--<label for="j_username">
                    Benutzername:
                    <span class="required">*</span>
                    </label>>--%>
                    <input type="text" class="form-control" aria-label="Benutzername" aria- name="j_username" placeholder="Benutzername">
                    <%--<label for="j_password">
                        Passwort:
                        <span class="required">*</span>
                    </label>--%>
                    <br>
                    <input type="password" class="form-control"  name="j_password" placeholder="Passwort">
                    <br>
                    <%-- Button zum Abschicken --%>
                    <button class="btn btn-secondary" type="submit">
                        Einloggen
                    </button>
            </form>
        </div>
    </jsp:attribute>
</template:base>