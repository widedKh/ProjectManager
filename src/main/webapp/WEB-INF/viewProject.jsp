<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Details</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       
        body, h1, p {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }

        /* Center content on the page */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
          
          
          
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #deb887;
             display: inline-block; 
          
        }

        .dashboard-link {
            font-size: 18px;
            margin-bottom: 20px;
            text-decoration: none;
            color: #007bff;
            display: inline-block;
            margin-left: 400px; /* Add some spacing between the heading and link */
        }

        .dashboard-link:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #F5F5DC;
            color: black;
        }

        .delete-button {
            font-size: 18px;
            color: #fff;
            background-color: red;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .delete-button:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="container">
        
            <h1>Project Details</h1>
            <a href="/dashboard" class="dashboard-link">Dashboard</a>
        

        <table class="mt-5">
            <tbody>
                <tr>
                    <th>Project</th>
                    <td><c:out value="${project.title}" /></td>
                </tr>

                <tr>
                    <th>Description</th>
                    <td><c:out value="${project.description}" /></td>
                </tr>

                <tr>
                    <th>Due Date</th>
                    <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
                </tr>
            </tbody>
        </table>

        <c:choose>
    <c:when test="${project.lead.id == userId}">
        <!-- Display delete button for the lead -->
        <a href="/projects/delete/${project.id}"><button class="delete-button">Delete Project</button></a>
    </c:when>
    <c:when test="${project.lead.id != userId}">
        <!-- Display link to tasks page for non-lead users -->
        <a href="/projects/${project.id}/tasks">View Tasks</a>
    </c:when>
</c:choose>

    </div>


</body>
</html>
