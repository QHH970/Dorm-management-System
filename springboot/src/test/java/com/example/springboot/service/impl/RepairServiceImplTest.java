package com.example.springboot.service.impl;

import com.example.springboot.entity.Repair;
import com.example.springboot.mapper.RepairMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class RepairServiceImplTest {

    @Mock
    private RepairMapper repairMapper;

    @InjectMocks
    private com.example.springboot.service.impl.RepairServiceImpl repairService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void addNewOrder_success() {
        Repair r = new Repair();
        r.setTitle("leak");
        when(repairMapper.insert(any(Repair.class))).thenReturn(1);

        int res = repairService.addNewOrder(r);
        assertEquals(1, res);
        verify(repairMapper,times(1)).insert(r);
    }

    @Test
    void deleteOrder_notFound_returnsZero() {
        when(repairMapper.deleteById(999)).thenReturn(0);
        int res = repairService.deleteOrder(999);
        assertEquals(0, res);
        verify(repairMapper,times(1)).deleteById(999);
    }
}
