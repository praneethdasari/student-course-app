<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f5f6fa;
            --text-color: #2f3640;
            --border-color: #dcdde1;
            --error-color: #e84118;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-color);
            margin: 0;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            background-color: white;
            padding: 2.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }
        h2 {
            color: var(--primary-color);
            margin-top: 0;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            box-sizing: border-box;
            font-family: inherit;
        }
        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
        }
        .error-msg {
            color: var(--error-color);
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #357abd;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            text-align: center;
        }
        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: var(--primary-color);
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Student</h2>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">${errorMessage}</div>
        </c:if>

        <form:form action="${pageContext.request.contextPath}/students/edit/${student.id}" method="post" modelAttribute="student">
            <div class="form-group">
                <label for="name">Full Name</label>
                <form:input path="name" id="name" placeholder="Enter student's name"/>
                <form:errors path="name" cssClass="error-msg" />
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <form:input path="email" id="email" type="email" placeholder="Enter student's email"/>
                <form:errors path="email" cssClass="error-msg" />
            </div>

            <div class="form-group">
                <label for="course">Assign Course</label>
                <form:select path="course.id" id="course">
                    <form:option value="" label="-- Select a Course --"/>
                    <form:options items="${courses}" itemValue="id" itemLabel="title"/>
                </form:select>
                <form:errors path="course" cssClass="error-msg" />
            </div>

            <button type="submit" class="btn">Update Student</button>
        </form:form>
        
        <a href="${pageContext.request.contextPath}/students" class="back-link">&larr; Back to List</a>
    </div>
</body>
</html>
