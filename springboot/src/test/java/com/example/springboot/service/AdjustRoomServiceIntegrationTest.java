package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.AdjustRoom;
import com.example.springboot.mapper.AdjustRoomMapper;
import com.example.springboot.service.impl.AdjustRoomServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@SpringBootTest
class AdjustRoomServiceIntegrationTest {

    @Autowired
    private AdjustRoomServiceImpl adjustRoomService;

    @MockBean
    private AdjustRoomMapper adjustRoomMapper;

    @Test
    void springContextLoads_andServiceWired() {
        assertNotNull(adjustRoomService);
    }

    @Test
    void addApply_viaSpringContext() {
        AdjustRoom adj = new AdjustRoom();
        adj.setUsername("int-stu");
        when(adjustRoomMapper.insert(any(AdjustRoom.class))).thenReturn(1);

        int res = adjustRoomService.addApply(adj);
        assertEquals(1, res);
    }

    @Test
    void find_returnsPage_viaSpringContext() {
        Page<?> page = new Page<>(1,5);
        when(adjustRoomMapper.selectPage(any(Page.class), any())).thenReturn(page);

        Page<?> r = adjustRoomService.find(1,5,"x");
        assertNotNull(r);
    }

}
