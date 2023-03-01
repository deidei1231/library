package com.dong.library.repository;

import com.dong.library.entity.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SortRepository extends JpaRepository<Sort, Integer> {
    List<Sort> findByIdContainingOrNameContaining(Integer id, String name);
}
