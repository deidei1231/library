package com.dong.library.controller;

import com.dong.library.entity.Manager;
import com.dong.library.repository.ManagerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/managers")
public class ManagerController {
    @Autowired
    private ManagerRepository managerRepository;

    /**
     * 获取所有员工
     * @return
     */
    @GetMapping("/findAll")
    public List<Manager> list(){
        List<Manager>managerList=managerRepository.findAll();
        return managerList;
    }

    /**
     *  to getting  manager by id
     * @param id
     * @return
     */
    @GetMapping("/findById/{id}")
    public Manager findById(@PathVariable int id){
        Optional <Manager> optionalManager=managerRepository.findById(id);
        if(optionalManager.isPresent()){
            Manager manager=optionalManager.get();
            return manager;
        }
        return new Manager();
    }

    @PutMapping("/update")
    public String update(@RequestBody Manager manager){
        Manager save =managerRepository.save(manager);

        if(Objects.isNull(save)){
            return "error";
        }

        return "success";
    }
    @PostMapping("/add")
    public boolean add(@RequestBody Manager manager){
        Manager save = managerRepository.save(manager);
        if(Objects.isNull(save)){
            return false;
        }
        return true;
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") int id){
        managerRepository.deleteById(id);
    }

}
