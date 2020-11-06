package com.hk.ssmdemo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.ssmdemo.domain.User;
import com.hk.ssmdemo.mapper.UserMapper;
import com.hk.ssmdemo.service.IUserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService{

}
