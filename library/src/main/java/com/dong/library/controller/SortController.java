package com.dong.library.controller;

import com.dong.library.entity.Sort;
import com.dong.library.repository.SortRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/sorts")
public class SortController {
    @Autowired
    private SortRepository sortRepository;

    @GetMapping("/findAll")
    public List<Sort>list(){
        List<Sort>sortList=sortRepository.findAll();
        return sortList;
    }
    @GetMapping("/findById/{id}")
    public Sort findById(@PathVariable("id") int id){
        Optional<Sort> optionalBook = sortRepository.findById(id);
        if(optionalBook.isPresent()){
            Sort sort = optionalBook.get();
            return sort;
        }
        return new Sort();
    }

    @PutMapping("update")
    public String update(@RequestBody Sort sort){
        Sort save = sortRepository.save(sort);
        if(Objects.isNull(save)){
            return "error";
        }
        return "success";
    }
    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") int id){
        sortRepository.deleteById(id);
    }

    @PostMapping("/add")
    public boolean add(@RequestBody Sort book){
        Sort save = sortRepository.save(book);
        if(Objects.isNull(save)){
            return false;
        }
        return true;
    }
}
