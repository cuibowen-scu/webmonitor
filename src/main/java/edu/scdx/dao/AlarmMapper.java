package edu.scdx.dao;

import edu.scdx.entity.CostMethodInfoBean;
import edu.scdx.entity.UserProjectBean;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlarmMapper {

    @Select("select * from `user_project_info` where phone=#{phone} order by `project_id`")
    List<UserProjectBean> getUserProjects(@Param("phone") String phone);

    @Select("select * from `user_project_info` where phone=#{phone} and project_id=#{project_id} limit 1")
    UserProjectBean getUserProject(@Param("phone") String phone, @Param("project_id") String project_id);

    @Select("select * from `cost_method_info` where project_id=#{project_id} and flag!=2")
    List<CostMethodInfoBean> getProjectMethods(@Param("project_id") String project_id);

    @Select("select * from `cost_method_info` where project_id=#{project_id} and flag!=1")
    List<CostMethodInfoBean> getProjectParamMethods(String projectId);

    @Select("select * from `cost_method_info` where project_id=#{project_id}")
    List<CostMethodInfoBean> getAllProjectMethods(String projectId);
}