package edu.scdx.dao;

import edu.scdx.entity.UserInfoBean;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    @Select("select count(*) from user_info where phone = #{phone} and password=#{password}")
    int getUser(@Param("phone") String phone, @Param("password") String password);

    @Select("insert into user_info(phone,email,password) values(#{phone},#{email},#{password})")
    void addUser(@Param("phone") String phone, @Param("email") String email, @Param("password") String password);

    @Select("select * from user_info where phone = #{phone}")
    UserInfoBean getUserInfo(@Param("phone") String phone);

    @Update("update `user_info` set email=#{email},password=#{password} where phone=#{phone}")
    void updateUserInfo(@Param("phone") String phone, @Param("email") String email, @Param("password") String password);
}