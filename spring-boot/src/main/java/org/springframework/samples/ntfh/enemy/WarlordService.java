package org.springframework.samples.ntfh.enemy;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class WarlordService {
    
    @Autowired
    private WarlordRepository warlordRepository;

    @Transactional
    public Integer warlordCount() {
        return (int) warlordRepository.count();
    }

    @Transactional
    public Iterable<Warlord> findAll() {
        return warlordRepository.findAll();
    }

    @Transactional
    public Optional<Warlord> findWarlordById(Integer id) {
        return warlordRepository.findById(id);
    }

}
