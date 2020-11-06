package com.hk.ssmdemo.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("t_user")
public class User {
    private int id;
    private String userName;
    private String realName;
    private int sex;
    private String mobile;
    private String email;
    private String note;

}
