package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.AdjustRoom;
import com.example.springboot.mapper.AdjustRoomMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class AdjustRoomServiceImplTest {

    @Mock
    private AdjustRoomMapper adjustRoomMapper;

    @InjectMocks
    private AdjustRoomServiceImpl adjustRoomService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void addApply_success() {
        AdjustRoom adj = new AdjustRoom();
        adj.setUsername("stu1");
        when(adjustRoomMapper.insert(any(AdjustRoom.class))).thenReturn(1);

        int res = adjustRoomService.addApply(adj);

        assertEquals(1, res);
        verify(adjustRoomMapper, times(1)).insert(adj);
    }

    @Test
    void addApply_mapperThrows_exceptionPropagated() {
        AdjustRoom adj = new AdjustRoom();
        when(adjustRoomMapper.insert(any(AdjustRoom.class))).thenThrow(new RuntimeException("DB error"));

        RuntimeException ex = assertThrows(RuntimeException.class, () -> adjustRoomService.addApply(adj));
        assertTrue(ex.getMessage().contains("DB error"));
        verify(adjustRoomMapper, times(1)).insert(adj);
    }

    @Test
    void find_returnsPage() {
        Page<AdjustRoom> page = new Page<>(1,10);
        when(adjustRoomMapper.selectPage(any(Page.class), any())).thenReturn(page);

        Page<?> result = adjustRoomService.find(1,10,"stu");
        assertNotNull(result);
        verify(adjustRoomMapper, times(1)).selectPage(any(Page.class), any());
    }

    @Test
    void deleteAdjustment_nonExisting_returnsZero() {
        when(adjustRoomMapper.deleteById(999)).thenReturn(0);
        int res = adjustRoomService.deleteAdjustment(999);
        assertEquals(0, res);
        verify(adjustRoomMapper, times(1)).deleteById(999);
    }

    @Test
    void updateApply_success() {
        AdjustRoom adj = new AdjustRoom();
        adj.setId(1);
        when(adjustRoomMapper.updateById(adj)).thenReturn(1);

        int res = adjustRoomService.updateApply(adj);
        assertEquals(1, res);
        verify(adjustRoomMapper, times(1)).updateById(adj);
    }

}
