<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>New Project</title>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h2>Create a New Project</h2>
                </div>
                <div class="card-body">
                    <form:form action="/projects/new" method="post" modelAttribute="project">
                        <div class="mb-3 row">
                            <label for="title" class="col-md-4 col-form-label">Project Title:</label>
                            <div class="col-md-5">
                                <form:errors path="title" class="text-danger"/>
                                <form:input class="form-control" path="title" id="title"/>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="description" class="col-md-4 col-form-label">Project Description:</label>
                            <div class="col-md-6">
                                <form:errors path="description" class="text-danger"/>
                                <form:textarea rows="4" class="form-control" path="description" id="description"></form:textarea>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="dueDate" class="col-md-4 col-form-label">Due Date:</label>
                            <div class="col-md-6">
                                <form:errors path="dueDate" class="text-danger"/>
                                <form:input path="dueDate" type="date" class="form-control" id="dueDate"/>
                            </div>
                        </div>

                        <form:errors path="lead" class="error"/>
                        <form:input type="hidden" path="lead" value="${userId}" class="form-control"/>

                        <div class="m-5">
                            <a class="btn btn-secondary" href="/dashboard">Cancel</a>
                            <button class="btn btn-primary" type="submit">Submit</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
