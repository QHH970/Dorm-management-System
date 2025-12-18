package com.example.springboot.config;

import com.example.springboot.common.Result;
import com.example.springboot.exception.ServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author 极光
 * @date 2025/6/6 21:49
 * @description: 全局异常处理
 */
@RestControllerAdvice
public class GobalException {

    @ExceptionHandler(value = ServiceException.class)
    public Result<?> handleServiceException(Exception e){
        return Result.error("400",e.getMessage());
    }

    @ExceptionHandler(value = Exception.class)
    public Result<?> handleException(Exception e){
        e.printStackTrace();
        return Result.error("500",e.getMessage());
    }
}
