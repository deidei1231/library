package com.dong.library.repository;

import com.dong.library.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Integer> {

    List<Book> findByNameContainingOrAuthorContaining(String name, String author);

    List<Book> findByNameContaining(String name);

    List<Book> findBySortContaining(String sort);

}
