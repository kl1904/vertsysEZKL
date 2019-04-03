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
        Kategorien bearbeiten
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/category_list.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
        <a class="nav-link " id="home-tab" data-toggle="tab" href="<c:url value="/app/dashboard/"/>" role="tab" aria-controls="home" aria-selected="true">Dashboard</a>
        </li>
        <li class="nav-item">
        <a class="nav-link  " id="home-tab" data-toggle="tab" href="<c:url value="/app/tasks/list/"/>" role="tab" aria-controls="home" aria-selected="true">Alle Gerichte</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="<c:url value="/app/tasks/task/new/"/>" role="tab" aria-controls="profile" aria-selected="false">Gerichte anlegen</a>
        </li>
        <li class="nav-item">
        <a class="nav-link active" id="contact-tab" data-toggle="tab" href="<c:url value="/app/tasks/categories/"/>" role="tab" aria-controls="contact" aria-selected="false">Mahlzeiten bearbeiten</a>
        </li>
        <c:if test="${not empty pageContext.request.userPrincipal}"> 
        <li>    
        <a class="nav-link active " id="home-tab" data-toggle="tab"  href="<c:url value="/logout/"/>" role="tab" aria-controls="home" aria-selected="true" class="icon-logout">Logout ${pageContext.request.userPrincipal.name}</a>
        </li>
        </c:if>
        </ul>
    </jsp:attribute>

    <jsp:attribute name="content">
        <form method="post" class="stacked">
            <%-- CSRF-Token --%>
            <input type="hidden" name="csrf_token" value="${csrf_token}">

            <%-- Feld zum Anlegen einer neuen Kategorie --%>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Neue Mahlzeit" aria-label="Neue Mahlzeit" aria-describedby="basic-addon2" name="name" value="${categories_form.values["name"][0]}">
                <br>
                <button type="submit" name="action" value="create" class="btn btn-secondary">
                    Anlegen
                </button>
            </div>

            <%-- Fehlermeldungen --%>
            <c:if test="${!empty categories_form.errors}">
                <ul class="errors margin">
                    <c:forEach items="${categories_form.errors}" var="error">
                        <li>${error}</li>
                        </c:forEach>
                </ul>
            </c:if>

            <%-- Vorhandene Kategorien --%>
            <c:choose>
                <c:when test="${empty categories}">
                    <p>
                        Es sind noch keine Mahlzeiten vorhanden. 🐏
                    </p>
                </c:when>
                <c:otherwise>
                    <div>
                        <div class="margin">
                            <c:forEach items="${categories}" var="category">
                                <input type="checkbox" name="category" id="${'category-'.concat(category.id)}" value="${category.id}" />
                                <label for="${'category-'.concat(category.id)}">
                                    <c:out value="${category.name}"/>
                                </label>
                                <br />
                            </c:forEach>
                        </div>

                        <button type="submit" name="action" value="delete" class="icon-trash">
                            Markierte löschen
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
        </form>
    </jsp:attribute>
</template:base>