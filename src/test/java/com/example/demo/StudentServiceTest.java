package com.example.demo;

import com.example.demo.entity.Course;
import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.StudentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.dao.DataIntegrityViolationException;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class StudentServiceTest {

    @Mock
    private StudentRepository studentRepository;

    @InjectMocks
    private StudentService studentService;

    private Student student1;
    private Student student2;
    private Course course;

    @BeforeEach
    void setUp() {
        course = new Course(1L, "Test Course", "Description");
        student1 = new Student(1L, "John Doe", "john@gmail.com", course);
        student2 = new Student(2L, "Jane Doe", "jane@gmail.com", course);
    }

    @Test
    void getAllStudentsWithCourses_ShouldReturnStudents() {
        when(studentRepository.findAllStudentsWithCourses()).thenReturn(Arrays.asList(student1, student2));

        List<Student> result = studentService.getAllStudentsWithCourses();

        assertEquals(2, result.size());
        verify(studentRepository, times(1)).findAllStudentsWithCourses();
    }

    @Test
    void getStudentById_ShouldReturnStudent_WhenFound() {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student1));

        Student result = studentService.getStudentById(1L);

        assertNotNull(result);
        assertEquals("John Doe", result.getName());
    }

    @Test
    void getStudentById_ShouldThrowException_WhenNotFound() {
        when(studentRepository.findById(3L)).thenReturn(Optional.empty());

        assertThrows(IllegalArgumentException.class, () -> studentService.getStudentById(3L));
    }

    @Test
    void saveStudent_ShouldReturnSavedStudent() {
        when(studentRepository.save(any(Student.class))).thenReturn(student1);

        Student result = studentService.saveStudent(student1);

        assertNotNull(result);
        assertEquals("john@gmail.com", result.getEmail());
        verify(studentRepository, times(1)).save(student1);
    }

    @Test
    void saveStudent_ShouldThrowException_OnDataIntegrityViolation() {
        when(studentRepository.save(any(Student.class))).thenThrow(DataIntegrityViolationException.class);

        assertThrows(IllegalArgumentException.class, () -> studentService.saveStudent(student1));
    }

    @Test
    void updateStudent_ShouldReturnUpdatedStudent() {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student1));
        when(studentRepository.save(any(Student.class))).thenReturn(student1);

        Student updatedDetails = new Student(1L, "John Updated", "john.updated@gmail.com", course);
        
        Student result = studentService.updateStudent(1L, updatedDetails);

        assertNotNull(result);
        assertEquals("John Updated", result.getName());
        assertEquals("john.updated@gmail.com", result.getEmail());
    }

    @Test
    void deleteStudent_ShouldDeleteStudent_WhenFound() {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student1));
        doNothing().when(studentRepository).delete(student1);

        studentService.deleteStudent(1L);

        verify(studentRepository, times(1)).delete(student1);
    }
}
