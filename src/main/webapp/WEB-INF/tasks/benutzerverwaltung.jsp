<%-- 
    Document   : Benutzerverwaltung
    Created on : 05.04.2019, 15:39:01
    Author     : KE_LE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<template:base>

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
        <a class="nav-link active" id="myprofile" data-toggle="tab" href="<c:url value="/app/tasks/Benutzerverwaltung/"/>" role="tab" aria-controls="contact" aria-selected="false">Mein Benutzer</a>
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
            <div class="card" style="width:50%">
                <div class="card-body">
                    <%-- CSRF-Token --%>
                    <input type="hidden" name="csrf_token" value="${csrf_token}">

                    <%-- Eingabefelder --%>
                    <label for="benutzername">Benutzername:</label>
                    <div class="side-by-side">
                        <input type="text" name="benutzername" value="${benutzer.username}" readonly="readonly">
                    </div>

                    <label for="vorname">Vorname:</label>
                    <div class="side-by-side">
                        <input type="text" name="vorname" value="${benutzer.vorname}">
                    </div>

                    <label for="nachname">Nachname:</label>
                    <div class="side-by-side">
                        <input type="text" name="nachname" value="${benutzer.nachname}">
                    </div>
                    
                    <br>
                    <br>
                    <%-- Button zum Sichern --%>
                    <div class="side-by-side">
                        <button type="submit" class="btn btn-primary">
                            Speichern
                        </button>
                    </div>
                </div>
            </div>


        </form>
    </jsp:attribute>
</template:base>
