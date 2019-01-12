package edu.scdx.service;

public interface ProjectService {

    boolean addProject(String phone, String project_name, String host, String port, String user, String password, String db, String cpu_need, String mem_need, String disk_need, String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num);

    boolean updateProject(String phone, String project_id, String project_name, String host, String port, String user, String password, String db, String cpu_need, String mem_need, String disk_need, String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num);

    void deleteProject(String project_id);

    boolean addProjectMethod(String project_id, String method_class, String method_name, String need_cost_cal, String cost_need_alarm, String cost_alarm_num, String need_offline_param);

    boolean updateProjectMethod(String method_id, String method_class, String method_name, String need_cost_cal, String cost_need_alarm, String cost_alarm_num, String need_offline_param);

    void deleteProjectMethod(String methodId);
}