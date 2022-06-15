package com.g65.homespring.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.g65.homespring.bean.Log;
import com.g65.homespring.service.LogService;
import com.g65.homespring.mapper.LogMapper;
import org.springframework.stereotype.Service;

/**
 * @author LianJunhong
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log>
        implements LogService {

}




