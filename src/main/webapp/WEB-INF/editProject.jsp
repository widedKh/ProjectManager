<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Edit Project</title>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 50px;
            width:50%;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-secondary,
        .btn-primary {
            margin-right: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row mb-4">
            <div class="col-10 text-center">
                <h1 class="text-danger">Edit Project</h1>
            </div>
            <div class="col text-end">
                <a href="/dashboard" class="text-primary">Dashboard</a>
            </div>
        </div>

        <form:form action="/projects/edit/${project.id}" method="post" modelAttribute="project" class="mt-3">
            <div class="mb-3 row">
                <label for="title" class="form-label col-sm-3">Project Title:</label>
                <div class="col-sm-6">
                    <form:errors path="title" class="text-danger" />
                    <form:input class="form-control" path="title" value="${project.title}" />
                </div>
            </div>

            <div class="mb-3 row">
                <label for="description" class="form-label col-sm-3">Project Description:</label>
                <div class="col-sm-7">
                    <form:errors path="description" class="text-danger" />
                    <form:textarea rows="4" class="form-control" path="description" value="${project.description}" />
                </div>
            </div>

            <div class="mb-3 row">
                <label for="dueDate" class="form-label col-sm-3">Due Date:</label>
                <div class="col-sm-7">
                    <form:errors path="dueDate" class="text-danger" />
                    <form:input path="dueDate" type="date" class="form-control" value="${project.dueDate}" />
                </div>
            </div>

            <div class="mb-4 mt-5">
                <a class="btn btn-secondary" href="/dashboard">Cancel</a>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form:form>
    </div>

    
</body>

</html>
