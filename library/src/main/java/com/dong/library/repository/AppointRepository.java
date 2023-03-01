package com.dong.library.repository;

import com.dong.library.entity.Appoint;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AppointRepository extends JpaRepository<Appoint, Integer> {
    List<Appoint> findByIdContainingOrBookIdContaining(Integer id, Integer bookId);
}
