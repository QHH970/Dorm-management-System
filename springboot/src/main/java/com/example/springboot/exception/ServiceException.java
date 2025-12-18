package com.example.springboot.exception;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 极光
 * @date 2025/6/6 21:51
 * @description:
 */
@Data
@NoArgsConstructor
public class ServiceException extends RuntimeException{

    public ServiceException(String message) {
        super(message);
    }


}
