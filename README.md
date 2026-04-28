# Student-Course Management System

A full-stack Spring Boot application that manages **Students** and **Courses**, demonstrating complete CRUD operations, database relationships, and a beautifully styled JSP-based user interface.

## 🚀 Features

- **Entity Relationship Mapping**: Connects `Student` to `Course` using JPA `@ManyToOne` mapping.
- **Inner Join Queries**: Custom Spring Data JPA `@Query` to efficiently fetch students and their enrolled courses simultaneously.
- **Validation**: Strict validation with robust error handling for forms (e.g., stopping duplicate emails via `DataIntegrityViolationException`).
- **Responsive UI**: A highly polished, vanilla-CSS driven frontend leveraging Jakarta EE standard tags (`<c:forEach>`, `<form:form>`).
- **Unit Testing**: Contains thorough business-logic tests built on top of JUnit 5 and Mockito.

## 💻 Tech Stack

- **Backend**: Java 17, Spring Boot 3.2.x, Spring Data JPA, Hibernate.
- **Database**: H2 In-Memory Database (auto-populated with 10 sample records on boot).
- **Frontend**: Java Server Pages (JSP), JSTL, Spring Form Tags, Vanilla CSS.

## 🛠️ How to Run Locally

### Prerequisites
Make sure you have **Java 17** and **Maven** installed on your system.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/praneethdasari/student-course-app.git
   cd student-course-app
   ```
2. Build and run the project using Maven:
   ```bash
   mvn clean spring-boot:run
   ```
3. Open your browser and navigate to the application:
   ```
   http://localhost:8080/students
   ```

## 📖 Additional Documentation
For deeper details regarding the technical approach, entity relationship diagrams, and solutions to implementation challenges, please refer to the [Project_Documentation.md](Project_Documentation.md).
