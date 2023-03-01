package com.dong.library.repository;

import com.dong.library.entity.Manager;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ManagerRepository extends JpaRepository<Manager, Integer> {
    List<Manager> findByIdContainingOrNameContaining(Integer id, String name);

}
