<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tasks</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        color: #343a40;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2, h3 {
        color: #50221a;
    }

    .list-group-item {
        border: 1px solid rgba(0, 0, 0, 0.125) !important; /* Add !important to override Bootstrap styles */
    }

    .list-group-item p {
        margin-bottom: 0;
    }

    .list-group-item strong {
        color: #6c757d;
    }

    .btn {
        background-color: #0056b3;
        border-color: ##0056b3;
        margin-left:540px;
    }

    .btn:hover {
        background-color: #539ced;
        border-color: #539ced;
    }
</style>

</head>
<body>
    <div class="container">

        <h2>Project: ${project.title}</h2>
        <p>Project Lead: ${project.lead.firstName} ${project.lead.lastName}</p>

        <!-- Display form for adding a new task -->
        <form:form action="/projects/${project.id}/tasks" method="post" modelAttribute="newTask">
            <div class="mb-3 row">
                <label for="task" class="col-md-4 col-form-label">Add a task ticket for this team:</label>
                <div class="col-md-6">
                    <form:errors path="task" class="text-danger"/>
                    <form:textarea rows="4" class="form-control" path="task" id="task"></form:textarea>
                </div>
            </div>
            <button type="submit" class="btn btn-secondary">Add Task</button>
        </form:form>

        <!-- Display existing tasks -->
        <div class="mt-5">
            <h3>Tasks</h3>
            <ul class="list-group">
                <c:forEach var="task" items="${tasks}">
                    <li class="list-group-item">
                        <strong>
                            <p>Added by: ${task.user.firstName} ${task.user.lastName} at ${task.createdAt}</p>
                        </strong>
                        <p>${task.task}</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</body>
</html>
