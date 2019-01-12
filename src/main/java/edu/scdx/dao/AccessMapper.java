package edu.scdx.dao;

import edu.scdx.entity.AccessBean;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccessMapper {

    @Select("select * from `access_info` where phone=#{phone}")
    List<AccessBean> getAccessList(@Param("phone") String phone);

    @Select("select * from `access_info` where phone=#{phone} and `access_id`=#{access_id}")
    AccessBean getAccessInfo(@Param("phone") String phone, @Param("access_id") int access_id);

    @Select("select max(access_id) from `access_info` ")
    int getAccessId();

    @Insert("insert into access_info(phone,access_name,hostname,port,username,`password`,db_name,`table`,time_field,action_field) values(#{phone},#{access_name},#{hostname},#{port},#{username},#{password},#{db_name},#{table},#{time_field},#{action_field})")
    void addAccess(AccessBean accessBean);
}
