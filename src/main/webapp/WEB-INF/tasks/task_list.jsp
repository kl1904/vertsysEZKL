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
        Liste der Gerichte
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/task_list.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
        <a class="nav-link " id="home-tab" data-toggle="tab" href="<c:url value="/app/dashboard/"/>" role="tab" aria-controls="home" aria-selected="true">Dashboard</a>
        </li>
        <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="<c:url value="/app/tasks/list/"/>" role="tab" aria-controls="home" aria-selected="true">Alle Gerichte</a>
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
        <%-- Suchfilter --%>
        <form method="GET" class="horizontal" id="search">
            <div class="input-group mb-3" >
            <input type="text" name="search_text" value="${param.search_text}" class="form-control" placeholder="Beschreibung" aria-label="Recipient's username" aria-describedby="basic-addon2">
            
            
           

            <select class="form-control"   name="search_category">
                <option value="">Alle Mahlzeiten</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}" ${param.search_category == category.id ? 'selected' : ''}>
                        <c:out value="${category.name}" />
                    </option>
                </c:forEach>
            </select>

            <select class="form-control"   name="search_status">
                <option value="">Alle Gerichtskategorien</option>
                <c:forEach items="${statuses}" var="status">
                    <option value="${status}" ${param.search_status == status ? 'selected' : ''}>
                        <c:out value="${status.label}"/>
                    </option>
                </c:forEach>
            </select>
            <button class="btn btn-secondary" type="submit">Suchen</button>
            </div>
        </form>

        <%-- Gefundene Aufgaben --%>
        <c:choose>
            <c:when test="${empty tasks}">
                <p>
                    Es wurden keine Aufgaben gefunden. 🐈
                </p>
            </c:when>
            <c:otherwise>
                <jsp:useBean id="utils" class="dhbwka.wwi.vertsys.javaee.vertsysEZKL.common.web.WebUtils"/>
                
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Bezeichnung</th>
                            <th scope="col">Kategorie</th>
                            <th scope="col">Eigentümer</th>
                            <th scope="col">Gerichtskategorie</th>
                            <th scope="col">Fällig am</th>
                        </tr>
                    </thead>
                    <c:forEach items="${tasks}" var="task">
                        <tr>
                            <td>
                                <a href="<c:url value="/app/tasks/task/${task.id}/"/>">
                                    <c:out value="${task.shortText}"/>
                                </a>
                            </td>
                            <td>
                                <c:out value="${task.category.name}"/>
                            </td>
                            <td>
                                <c:out value="${task.owner.username}"/>
                            </td>
                            <td>
                                <c:out value="${task.status.label}"/>
                            </td>
                            <td>
                                <c:out value="${utils.formatDate(task.dueDate)}"/>
                                <c:out value="${utils.formatTime(task.dueTime)}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>
</template:base>