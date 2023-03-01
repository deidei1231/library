package com.dong.library.repository;

import com.dong.library.entity.Brrow;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BrrowRepository extends JpaRepository<Brrow, Integer> {
    /**
     * 借阅表id  bookid
     *
     * @param id
     * @param bookId
     * @return
     */
    List<Brrow> findByIdContainingOrBookIdContaining(Integer id, Integer bookId);

    List<Brrow> findByStuIdContaining(String stuId);

    List<Brrow> findByBookId(String bookId);
}
