package com.g65.homespring.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.g65.homespring.bean.User;
import com.g65.homespring.service.UserService;
import com.g65.homespring.mapper.UserMapper;
import org.springframework.stereotype.Service;

/**
 *
 * @author LianJunhong
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{

}




