package com.dong.library.controller;

import com.dong.library.entity.Book;
import com.dong.library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

/**
 * controller控制层
 */
@RestController
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookRepository bookRepository;

    /**
     * 查询所有图书
     * @return
     */
    @GetMapping("/findAll")
    public List<Book> list(){
        List<Book>bookList=bookRepository.findAll();
        return bookList;
    }
    @GetMapping("/findAll/{page}/{size}")
    public Page<Book> listByPage(@PathVariable("page") int page,@PathVariable("size") int size){
        Pageable pageable = PageRequest.of(page,size);
        Page<Book> all = bookRepository.findAll(pageable);
        return all;
    }

    /**
     * 根据id获取book
     * @param id
     * @return
     */
    @GetMapping("/findById/{id}")
    public Book findById(@PathVariable("id") int id){
        Optional<Book> optionalBook = bookRepository.findById(id);
        if(optionalBook.isPresent()){
            Book book = optionalBook.get();
            return book;
        }
        return new Book();
    }


    @PutMapping("update")
    public String update(@RequestBody Book book){
        Book save = bookRepository.save(book);
        if(Objects.isNull(save)){
            return "error";
        }
        return "success";
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") int id){
        bookRepository.deleteById(id);
    }

    @PostMapping("/add")
    public boolean add(@RequestBody Book book){
        Book save = bookRepository.save(book);
        if(Objects.isNull(save)){
            return false;
        }
        return true;
    }

    //根据书名查找
    @GetMapping("/search")
    public ResponseEntity<Object> search(@RequestParam("keyword") String keyword){
        List<Book> bookList = bookRepository.findByNameContaining(keyword);
        if(CollectionUtils.isEmpty(bookList)){
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }

    /**
     * 根据sort查询符合书籍
     * @param keyword
     * @return
     */
    @GetMapping("/searchBySort")
    public ResponseEntity<Object> searchBySort(@RequestParam("keyword") String keyword){
        System.out.println(keyword);
        List<Book> bookList = bookRepository.findBySortContaining(keyword);
        if(CollectionUtils.isEmpty(bookList)){
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }


}
