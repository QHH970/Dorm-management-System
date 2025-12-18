package com.example.springboot.service.impl;

import com.example.springboot.entity.DormRoom;
import com.example.springboot.mapper.DormRoomMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class DormRoomServiceImplTest {

    @Mock
    private DormRoomMapper dormRoomMapper;

    @InjectMocks
    private com.example.springboot.service.impl.DormRoomImpl dormRoomService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void addNewRoom_success() {
        DormRoom room = new DormRoom();
        room.setDormRoomId(101);
        when(dormRoomMapper.insert(any(DormRoom.class))).thenReturn(1);

        int res = dormRoomService.addNewRoom(room);
        assertEquals(1, res);
        verify(dormRoomMapper, times(1)).insert(room);
    }

    @Test
    void deleteRoom_notFound_returnsZero() {
        when(dormRoomMapper.deleteById(999)).thenReturn(0);
        int res = dormRoomService.deleteRoom(999);
        assertEquals(0, res);
        verify(dormRoomMapper,times(1)).deleteById(999);
    }
}
