package edu.scdx.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectMapper {

    @Select("insert into `user_project_info` (`phone`, `project_name`, `hostname`, `port`, `username`, `password`, `db_name`, " +
            "`cpu_need_warn`, `mem_need_warn`, `disk_need_warn`, `cpu_warn_num`, `mem_warn_num`, `disk_warn_num`) " +
            "VALUES (#{phone}, #{project_name}, #{hostname}, #{port},#{username}, #{password}, #{db_name}, #{cpu_need_warn}, #{mem_need_warn}, " +
            "#{disk_need_warn}, #{cpu_warn_num}, #{mem_warn_num}, #{disk_warn_num})")
    void addProject(@Param("phone") String phone, @Param("project_name") String project_name, @Param("hostname") String host,
                    @Param("port") String port, @Param("username") String user, @Param("password") String password,
                    @Param("db_name") String db, @Param("cpu_need_warn") String cpu_need, @Param("mem_need_warn") String mem_need,
                    @Param("disk_need_warn") String disk_need, @Param("cpu_warn_num") double cpu_alarm_num, @Param("mem_warn_num") double mem_alarm_num,
                    @Param("disk_warn_num") double disk_alarm_num);


    @Update("update `user_project_info` set project_name=#{project_name},hostname=#{hostname},port=#{port},username=#{username},password=#{password},db_name=#{db_name}," +
            "cpu_need_warn=#{cpu_need_warn},mem_need_warn=#{mem_need_warn},disk_need_warn=#{disk_need_warn},cpu_warn_num=#{cpu_warn_num}," +
            "mem_warn_num=#{mem_warn_num},disk_warn_num=#{disk_warn_num} where phone=#{phone} and project_id=#{project_id}")
    void updateProject(@Param("phone") String phone, @Param("project_id") String project_id, @Param("project_name") String project_name,
                       @Param("hostname") String host, @Param("port") String port, @Param("username") String user, @Param("password") String password,
                       @Param("db_name") String db, @Param("cpu_need_warn") String cpu_need, @Param("mem_need_warn") String mem_need,
                       @Param("disk_need_warn") String disk_need, @Param("cpu_warn_num") double cpu_alarm_num, @Param("mem_warn_num") double mem_alarm_num,
                       @Param("disk_warn_num") double disk_alarm_num);

    @Update("delete from `user_project_info` WHERE  project_id=#{project_id}")
    void deleteProject(@Param("project_id") int project_id);

    @Select("insert into `cost_method_info` (`project_id`, `method_class`, `method_name`, `if_cost_need_warn`, `cost_warn_num`, `flag`) " +
            "VALUES (#{project_id}, #{method_class}, #{method_name}, #{if_cost_need_warn},#{cost_warn_num}, #{flag})")
    void addProjectMethod(@Param("project_id") int project_id, @Param("method_class") String method_class, @Param("method_name") String method_name,
                          @Param("if_cost_need_warn") String cost_need_alarm, @Param("cost_warn_num") int cost_alarm_num, @Param("flag") int flag);

    @Update("update `cost_method_info` set method_class=#{method_class},method_name=#{method_name},if_cost_need_warn=#{if_cost_need_warn}," +
            "cost_warn_num=#{cost_warn_num},flag=#{flag} where method_id=#{method_id}")
    void updateProjectMethod(@Param("method_id") int method_id, @Param("method_class") String method_class, @Param("method_name") String method_name,
                             @Param("if_cost_need_warn") String cost_need_alarm, @Param("cost_warn_num") int cost_alarm_num, @Param("flag") int flag);

    @Update("delete from `cost_method_info` WHERE  method_id=#{method_id}")
    void deleteProjectMethod(@Param("method_id") int methodId);
}