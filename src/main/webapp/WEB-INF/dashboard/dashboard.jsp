<%-- 
    Copyright © 2019 Dennis Schulmeister-Zimolong

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
        Dashboard
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/dashboard.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
        <a class="nav-link active " id="home-tab" data-toggle="tab" href="<c:url value="/app/dashboard/"/>" role="tab" aria-controls="home" aria-selected="true">Dashboard</a>
        </li>
        <li class="nav-item">
        <a class="nav-link  " id="home-tab" data-toggle="tab" href="<c:url value="/app/tasks/list/"/>" role="tab" aria-controls="home" aria-selected="true">Alle Gerichte</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="<c:url value="/app/tasks/task/new/"/>" role="tab" aria-controls="profile" aria-selected="false">Gerichte anlegen</a>
        </li>
        <li class="nav-item">
        <a class="nav-link " id="contact-tab" data-toggle="tab" href="<c:url value="/app/tasks/categories/"/>" role="tab" aria-controls="contact" aria-selected="false">Mahlzeiten bearbeiten</a>
        </li>
        <li class="nav-item">
        <a class="nav-link " id="myprofile" data-toggle="tab" href="<c:url value="/app/tasks/benutzerverwaltung/"/>" role="tab" aria-controls="contact" aria-selected="false">Mein Benutzer</a>
        </li>
        <c:if test="${not empty pageContext.request.userPrincipal}"> 
        <li>    
        <a class="nav-link active " id="home-tab" data-toggle="tab"  href="<c:url value="/logout/"/>" role="tab" aria-controls="home" aria-selected="true" class="icon-logout">Logout ${pageContext.request.userPrincipal.name}</a>
        </li>
        </c:if>
        </ul>
    </jsp:attribute>

    <jsp:attribute name="content">
        <c:choose>
            <c:when test="${empty sections}">
                <p>
                    Es wurden keine Dashboard-Kacheln gefunden. 🙈
                </p>
            </c:when>
            <c:otherwise>
                <jsp:useBean id="utils" class="dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.web.WebUtils"/>

                <c:forEach items="${sections}" var="section">
                    <h2>
                        <c:out value="${section.label}"/>
                    </h2>

                    <c:forEach items="${section.tiles}" var="tile">
                        <div class="tile ${tile.cssClass}">
                            <a href="<c:url value="${tile.href}"/>">
                                <div class="content">
                                    <div class="label">
                                        <c:out value="${tile.label}"/>
                                    </div>
                                    <div class="icon icon-${tile.icon}"></div>
                                    <div class="amount">
                                        <c:choose>
                                            <c:when test="${tile.showDecimals}">
                                                <c:out value="${utils.formatDouble(tile.amount)}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${utils.formatInteger(tile.amount)}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>
</template:base>