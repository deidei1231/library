package com.dong.library.controller;

import com.dong.library.entity.Appoint;
import com.dong.library.repository.AppointRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/appoints")
public class AppointContrller {
    @Autowired
    private AppointRepository appointRepository;

    /**
     * 查询appoint表所有数据
     * @return
     */
    @GetMapping("/findAll")
    public List<Appoint> list(){
        List <Appoint>appointList=appointRepository.findAll();
        return appointList;
    }
//    添加appoint数据
    @PostMapping("/add")
    public boolean add(@RequestBody Appoint appoint){
        Appoint save =appointRepository.save(appoint);
        if(Objects.isNull(save)){
            return false;
        }
        return true;
    }
}
