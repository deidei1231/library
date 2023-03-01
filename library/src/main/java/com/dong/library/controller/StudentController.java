package com.dong.library.controller;

import com.dong.library.entity.Student;
import com.dong.library.repository.StudentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/students")
public class StudentController {
    @Autowired
    private StudentRepository studentRepository;

    /**
     * 查询所有Student
     * @return
     */
    @GetMapping("/findAll")
    public List<Student>list(){
        List<Student> studentList=studentRepository.findAll();
        return studentList;
    }

    /**
     * 查询student by id
     * @param id
     * @return
     */
    @GetMapping("/findById/{id}")
    public Student findById(@PathVariable("id") int id){
        Optional <Student> optionalStudent=studentRepository.findById(id);
        if(optionalStudent.isPresent()){
            Student student=optionalStudent.get();
            return  student;
        }
        return new Student();
    }




    @PostMapping("/add")
    public String add(@RequestBody Student student){
        Student save =studentRepository.save(student);
//        System.out.println(save);
        if(Objects.isNull(save)){
            return "";
        }

        return save.toString();
    }

    @PutMapping("/update")
    public String update(@RequestBody Student student){
        Student save =studentRepository.save(student);

        if(Objects.isNull(save)){
            return "error";
        }

        return "success";
    }

    @GetMapping("/searchByCard")
    public ResponseEntity<Object> searchByCard(@RequestParam("keyword") String keyword){

        List<Student> studentList = studentRepository.findByCardContaining(keyword);
        if(CollectionUtils.isEmpty(studentList)){
            return new ResponseEntity<>(null,HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(studentList, HttpStatus.OK);
    }

}
