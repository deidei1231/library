package com.dong.library.controller;

import com.dong.library.entity.Brrow;
import com.dong.library.entity.Rank;
import com.dong.library.repository.BrrowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/brrows")
public class BrrowController {
    @Autowired
    private BrrowRepository brrowRepository;

    /**
     * 查询所有的brrow表
     *
     * @return
     */
    @GetMapping("/findAll")
    public List<Brrow> list() {
        List<Brrow> brrowList = brrowRepository.findAll();
        System.out.println(brrowList);
        List<Brrow> tempBrrowList = brrowList;
        System.out.println(tempBrrowList);

        return brrowList;
    }

    /**
     * 查看排名
     *
     * @return
     */
    @GetMapping("/findRank")
    public List<Rank> brrList() throws IndexOutOfBoundsException {
        List<Brrow> brrowList = brrowRepository.findAll();
        List<Rank> rankList = new ArrayList<>();
        int length = brrowList.size();
        int t=length-1;

        int i,j;
        for ( i = 0; i < t-1; i++) {
            int count = 1;
            Rank rank = new Rank();
            for (j = t; j > i; j--) {

                if (brrowList.get(i).getBookId().equals(brrowList.get(j).getBookId()) ) {
                    count++;
                    brrowList.remove(j);
                    t--;
                }
            }
            rank.setBrrCount(count);
            rank.setId(brrowList.get(i).getBookId());
            rank.setName(brrowList.get(i).getBookName());
            rankList.add(rank);
        }
        //List.sort()
        rankList.sort(Comparator.comparing(Rank::getBrrCount).reversed());
        return rankList;
    }

    /**
     * 添加brrow记录
     *
     * @param brrow
     * @return
     */
    @PostMapping("/add")
    public boolean add(@RequestBody Brrow brrow) {
        Brrow save = brrowRepository.save(brrow);
//        System.out.println(save);
        if (Objects.isNull(save)) {
            return false;
        }
        return true;
    }

    @GetMapping("/searchByStuId")
    public ResponseEntity<Object> searchByStuId(@RequestParam("keyword") String keyword) {
//        System.out.println(keyword);
        List<Brrow> brrowList = brrowRepository.findByStuIdContaining(keyword);
        if (CollectionUtils.isEmpty(brrowList)) {
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(brrowList, HttpStatus.OK);
    }

    @GetMapping("/searchByBookId")
    public ResponseEntity<Object> searchByBookId(@RequestParam("keyword") String keyword) {
//        System.out.println(keyword);
        List<Brrow> brrowList = brrowRepository.findByBookId(keyword);
        if (CollectionUtils.isEmpty(brrowList)) {
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(brrowList, HttpStatus.OK);
    }

    @PutMapping("/update")
    public String update(@RequestBody Brrow brrow) {
        Brrow save = brrowRepository.save(brrow);
        if (Objects.isNull(save)) {
            return "error";
        }
        return "success";
    }
}
