<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Project Manager Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

<div class="container mt-4">

    <div class="row">
        <div class="col-md-6">
            <h1 class="mb-4 text-info">Project Manager Dashboard</h1>
        </div>
        <div class="col-md-6 text-right">
            <p><a class="btn btn-danger" href="/logout">Log Out</a></p>
        </div>
    </div>

    <p class="lead mb-5">Welcome, ${user.firstName}</p>

    <hr>

    <div class="row">
        <div class="col-md-6">
            <h4>All Projects</h4>
        </div>
        <div class="col-md-6 text-right">
            <p><a class="btn btn-success" href="/projects/new">+ New Project</a></p>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Project</th>
            <th>Team Lead</th>
            <th>Due Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="project" items="${unassignedProjects}">
            <tr>
                <c:if test="${project.lead.id!=user.id}">
                    <td><a href="/projects/${project.id}">${project.title}</a></td>
                    <td><c:out value="${project.lead.firstName}"></c:out></td>
                    <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
                    <td><a class="btn btn-primary" href="/dashboard/join/${project.id}">Join Team</a></td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <hr>

    <h4>Your Projects</h4>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Project</th>
            <th>Team Lead</th>
            <th>Due Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="project" items="${assignedProjects}">
            <tr>
                <td><a href="/projects/${project.id}">${project.title}</a></td>
                <td><c:out value="${project.lead.firstName}"></c:out></td>
                <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
                <c:if test="${project.lead.id==user.id}">
                    <td><a class="btn btn-warning" href="/projects/edit/${project.id}">Edit Project</a></td>
                </c:if>
                <c:if test="${project.lead.id!=user.id}">
                    <td><a class="btn btn-danger" href="/dashboard/leave/${project.id}">Leave Team</a></td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
