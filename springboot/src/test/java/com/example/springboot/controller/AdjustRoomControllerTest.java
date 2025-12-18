package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.AdjustRoom;
import com.example.springboot.service.AdjustRoomService;
import com.example.springboot.service.DormRoomService;
import com.example.springboot.mapper.AdjustRoomMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(AdjustRoomController.class)
class AdjustRoomControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private AdjustRoomService adjustRoomService;

    @MockBean
    private DormRoomService dormRoomService;

    // Mock MyBatis mapper to prevent MyBatis from trying to initialize a real mapper
    @MockBean
    private AdjustRoomMapper adjustRoomMapper;

    @Test
    void postAdd_success() throws Exception {
        AdjustRoom adj = new AdjustRoom();
        adj.setUsername("stu1");
        when(adjustRoomService.addApply(any(AdjustRoom.class))).thenReturn(1);

        mockMvc.perform(post("/adjustRoom/add")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(adj)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value("0"));
    }

    @Test
    void putUpdate_whenDormRoomServiceReturnsMinus2_thenErrorReturned() throws Exception {
        AdjustRoom adj = new AdjustRoom();
        adj.setId(1);
        when(dormRoomService.adjustRoomUpdate(any(AdjustRoom.class))).thenReturn(-2);
        when(adjustRoomService.updateApply(any(AdjustRoom.class))).thenReturn(0);

        mockMvc.perform(put("/adjustRoom/update/true")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(adj)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value("-1"));
    }

    @Test
    void deleteNotFound_returnsError() throws Exception {
        when(adjustRoomService.deleteAdjustment(999)).thenReturn(0);

        mockMvc.perform(delete("/adjustRoom/delete/999"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value("-1"));
    }

    @Test
    void find_returnsPage() throws Exception {
        when(adjustRoomService.find(1,10,"")).thenReturn(new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>());

        mockMvc.perform(get("/adjustRoom/find").param("pageNum","1").param("pageSize","10"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value("0"));
    }
}
