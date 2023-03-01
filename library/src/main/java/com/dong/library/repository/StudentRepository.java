package com.dong.library.repository;

import com.dong.library.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Integer> {
    List<Student> findByIdContainingOrNameContaining(Integer id, String name);

    List<Student> findByCardContaining(String card);

    List<Student> findByTel(String tel);
}
