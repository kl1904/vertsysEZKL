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
        <c:choose>
            <c:when test="${edit}">
                Gericht bearbeiten
            </c:when>
            <c:otherwise>
                Gericht anlegen
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/task_edit.css"/>" />
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
        <li class="nav-item">
        <a class="nav-link active" id="myprofile" data-toggle="tab" href="<c:url value="/app/tasks/benutzerverwaltung/"/>" role="tab" aria-controls="contact" aria-selected="false">Mein Benutzer</a>
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
            <div class="column">
                <%-- CSRF-Token --%>
                <input type="hidden" name="csrf_token" value="${csrf_token}">
 
                <%-- Eingabefelder --%>
                <label for="task_owner">Eigentümer:</label>
                <input type="text" class="form-control"  name="task_owner" value="${task_form.values["task_owner"][0]}" readonly="readonly">
                <label for="task_category">Mahlzeiten:</label>
                <div class="side-by-side">
                    <select class="form-control"  name="task_category">
                        <option value="">Keine Mahlzeiten</option>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.id}" ${task_form.values["task_category"][0] == category.id.toString() ? 'selected' : ''}>
                                <c:out value="${category.name}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <label for="task_due_date">
                    Fällig am:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side">
                    <input class="form-control"   type="text" name="task_due_date" value="${task_form.values["task_due_date"][0]}">
                    <input class="form-control"   type="text" name="task_due_time" value="${task_form.values["task_due_time"][0]}">
                </div>

                <label for="task_status">
                    Gerichtskategorie:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side margin">
                    <select class="form-control"  name="task_status">
                        <c:forEach items="${statuses}" var="status">
                            <option value="${status}" ${task_form.values["task_status"][0] == status ? 'selected' : ''}>
                                <c:out value="${status.label}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <label for="task_short_text">
                    Bezeichnung:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side">
                    <input class="form-control"   type="text" name="task_short_text" value="${task_form.values["task_short_text"][0]}">
                </div>

                <label for="task_long_text">
                    Beschreibung:
                </label>
                <div class="side-by-side">
                    <textarea rows="5" class="form-control"   name="task_long_text"><c:out value="${task_form.values['task_long_text'][0]}"/></textarea>
                </div>

                <%-- Button zum Abschicken --%>
                <div class="side-by-side">
                    <button class="btn btn-secondary" type="submit" name="action" value="save">
                        Sichern
                    </button>

                    <c:if test="${edit}">
                        <button class="btn btn-secondary" type="submit" name="action" value="delete">
                            Löschen
                        </button>
                    </c:if>
                </div>
            </div>

            <%-- Fehlermeldungen --%>
            <c:if test="${!empty task_form.errors}">
                <ul class="errors">
                    <c:forEach items="${task_form.errors}" var="error">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </c:if>
        </form>
    </jsp:attribute>
</template:base>