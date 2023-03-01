package com.dong.library.repository;

import com.dong.library.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
    List<Admin> findByIdContainingOrNameContaining(Integer id, String name);
}
